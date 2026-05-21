set script_path [string map [list "\\" "/"] [info script]]
if {[file pathtype $script_path] eq "relative"} {
    set script_path [file normalize [file join [pwd] $script_path]]
} else {
    set script_path [file normalize $script_path]
}
set script_dir [file dirname $script_path]
set repo_dir ""
foreach candidate [list \
    [file normalize [file join $script_dir ..]] \
    [file normalize [pwd]] \
    [file normalize [file join [pwd] DSD_final_project]] \
    {C:/Users/User/DSD_Lab/Final/DSD_final_project} \
] {
    if {[file exists [file join $candidate RISCV_CNN.v]]} {
        set repo_dir $candidate
        break
    }
}
if {$repo_dir eq ""} {
    error "Cannot locate DSD_final_project repo containing RISCV_CNN.v"
}

proc run_and_stream {cmd} {
    set cmdline [join $cmd " "]
    puts "RUN: $cmdline"
    set pipe [open "|$cmdline 2>@1" r]
    while {[gets $pipe line] >= 0} {
        puts $line
    }
    if {[catch {close $pipe} result opts]} {
        set code [dict get $opts -errorcode]
        error "Command failed ($code): $cmdline\n$result"
    }
}

set part_name xc7a35tcsg324-1
set work_dir [file join $repo_dir tmp post_synth_fast_work]
set sim_dir [file join $repo_dir tmp post_synth_fast_xsim]
set netlist_file [file join $sim_dir RISCV_CNN_func_synth.v]
set ip_gen_dir [file join $repo_dir final final.gen sources_1 ip]
file mkdir $work_dir
file mkdir $sim_dir

foreach mif_name {golden_rom init_rom Instruction_Memory} {
    file copy -force \
        [file join $ip_gen_dir $mif_name ${mif_name}.mif] \
        [file join $work_dir ${mif_name}.mif]
    file copy -force \
        [file join $ip_gen_dir $mif_name ${mif_name}.mif] \
        [file join $sim_dir ${mif_name}.mif]
}

cd $work_dir
set_param general.maxThreads 1
read_vhdl -library blk_mem_gen_v8_4_5 [file join $ip_gen_dir Data_mem hdl blk_mem_gen_v8_4_vhsyn_rfs.vhd]
foreach ip_name {Data_mem Instruction_Memory init_rom golden_rom} {
    read_vhdl [file join $ip_gen_dir $ip_name synth ${ip_name}.vhd]
}
read_verilog [list \
    [file join $repo_dir test_circuit_bram_ip.v] \
    [file join $repo_dir RISCV_CNN.v] \
]
read_xdc [file join $repo_dir constraints RISCV_CNN.xdc]
synth_design -top RISCV_CNN -part $part_name
write_verilog -mode funcsim -force -file $netlist_file

cd $sim_dir

set xvlog {C:/Xilinx/Vivado/2022.1/bin/xvlog.bat}
set xelab {C:/Xilinx/Vivado/2022.1/bin/xelab.bat}
set xsim  {C:/Xilinx/Vivado/2022.1/bin/xsim.bat}
set glbl [file normalize {C:/Xilinx/Vivado/2022.1/data/verilog/src/glbl.v}]

run_and_stream [list $xvlog $netlist_file]
run_and_stream [list $xvlog \
    -d POST_SYNTH_DISPLAY_CHECK \
    -d POST_SYNTH_FAST_START \
    -d POST_SYNTH_SCORE_ONLY \
    -d TB_PROGRESS \
    [file join $repo_dir tb tb_finalproject.v]]
run_and_stream [list $xvlog $glbl]
run_and_stream [list $xelab tb_finalproject glbl -L unisims_ver -L unimacro_ver -L secureip --timescale 1ns/1ps -debug typical -s tb_post_synth_fast_func]
run_and_stream [list $xsim tb_post_synth_fast_func -runall]
