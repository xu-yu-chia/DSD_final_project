// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun May 24 15:31:05 2026
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/User/DSD_Lab/Final/DSD_final_project/final/final.gen/sources_1/ip/Instruction_Memory/Instruction_Memory_sim_netlist.v
// Design      : Instruction_Memory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Instruction_Memory,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module Instruction_Memory
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
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
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
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
  (* C_INIT_FILE = "Instruction_Memory.mem" *) 
  (* C_INIT_FILE_NAME = "Instruction_Memory.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Instruction_Memory_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
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
        .wea(1'b0),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27200)
`pragma protect data_block
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
c+nEC3fPsxb+tIs=
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
