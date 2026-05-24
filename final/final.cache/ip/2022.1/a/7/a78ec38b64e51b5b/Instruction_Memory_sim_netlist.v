// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun May 24 15:31:04 2026
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Instruction_Memory_sim_netlist.v
// Design      : Instruction_Memory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Instruction_Memory,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27168)
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
