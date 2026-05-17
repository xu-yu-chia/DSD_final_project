// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sat May 16 01:35:06 2026
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/User/DSD_Lab/Final/DSD_final_project/final/final.gen/sources_1/ip/golden_rom/golden_rom_sim_netlist.v
// Design      : golden_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "golden_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module golden_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [11:0]addra;
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
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "4" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     9.305599 mW" *) 
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
  (* C_INIT_FILE = "golden_rom.mem" *) 
  (* C_INIT_FILE_NAME = "golden_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
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
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  golden_rom_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 79360)
`pragma protect data_block
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
9Xdi8GnU2LhtCdnVH1woLA==
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
