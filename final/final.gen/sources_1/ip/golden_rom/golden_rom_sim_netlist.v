// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Mon May 18 21:37:00 2026
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
  (* C_COUNT_18K_BRAM = "5" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.8031 mW" *) 
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
  (* C_READ_DEPTH_A = "2156" *) 
  (* C_READ_DEPTH_B = "2156" *) 
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
  (* C_WRITE_DEPTH_A = "2156" *) 
  (* C_WRITE_DEPTH_B = "2156" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 71328)
`pragma protect data_block
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
amgSTHhtpBbvD4upR6u8lJpG8Zhu
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
