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
    error "Cannot locate FinalProject repo containing RISCV_CNN.v"
}

set project_path [file join $repo_dir final final.xpr]
if {![file exists $project_path]} {
    error "Vivado project not found: $project_path"
}

puts "Updating Vivado project: $project_path"
open_project $project_path

set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]
set_property default_lib xil_defaultlib [current_project]

proc add_file_once {fileset_name file_path} {
    if {![file exists $file_path]} {
        error "Missing file: $file_path"
    }
    set existing [get_files -quiet $file_path]
    if {[llength $existing] == 0} {
        add_files -norecurse -fileset $fileset_name [list $file_path]
    }
}

add_file_once sources_1 [file join $repo_dir RISCV_CNN.v]
add_file_once sources_1 [file join $repo_dir test_circuit_bram_ip.v]
add_file_once sources_1 [file join $repo_dir src student_fp_core.v]
add_file_once constrs_1 [file join $repo_dir constraints RISCV_CNN.xdc]
add_file_once sim_1 [file join $repo_dir tb tb_finalproject.v]

set_property top RISCV_CNN [get_filesets sources_1]
set_property top tb_finalproject [get_filesets sim_1]

set legacy_ip [get_files -quiet [file join $repo_dir final final.srcs sources_1 ip blk_mem_gen_0 blk_mem_gen_0.xci]]
if {[llength $legacy_ip] != 0} {
    remove_files $legacy_ip
}

proc ensure_bram_ip {name dict_values} {
    set ip_obj [get_ips -quiet $name]
    if {[llength $ip_obj] == 0} {
        create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name $name
        set ip_obj [get_ips $name]
    }
    set_property -dict $dict_values $ip_obj
    generate_target all $ip_obj
    export_ip_user_files -of_objects $ip_obj -no_script -sync -force -quiet
}

ensure_bram_ip Data_mem [list \
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

ensure_bram_ip instr_mem [list \
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

ensure_bram_ip init_rom [list \
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

ensure_bram_ip golden_rom [list \
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
close_project

puts "Project updated. Open this project in Vivado:"
puts $project_path
puts "Bitstream generation is intentionally not part of this script."
