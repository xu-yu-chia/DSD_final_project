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
    {C:/Users/User/DSD_Lab/FinalProject} \
] {
    if {[file exists [file join $candidate RISCV_CNN.v]]} {
        set repo_dir $candidate
        break
    }
}
if {$repo_dir eq ""} {
    error "Cannot locate DSD_final_project repo containing RISCV_CNN.v"
}

set proj_dir [file join $repo_dir final]
set sim_dir [file join $proj_dir final.sim sim_1 behav xsim_manual]
file mkdir $sim_dir

foreach mif_name {golden_rom init_rom instr_mem} {
    file copy -force \
        [file join $proj_dir final.gen sources_1 ip $mif_name ${mif_name}.mif] \
        [file join $sim_dir ${mif_name}.mif]
}

cd $sim_dir

set ipstatic [file join $proj_dir final.gen sources_1 ip Data_mem simulation blk_mem_gen_v8_4.v]
set glbl [file normalize {C:/Xilinx/Vivado/2022.1/data/verilog/src/glbl.v}]
set xvlog {C:/Xilinx/Vivado/2022.1/bin/xvlog.bat}
set xelab {C:/Xilinx/Vivado/2022.1/bin/xelab.bat}
set xsim  {C:/Xilinx/Vivado/2022.1/bin/xsim.bat}

puts [exec -- $xvlog $ipstatic]
puts [exec -- $xvlog [file join $proj_dir final.gen sources_1 ip Data_mem sim Data_mem.v]]
puts [exec -- $xvlog [file join $proj_dir final.gen sources_1 ip instr_mem sim instr_mem.v]]
puts [exec -- $xvlog [file join $proj_dir final.gen sources_1 ip init_rom sim init_rom.v]]
puts [exec -- $xvlog [file join $proj_dir final.gen sources_1 ip golden_rom sim golden_rom.v]]
puts [exec -- $xvlog [file join $repo_dir test_circuit_bram_ip.v]]
puts [exec -- $xvlog [file join $repo_dir src student_fp_core.v]]
puts [exec -- $xvlog [file join $repo_dir RISCV_CNN.v]]
puts [exec -- $xvlog [file join $repo_dir tb tb_finalproject.v]]
puts [exec -- $xvlog $glbl]

puts [exec -- $xelab tb_finalproject glbl --timescale 1ns/1ps -debug typical -s tb_finalproject_sim]
puts [exec -- $xsim tb_finalproject_sim -runall]
