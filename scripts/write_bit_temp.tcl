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

set part_name xc7a35tcsg324-1
set ip_gen_dir [file join $repo_dir final final.gen sources_1 ip]
set bit_dir [file join $repo_dir final bit_temp]
set work_dir [file join $repo_dir tmp bit_temp_work]
set report_dir [file join $repo_dir reports bit_temp]
file mkdir $bit_dir
file mkdir $work_dir
file mkdir $report_dir

if {[info exists ::env(BIT_LABEL)] && $::env(BIT_LABEL) ne ""} {
    set label $::env(BIT_LABEL)
} else {
    set label "manual"
}
set stamp [clock format [clock seconds] -format "%Y%m%d_%H%M%S"]
set out_base [file join $bit_dir "${label}_${stamp}"]

foreach mif_name {golden_rom init_rom Instruction_Memory} {
    file copy -force \
        [file join $ip_gen_dir $mif_name ${mif_name}.mif] \
        [file join $work_dir ${mif_name}.mif]
}

cd $work_dir
set_param general.maxThreads 1

puts "BIT_TEMP: reading RTL and IP netlists"
read_vhdl -library blk_mem_gen_v8_4_5 [file join $ip_gen_dir Data_mem hdl blk_mem_gen_v8_4_vhsyn_rfs.vhd]
foreach ip_name {Data_mem Instruction_Memory init_rom golden_rom} {
    read_vhdl [file join $ip_gen_dir $ip_name synth ${ip_name}.vhd]
}
read_verilog [list \
    [file join $repo_dir test_circuit_bram_ip.v] \
    [file join $repo_dir RISCV_CNN.v] \
]
read_xdc [file join $repo_dir constraints RISCV_CNN.xdc]

puts "BIT_TEMP: synth_design"
synth_design -top RISCV_CNN -part $part_name
report_utilization -file [file join $report_dir "${label}_${stamp}_utilization_synth.rpt"]
report_timing_summary -file [file join $report_dir "${label}_${stamp}_timing_synth.rpt"]

puts "BIT_TEMP: implementation"
opt_design
place_design -directive Explore
phys_opt_design -directive AggressiveExplore
route_design -directive NoTimingRelaxation
phys_opt_design -directive AggressiveExplore
route_design -directive NoTimingRelaxation
report_utilization -file [file join $report_dir "${label}_${stamp}_utilization_impl.rpt"]
report_timing_summary -file [file join $report_dir "${label}_${stamp}_timing_impl.rpt"]
report_route_status -file [file join $report_dir "${label}_${stamp}_route_status.rpt"]

puts "BIT_TEMP: write_bitstream"
write_bitstream -force "${out_base}.bit"
write_checkpoint -force "${out_base}.dcp"

set manifest [open "${out_base}.txt" w]
puts $manifest "label=$label"
puts $manifest "timestamp=$stamp"
puts $manifest "bitstream=${out_base}.bit"
puts $manifest "checkpoint=${out_base}.dcp"
puts $manifest "source_repo=$repo_dir"
close $manifest

puts "BIT_TEMP_DONE bitstream=${out_base}.bit"
