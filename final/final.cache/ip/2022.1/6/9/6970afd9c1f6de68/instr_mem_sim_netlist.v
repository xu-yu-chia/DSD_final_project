// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sat May 16 01:35:03 2026
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ instr_mem_sim_netlist.v
// Design      : instr_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "instr_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19200)
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
