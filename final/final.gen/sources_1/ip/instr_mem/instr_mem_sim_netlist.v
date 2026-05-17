// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sat May 16 01:35:04 2026
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/User/DSD_Lab/Final/DSD_final_project/final/final.gen/sources_1/ip/instr_mem/instr_mem_sim_netlist.v
// Design      : instr_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "instr_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module instr_mem
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
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
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.375199 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
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
  (* C_INIT_FILE = "instr_mem.mem" *) 
  (* C_INIT_FILE_NAME = "instr_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
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
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  instr_mem_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19136)
`pragma protect data_block
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
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
