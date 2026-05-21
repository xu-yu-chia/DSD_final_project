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
set report_dir [file join $repo_dir reports]
set work_dir [file join $repo_dir tmp post_impl_fast_work]
set sim_dir [file join $repo_dir tmp post_impl_fast_xsim]
set netlist_file [file join $sim_dir RISCV_CNN_time_impl.v]
set sdf_file [file join $sim_dir RISCV_CNN_time_impl.sdf]
set ip_gen_dir [file join $repo_dir final final.gen sources_1 ip]
file mkdir $report_dir
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
puts "POST_IMPL_FAST: reading RTL and IP netlists"
read_vhdl -library blk_mem_gen_v8_4_5 [file join $ip_gen_dir Data_mem hdl blk_mem_gen_v8_4_vhsyn_rfs.vhd]
foreach ip_name {Data_mem Instruction_Memory init_rom golden_rom} {
    read_vhdl [file join $ip_gen_dir $ip_name synth ${ip_name}.vhd]
}
read_verilog [list \
    [file join $repo_dir test_circuit_bram_ip.v] \
    [file join $repo_dir RISCV_CNN.v] \
]
read_xdc [file join $repo_dir constraints RISCV_CNN.xdc]

puts "POST_IMPL_FAST: synth_design"
synth_design -top RISCV_CNN -part $part_name
report_utilization -file [file join $report_dir utilization_post_impl_fast_synth.rpt]
report_timing_summary -file [file join $report_dir timing_post_impl_fast_synth.rpt]

puts "POST_IMPL_FAST: implementation"
opt_design
place_design -directive Explore
phys_opt_design -directive AggressiveExplore
route_design -directive NoTimingRelaxation
phys_opt_design -directive AggressiveExplore
route_design -directive NoTimingRelaxation
report_utilization -file [file join $report_dir utilization_post_impl_fast_impl.rpt]
report_timing_summary -file [file join $report_dir timing_post_impl_fast_impl.rpt]
report_route_status -file [file join $report_dir route_status_post_impl_fast.rpt]

puts "POST_IMPL_FAST: writing timing netlist and SDF"
write_verilog -mode timesim -nolib -sdf_anno true -force -file $netlist_file
write_sdf -mode timesim -process_corner slow -force -file $sdf_file

cd $sim_dir
set xvlog {C:/Xilinx/Vivado/2022.1/bin/xvlog.bat}
set xelab {C:/Xilinx/Vivado/2022.1/bin/xelab.bat}
set xsim  {C:/Xilinx/Vivado/2022.1/bin/xsim.bat}
set glbl [file normalize {C:/Xilinx/Vivado/2022.1/data/verilog/src/glbl.v}]

puts "POST_IMPL_FAST: xsim compile"
run_and_stream [list $xvlog --relax $netlist_file]
run_and_stream [list $xvlog \
    -d POST_IMPL_DISPLAY_CHECK \
    -d POST_IMPL_FAST_START \
    -d POST_IMPL_SCORE_ONLY \
    -d POST_IMPL_FAST_SCAN \
    -d TB_PROGRESS \
    [file join $repo_dir tb tb_finalproject.v]]
run_and_stream [list $xvlog --relax $glbl]

puts "POST_IMPL_FAST: xsim elaborate"
run_and_stream [list $xelab \
    --debug off \
    --relax \
    --maxdelay \
    -L simprims_ver \
    -L secureip \
    --timescale 1ns/1ps \
    -transport_int_delays \
    -pulse_r 0 \
    -pulse_int_r 0 \
    -pulse_e 0 \
    -pulse_int_e 0 \
    --snapshot tb_post_impl_fast_time \
    tb_finalproject glbl]

puts "POST_IMPL_FAST: xsim run"
run_and_stream [list $xsim tb_post_impl_fast_time -runall]
