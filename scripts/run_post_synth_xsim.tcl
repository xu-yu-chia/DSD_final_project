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

set proj_file [file join $repo_dir final final.xpr]
set sim_dir [file join $repo_dir tmp post_synth_xsim]
set netlist_file [file join $sim_dir RISCV_CNN_func_synth.v]
file mkdir $sim_dir

set checks_script_dir $script_dir
set checks_repo_dir $repo_dir
source [file join $repo_dir scripts update_final_project.tcl]
set script_dir $checks_script_dir
set repo_dir $checks_repo_dir

open_project $proj_file
set_param general.maxThreads 1

reset_run synth_1
launch_runs synth_1 -jobs 1
wait_on_run synth_1

open_run synth_1 -name post_synth_run
write_verilog -mode funcsim -force -file $netlist_file
close_project

foreach mif_name {golden_rom init_rom Instruction_Memory} {
    file copy -force \
        [file join $repo_dir final final.gen sources_1 ip $mif_name ${mif_name}.mif] \
        [file join $sim_dir ${mif_name}.mif]
}

cd $sim_dir

set xvlog {C:/Xilinx/Vivado/2022.1/bin/xvlog.bat}
set xelab {C:/Xilinx/Vivado/2022.1/bin/xelab.bat}
set xsim  {C:/Xilinx/Vivado/2022.1/bin/xsim.bat}
set glbl [file normalize {C:/Xilinx/Vivado/2022.1/data/verilog/src/glbl.v}]

puts [exec -- $xvlog $netlist_file]
puts [exec -- $xvlog [file join $repo_dir tb tb_finalproject.v]]
puts [exec -- $xvlog $glbl]
puts [exec -- $xelab tb_finalproject glbl -L unisims_ver -L unimacro_ver -L secureip --timescale 1ns/1ps -debug typical -s tb_post_synth_func]
puts [exec -- $xsim tb_post_synth_func -runall]
