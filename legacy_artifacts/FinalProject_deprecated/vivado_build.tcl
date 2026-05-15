# Build from this directory with:
# vivado -mode batch -source vivado_build.tcl

set script_dir [file dirname [file normalize [info script]]]
if {![file exists [file join $script_dir studID_name_FP.v]]} {
    set script_dir [pwd]
}
if {![file exists [file join $script_dir studID_name_FP.v]]} {
    set script_dir "C:/Users/User/DSD_Lab/Final"
}
cd $script_dir

set report_dir [file join $script_dir reports]
set checkpoint_dir [file join $script_dir checkpoints]
file mkdir $report_dir
file mkdir $checkpoint_dir

set_param general.maxThreads 1

read_verilog [file join $script_dir studID_name_FP.v]
read_xdc [file join $script_dir RISCV_CNN.xdc]

synth_design -top RISCV_CNN -part xc7a35tcsg324-1
write_checkpoint -force [file join $checkpoint_dir post_synth.dcp]
report_utilization -file [file join $report_dir utilization_synth.rpt]
report_timing_summary -file [file join $report_dir timing_synth.rpt]

opt_design
place_design
phys_opt_design
route_design

write_checkpoint -force [file join $checkpoint_dir post_route.dcp]
report_utilization -file [file join $report_dir utilization_impl.rpt]
report_timing_summary -file [file join $report_dir timing_impl.rpt]
report_route_status -file [file join $report_dir route_status.rpt]
write_bitstream -force [file join $script_dir FP_studID.bit]

puts "Build complete."
puts "Bitstream: [file join $script_dir FP_studID.bit]"
puts "Reports directory: $report_dir"
