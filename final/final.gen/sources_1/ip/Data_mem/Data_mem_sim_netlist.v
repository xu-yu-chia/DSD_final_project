// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sat May 16 01:35:04 2026
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/User/DSD_Lab/Final/DSD_final_project/final/final.gen/sources_1/ip/Data_mem/Data_mem_sim_netlist.v
// Design      : Data_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Data_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module Data_mem
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.2618 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "Data_mem.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Data_mem_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28976)
`pragma protect data_block
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
rifmlck5AkDFhc6xBkxlrobFoeg=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
