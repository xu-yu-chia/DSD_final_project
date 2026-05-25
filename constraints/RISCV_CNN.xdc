# EGO1 / xc7a35tcsg324-1 constraints for the final project top module.

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property PACKAGE_PIN P17 [get_ports FPGA_clk]
create_clock -name sys_clk -period 10.000 [get_ports FPGA_clk]

set_property PACKAGE_PIN P15 [get_ports rstn]
set_property PACKAGE_PIN R15 [get_ports st]
set_property PACKAGE_PIN P5  [get_ports mode]

set_property PACKAGE_PIN R1 [get_ports {tc[0]}]
set_property PACKAGE_PIN N4 [get_ports {tc[1]}]
set_property PACKAGE_PIN M4 [get_ports {tc[2]}]
set_property PACKAGE_PIN R2 [get_ports {tc[3]}]

set_property PACKAGE_PIN B4 [get_ports {seven_seg[6]}]
set_property PACKAGE_PIN A4 [get_ports {seven_seg[5]}]
set_property PACKAGE_PIN A3 [get_ports {seven_seg[4]}]
set_property PACKAGE_PIN B1 [get_ports {seven_seg[3]}]
set_property PACKAGE_PIN A1 [get_ports {seven_seg[2]}]
set_property PACKAGE_PIN B3 [get_ports {seven_seg[1]}]
set_property PACKAGE_PIN B2 [get_ports {seven_seg[0]}]

set_property PACKAGE_PIN H1 [get_ports {anode[0]}]
set_property PACKAGE_PIN C1 [get_ports {anode[1]}]
set_property PACKAGE_PIN C2 [get_ports {anode[2]}]
set_property PACKAGE_PIN G2 [get_ports {anode[3]}]

set_property PACKAGE_PIN K2 [get_ports all_done]

set_property IOSTANDARD LVCMOS33 [get_ports {
    FPGA_clk rstn st mode all_done
    tc[0] tc[1] tc[2] tc[3]
    seven_seg[0] seven_seg[1] seven_seg[2] seven_seg[3]
    seven_seg[4] seven_seg[5] seven_seg[6]
    anode[0] anode[1] anode[2] anode[3]
}]
