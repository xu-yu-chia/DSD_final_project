set script_path [string map [list "\\" "/"] [info script]]
if {[file pathtype $script_path] eq "relative"} {
    set script_path [file normalize [file join [pwd] $script_path]]
} else {
    set script_path [file normalize $script_path]
}
set script_dir [file dirname $script_path]
set repo_dir [file normalize [file join $script_dir ..]]
if {![file exists [file join $repo_dir RISCV_CNN.v]] && [file exists [file join [pwd] RISCV_CNN.v]]} {
    set repo_dir [file normalize [pwd]]
}
if {![file exists [file join $repo_dir RISCV_CNN.v]] && [file exists [file join [pwd] DSD_final_project RISCV_CNN.v]]} {
    set repo_dir [file normalize [file join [pwd] DSD_final_project]]
}
if {![file exists [file join $repo_dir RISCV_CNN.v]]} {
    set repo_dir {C:/Users/User/DSD_Lab/Final/DSD_final_project}
}
puts "FinalProject repo_dir: $repo_dir"
set project_dir [file join $repo_dir vivado_finalproject]
set part_name xc7a35tcsg324-1

create_project -force finalproject $project_dir -part $part_name
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]
set_property default_lib xil_defaultlib [current_project]

add_files -fileset sources_1 [list \
    [file join $repo_dir RISCV_CNN.v] \
    [file join $repo_dir test_circuit_bram_ip.v] \
]
add_files -fileset constrs_1 [file join $repo_dir constraints RISCV_CNN.xdc]
add_files -fileset sim_1 [file join $repo_dir tb tb_finalproject.v]

set_property top RISCV_CNN [get_filesets sources_1]
set_property top tb_finalproject [get_filesets sim_1]

proc make_bram_ip {name dict_values} {
    create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name $name
    set_property -dict $dict_values [get_ips $name]
    generate_target all [get_ips $name]
}

make_bram_ip Data_mem [list \
    CONFIG.Component_Name {Data_mem} \
    CONFIG.Memory_Type {True_Dual_Port_RAM} \
    CONFIG.Write_Width_A {32} \
    CONFIG.Write_Depth_A {1024} \
    CONFIG.Read_Width_A {32} \
    CONFIG.Write_Width_B {32} \
    CONFIG.Read_Width_B {32} \
    CONFIG.Operating_Mode_A {READ_FIRST} \
    CONFIG.Operating_Mode_B {READ_FIRST} \
    CONFIG.Enable_A {Use_ENA_Pin} \
    CONFIG.Enable_B {Use_ENB_Pin} \
    CONFIG.Use_Byte_Write_Enable {false} \
    CONFIG.Byte_Size {8} \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
    CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
    CONFIG.Use_RSTA_Pin {false} \
    CONFIG.Use_RSTB_Pin {false} \
]

make_bram_ip instr_mem [list \
    CONFIG.Component_Name {instr_mem} \
    CONFIG.Memory_Type {Single_Port_ROM} \
    CONFIG.Write_Width_A {32} \
    CONFIG.Write_Depth_A {256} \
    CONFIG.Read_Width_A {32} \
    CONFIG.Operating_Mode_A {READ_FIRST} \
    CONFIG.Enable_A {Use_ENA_Pin} \
    CONFIG.Load_Init_File {true} \
    CONFIG.Coe_File [file join $repo_dir instr_mem_cpucheck.coe] \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
]

make_bram_ip init_rom [list \
    CONFIG.Component_Name {init_rom} \
    CONFIG.Memory_Type {Single_Port_ROM} \
    CONFIG.Write_Width_A {32} \
    CONFIG.Write_Depth_A {10240} \
    CONFIG.Read_Width_A {32} \
    CONFIG.Operating_Mode_A {READ_FIRST} \
    CONFIG.Enable_A {Use_ENA_Pin} \
    CONFIG.Load_Init_File {true} \
    CONFIG.Coe_File [file join $repo_dir init_rom.coe] \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
]

make_bram_ip golden_rom [list \
    CONFIG.Component_Name {golden_rom} \
    CONFIG.Memory_Type {Single_Port_ROM} \
    CONFIG.Write_Width_A {32} \
    CONFIG.Write_Depth_A {4096} \
    CONFIG.Read_Width_A {32} \
    CONFIG.Operating_Mode_A {READ_FIRST} \
    CONFIG.Enable_A {Use_ENA_Pin} \
    CONFIG.Load_Init_File {true} \
    CONFIG.Coe_File [file join $repo_dir golden_rom.coe] \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
]

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "Created project: [file join $project_dir finalproject.xpr]"
puts "Bitstream generation is intentionally not part of this script."
