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

set project_name final_backup
set project_dir [file join $repo_dir final_backup]
set part_name xc7a35tcsg324-1

if {[file exists $project_dir]} {
    error "Backup project already exists: $project_dir"
}

file mkdir $project_dir
set local_src_dir [file join $project_dir local_sources]
set local_constr_dir [file join $project_dir local_constraints]
set local_mem_dir [file join $project_dir mem_init_files]
file mkdir $local_src_dir
file mkdir $local_constr_dir
file mkdir $local_mem_dir

file copy -force [file join $repo_dir RISCV_CNN.v] [file join $local_src_dir RISCV_CNN.v]
file copy -force [file join $repo_dir test_circuit_bram_ip.v] [file join $local_src_dir test_circuit_bram_ip.v]
file copy -force [file join $repo_dir constraints RISCV_CNN.xdc] [file join $local_constr_dir RISCV_CNN.xdc]
file copy -force [file join $repo_dir instr_mem_cpucheck.coe] [file join $local_mem_dir instr_mem_cpucheck.coe]
file copy -force [file join $repo_dir init_rom.coe] [file join $local_mem_dir init_rom.coe]
file copy -force [file join $repo_dir golden_rom.coe] [file join $local_mem_dir golden_rom.coe]

create_project $project_name $project_dir -part $part_name
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]
set_property default_lib xil_defaultlib [current_project]

add_files -norecurse -fileset sources_1 [list \
    [file join $local_src_dir RISCV_CNN.v] \
    [file join $local_src_dir test_circuit_bram_ip.v] \
]
add_files -norecurse -fileset constrs_1 [file join $local_constr_dir RISCV_CNN.xdc]

set_property top RISCV_CNN [get_filesets sources_1]

proc make_bram_ip {name dict_values} {
    create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name $name
    set_property -dict $dict_values [get_ips $name]
    generate_target all [get_ips $name]
    export_ip_user_files -of_objects [get_ips $name] -no_script -sync -force -quiet
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
    CONFIG.Byte_Size {9} \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
    CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
    CONFIG.Use_RSTA_Pin {false} \
    CONFIG.Use_RSTB_Pin {false} \
]

make_bram_ip Instruction_Memory [list \
    CONFIG.Component_Name {Instruction_Memory} \
    CONFIG.Memory_Type {Single_Port_ROM} \
    CONFIG.Write_Width_A {32} \
    CONFIG.Write_Depth_A {1024} \
    CONFIG.Read_Width_A {32} \
    CONFIG.Operating_Mode_A {WRITE_FIRST} \
    CONFIG.Enable_A {Always_Enabled} \
    CONFIG.Load_Init_File {true} \
    CONFIG.Coe_File [file join $local_mem_dir instr_mem_cpucheck.coe] \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
]

make_bram_ip init_rom [list \
    CONFIG.Component_Name {init_rom} \
    CONFIG.Memory_Type {Single_Port_ROM} \
    CONFIG.Write_Width_A {32} \
    CONFIG.Write_Depth_A {10240} \
    CONFIG.Read_Width_A {32} \
    CONFIG.Operating_Mode_A {WRITE_FIRST} \
    CONFIG.Enable_A {Use_ENA_Pin} \
    CONFIG.Load_Init_File {true} \
    CONFIG.Coe_File [file join $local_mem_dir init_rom.coe] \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
]

make_bram_ip golden_rom [list \
    CONFIG.Component_Name {golden_rom} \
    CONFIG.Memory_Type {Single_Port_ROM} \
    CONFIG.Write_Width_A {32} \
    CONFIG.Write_Depth_A {2156} \
    CONFIG.Read_Width_A {32} \
    CONFIG.Operating_Mode_A {WRITE_FIRST} \
    CONFIG.Enable_A {Use_ENA_Pin} \
    CONFIG.Load_Init_File {true} \
    CONFIG.Coe_File [file join $local_mem_dir golden_rom.coe] \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
]

update_compile_order -fileset sources_1
close_project

puts "Created self-contained backup project:"
puts [file join $project_dir ${project_name}.xpr]
