set script_path [info script]
set repo_dir {C:/Users/User/DSD_Lab/FinalProject}
if {![file exists [file join $repo_dir RISCV_CNN.v]]} {
    error "Cannot locate FinalProject repo containing RISCV_CNN.v"
}
set script_dir [file join $repo_dir scripts]

set checks_script_dir $script_dir
set checks_repo_dir $repo_dir
source [file join $script_dir update_final_project.tcl]
set script_dir $checks_script_dir
set repo_dir $checks_repo_dir

set report_dir [file join $repo_dir reports]
file mkdir $report_dir

source [file join $script_dir run_rtl_xsim.tcl]
set work_dir [file join $repo_dir codex_temp vivado_work]
file mkdir $work_dir
cd $work_dir

set part_name xc7a35tcsg324-1
set_param general.maxThreads 1
set ip_gen_dir [file join $repo_dir final final.gen sources_1 ip]
foreach mif_name {golden_rom init_rom instr_mem} {
    file copy -force \
        [file join $ip_gen_dir $mif_name ${mif_name}.mif] \
        [file join $work_dir ${mif_name}.mif]
}
read_vhdl -library blk_mem_gen_v8_4_5 [file join $ip_gen_dir Data_mem hdl blk_mem_gen_v8_4_vhsyn_rfs.vhd]
foreach ip_name {Data_mem instr_mem init_rom golden_rom} {
    read_vhdl [file join $ip_gen_dir $ip_name synth ${ip_name}.vhd]
}
read_verilog [list \
    [file join $repo_dir test_circuit_bram_ip.v] \
    [file join $repo_dir src student_fp_core.v] \
    [file join $repo_dir RISCV_CNN.v] \
]
read_xdc [file join $repo_dir constraints RISCV_CNN.xdc]
synth_design -top RISCV_CNN -part $part_name
report_utilization -file [file join $report_dir utilization_synth.rpt]
report_timing_summary -file [file join $report_dir timing_synth.rpt]

opt_design
place_design -directive Explore
phys_opt_design -directive AggressiveExplore
route_design -directive Explore
report_utilization -file [file join $report_dir utilization_impl.rpt]
report_timing_summary -file [file join $report_dir timing_impl.rpt]
report_route_status -file [file join $report_dir route_status.rpt]

puts "Checks complete. Reports: $report_dir"
puts "No write_bitstream command was run."
