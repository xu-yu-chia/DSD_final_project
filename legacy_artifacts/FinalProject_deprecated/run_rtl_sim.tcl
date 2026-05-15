# Run from this directory with:
# vivado -mode batch -source run_rtl_sim.tcl

set script_dir [file dirname [file normalize [info script]]]
if {![file exists [file join $script_dir studID_name_FP.v]]} {
    set script_dir [pwd]
}
if {![file exists [file join $script_dir studID_name_FP.v]]} {
    set script_dir "C:/Users/User/DSD_Lab/Final"
}
cd $script_dir

xvlog studID_name_FP.v tb_riscv_cnn.v
xelab tb_riscv_cnn -debug typical -s tb_riscv_cnn_sim
xsim tb_riscv_cnn_sim -runall
