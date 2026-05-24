// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri May 22 10:24:00 2026
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
WTc8RvT/mvSY3cAByWj4vIMOtbEgyW+S0F+fT9VrXYzNbpFQ8vQvGnOWTAYu29dMaSKmypWmCGAH
oU+Wr6XuNDruI98fu2h8mBgMCERb97XPi1yRs+co9u7X9HGbHOHHcT530GD1fSKoLywOGE7RMG0Z
v01ni9eKzAQrPVug2my/Hn8aKa5/0LSUshnJk5419HLcmPrKAmSBTg6RQxazXfw8riXJMAkV4Eab
cjJlQWZyZda8Zb/nHw4QJDAiozx/kD3ao3mr+MoIL0IMjMhWolbAiEfK1FRyE/Fb9QGGmmdUXOgm
lO8I4rjsWp4MX6tKV+09CwzwZh457QQ9chRbkSKtGqlvMU5pLbP3ZyWOr5fAFYiyLc+IOrpvJvb4
FYFgnjZnxvPAg5dCuFkyRPVR80MmtdGk9qSVq8Hp7CLKRDMCb9P65ngcwKv9BQ4Fy8M9u9hhN6To
YLqyp1bk3ghW5hDX5+NMI05FKGZjxGjO3uDvUFlAWQRZFO9rYrk0sjbqy2Z4a4csB8UwW1nqBzVL
vHApxCnFAwBMMhoXRaVga+5BagQTRfniXSSYOjdnIkYriCKYqwp5lXDWvP/hrv5x+jBdL7KXR5qM
m0p6hxmJglt0TfG0tg8bpQoi6qOj8MSnOkyePrDpCMEr8i0s3/Yw4W3j8opoyoX50eTAcI8uGxwN
75G271cVXxK7coy16o5Spu4LDmTCujLUzMp+J0QtrR55zw2VjYEWObGSdMViptZJXhJBykGjpJnz
zjYihfsy9iopvfMvcQ3XLm33n0lpsN76aXYUEbKJ4gQx+TpQg+I84m3KGSS3wJX2Y1M/WWIdDt+x
IsJuVFwjIi3Y5eMbkP+n3508sgWyWgBnVFF5pnPCrcYZJM1ZfCWgNd6hyUZi+/318IC0pBbNaajb
RoYYXo/9lrM8heHrvKfzYZ1HMx3zjOWM2/+0lnjky6DA09KrwQ+w/CdeH8anEbUhSHLs6jSsfOUk
RAXsDgcS3fSrtFPsN6ZSEi5BkOAIw4SzsZABCqRm5GE1Vu/GUKKZnf6uB7VlbB+JQMDpqHqoPJ58
aJQzfyCLbXQ48vr2IMyrOkbkiS7ZAwDB2Wu6XeLWggFPqSNP3EyZewHiplKHNLWv4uJSXqog4wtN
1uORhGgLRAObSS/4qJxQJGiCtPdb9fDiHSOoHxMSV3Cu8xGcPD7jSuUAMsiXMQbSUCys/cZkYegN
2SfARoroU4LRsQ3IQU+6hMrL50Fu6cSr3rVvymtMaoUv1tED75HfIx1uoWHkuqNw7l1r7M6ait+Z
HvFnidOZEekoiU6KyEXPBACBayoN/+BCG/f9OFkY/yv11tXyrxSm7C0duaQActncWo++hB3EfXRE
GoHxJ3Aj0SLhsPXmBjU0T2AxtN6cMT44+gyXSrMAX8oUgrZLCZlm/QMHj6O/9DaPx7QzimU312EW
isWnsvRoRUJZzc0BkmTavFejoiIV6RoUZL0q00Q2f6rSjQqLjQpNSZ5xC8JPtEZxFmumiB/UJQxY
VXEiFLTrAG5rAPiBvs7T6WyUBPhh5TYPz/dnzaUIhnzfCrGFc7rHzDWeYIlDAew+ffAkSQUb9+aN
zWkFUhXkN8vyJselCLMrqwCGF8GJxBG/FAM6y0wQGk2k3bHer4SNbuGxVEgH6cAUyLs9ZDlLeGCI
0fv1KvIzFwT3HpWMQJuP0SSqfA9km6RuB9wHYhHew2463CyNnQ+zaWwspc7FJWjXJsgwpjsveAjJ
6kSSG1XpJzfPvlq6yHNBZIZ5LVpSznw2WML3G40sp08axFhJRiiEoj7QbnzBwT2yZCtHw32OE2IA
MJeQEGVCLrqKzu2CyFWHOq65mOBSlAFYgVcgK9DGZpi+RUQFap2khNAU05N9YLpx4c4qLIFtvVhZ
CIzJjfk7OrNSXMe94DqTbmW0Rp6lZZJadYiXRsyrA0F2sjbKSGyQRbmG4KFWvf35OtZlSyoIif3u
6ovGt28ErJ9U+wOsmYY5PHR/0fEg1KMt3dqwF07Ty3THYsGAjYBNiFPWN6Ltmbo2YVNlP0bfDRut
xpve4Q6kPDJGsSww1kCsu0E+iuLzTUoLaqGg0vTQftz2s3gTtgQHfvoX4fYSxtu+Sb+eEoFAOV57
KassfJze2istX2y8qsaZcwREKx2evH8cXysClznOHREHSIVW5+8sB3QloIoTRR1DouswJmQUbaJZ
tw5gxqSEe+SIZemYMiGBi8LFe3tLwRAP8fhSIxdwoq5VCyPkrR/hcEDok/I0TpWaiwFVG6jjp1rN
+gcTfXE7eSM9F6EdL+w4gnIxEhAbt6RTYFWUPQ2cDFNI7sivs9Q6RUNBgid//tq5Me16vTnHODfr
sSCsoqaXF3uDE+1kfUQBAYuwiJGqr5oNHVF1IXEtruMLDUIE7GPBxqNGoSgvrX2fxXZgb6TYe9Gr
M0D47MAakF1G6WA3yDro9jox3uz1QUxIYSFB4sHnGAfEvYgGa8tb4gGdaFhF2Q4e8qlAG8EWBSoh
aDBk9sbM298WuYGjsBGLjlSGO5n27wQ/Zc21for/ESLGH6pQ2K9BCG9EUwzJIQRLkcHxznGO2K+P
M0kn7y9TRepKwTXe7INnA8eUi5Fosrj+RdP27tAfL6XgsZZGulh4uqR8yyatr6d3AeQg9/23Mfdf
nsTnkxaugavxmoV3zSP40bXUP774hQwncz+gGX5tmRwYsFttFNZPdRrdRhVRIbSa98EA8BD0CGlS
M74uFPnHqZZmNuRWncscimYSgZsqK3ViQK4Kscp0eGy1IaGuaUJYD07ugi0XW6LGMU/0gOKfRHKS
qP2cYX1nvt3cH1ZJis+Z5QE2VajA5D69L/ZfsPxMTGVe4s7jp2SfhWpRkKnvdEJa9rWnaolflQva
OztITvZlEc9MvLZqJ2MLzuuNCD9Y66D9PbgQ3Y4pKnyIC2mqcSDSuNiG+20t6wXnYjhqr14HPq/Q
3FdYtXtQdpqZtKmSgdmVWfqOS0L/8EFQA72nZsaeaIM/gRTOZydGvwOtGBL1+LVthCoFJjSTWBtF
/wBLHFPnDONLSuDKdvNIKwI5eb09DicOFArYSJTMSQdb+X+WbJkRfMFM6ku5acdo2XIPKSCYWCzm
WH/XJoXEKhdMkwImKb8aqVhDL88PsrSCKsJpCEnbjBLgg/SkW1ZakEtaphaIoQClLmrc+UCrvg9Y
DDTJ/fZ6OFAUoYu27URrbXoqpyWLDdpsyKqloUE0fqSQJhTXAztYkM88AUwedAwqLeBMyPwBfu3K
KK52+L284m1RkNBJfHLWee3M9GlKko2sqUOp9GAxdQSXm+pCN1gYz05elS+IZRahuaPblY6W0dYq
HkC7AOaI1FnoM/I+hii6Jk9HHg7iPo72sRhGxznCDuyzNZ37mcOfnd766TQmw3vleiFMEJ9N70zt
amyMpIJzaMDUUjRgoY2PJslyY4d+oTfdooxL2AQrnJedFITZyEyoJZ5oK4763GkIjmQP5aIhy95w
fCNKt4xSPAwtl6cPuUQCaVCw6dimOJmTlcpo/v+9SSP3RwuXOzqn56wkvwrU6cmgr/GbP81SAzLw
YWSZQ8RLlokCMW3mpsm0HUl1vmdirvlhA5s8bOm7lAae+wAJ93BmA8SUlDmD7QFavloUmjft+F58
QE3xi8qCHkKtk3utoG3Wu+xdWFJ1FpI33Ce8t45HB80gEt+mzm9lQSuPYhx+ZNKbo8fJnp3vacPR
FpVDM1LUaCxSxX+poilChJtpom4ca6aPsdn8Dd4cA0B86ZO31e8RNhhD7nMdEPxhUW7bfq/O44b1
YhbolmgrWlJ4jWGQMkR+OVaQVdMf52NyBwWoCcqyzxk2mDax6iBi2ywddlKmtim1NcQs2NDNiuAt
n82Q92ccwRBxWAR3x1c0OjITUnEmfHEGDfDxmUWN2meinD8DthwW7Hs0D+iGD8cuYs/Ag6lNCZWt
1bYD7QH7i6CGng2jeRJwhYvSjQ2TUy4WmatPgyuQkxOlSbrj2Wog+k/WI97axvyHyajBBUtpZmYI
XLK5MtOhPMS/AwXKBKTdcBTirUcD38RUwJdfpXtD/Xy7A5ZaXSbqqZSHpIaFBw6eyJKy/hjo7I4G
brRw+uGDX8lUypGZmfQdvfelch4kTR4BjOuRKFsTS7DdkFM28E9AvEAXD7SI2Kxmyh6MR3GIb2wa
UG2OCaZ8/rZpMU0rskjjVZl6qJrVAN8TNZwfQl98F/YxRpEi3cR0bUXOOaM/1ePa+q9zrRljsfNZ
Ksnt2jAFaHFhwhTymC78Apw93edqOP3N/kKt/uvt0flAlcpE+I1lwyBYiBdDVF/XQtJV5ZrXUZKS
OrP/9B57fhCMH4Cx0QAvsVtMdrZDKkjYdYkuubL24/x09A2PUrm8vt7NJCO9+64SQyR/Zl0qQth7
G8QLUCC9o03CoPGo23UWmyMHO4K+zJfbVSafql2TU02YNo3L63r4GSzx43n0ECXsoZ4el/VZExp1
mfSGQMqBLIsgz12o8Z2na3nzDM03zMdkbIQHacSC90ulEoj4B4wfBpxaG+7Rle3ATyu3cJcctj90
KwPLO8c5OCVUvJwSCilKDC1FtWwO7bnleiP7rRgnWDrE6d7UpjgBYaLRsI+5CZtlUVKA988ysKTq
wcEJf4HNJAzBXpJUN9sGCUISKpr7AEfrLrLuEtuNLh4HUJBIwA4B7BtR91B5mhqFEAmsZdjkrLC5
9SELw3oW0Vo0xAZXqJgjCIBU/szeiJObnLHCZzUEWdBu1Rl2QkpNtFeZR021+Cf1+nQVG1yZrEY5
SnlML4J1m4BSARM2vuqeYhZY0Zm1H1Kz45xEfetZx3rglKyDZtepQNpnYhCJho6p+0kPiLd8Gmi0
cINBHAqokf1dcYPoJLbBb77VROdoSJJseeDDhe9mApJwO0OF8KiEkjb5qcngMZPfPuxex8Z4nJjN
VDyR0wIWXxqUkLf7TdqTW6OEjPMjxGN+gfYPgdR4tWnUuiW30AcZMM9L8+ZdNWkNVbKSVzVx9uCm
i7rSVjy6oTv4ZwseRRP8mtb14Sn/vfGCQocbvL5n1wjwNVwZvXteEEjmiY/lZ1isB9psGlaKgemL
+wPIAmotHGTRcYYWidt8D6yUw9F+mZ4AHNGW9EbO0awADlxstZ8HguvW8erRaPN/urx9YUrZHM0Q
n/4AP2CJO2OqpBp/lnXWruV/7u+LHbxcBU/MQ8YBkcIsquYaFrHeob0cGMZQa4O+CucnYys+AebM
w5YmR5Rew/jMeFqO+/VBOfTEaYHaIM0EVOWtYc8s69mG42clZE6wtEyeYcpwVVzbQEcyYM+dE9wl
ZPMCww55z6iHcdfR2U+YPSJNlec6ioafB2BPkpPq/Yl6Xln53c44dqxw+sIJYFOus8+3p5pd+fii
G7dlNJJEJi9gW5Z8k6eGI8mXk1HUu4baI+Av15qCEf1VKlKjJZ9o/BoC+9zRKZf2ahXrI6g0MtR5
pVlLJz9lZuUrQljSoQh64SN8OvUrr1KKWOhCGqQaKHOhzBtvbVPpLfBP88oFmn2FehgqONi4Xm3w
f4vUKfwqrUpJURFzhHxMCDygwZ/d0i/qQvXTB26uBhD1zQkPDi1twKa4If/+XjyDeZy6aiW//WBn
4+GT/9BkmBEpfxTjjOoxx9NAhWRDhUaQW11w6OkJ9hUUa/+8Na+RoA2e4jsYDJjx5Z1ck7TosmMR
Aryj1KRhwdQxSfFN/cBCst0qvrPfOO1ZRUQLo0e3X4CWr4XJF7isHHsIoDlrG9tSsBOA39naeX3P
doZhGWQ/Hryto/W6spTHE4kPBPS8ucN9hnWadOflRfEXZTUBpHYlrEIcqh3kGG67XQ3AdriA4r8Z
BiWdzWQjC+1SkUzQRiEfQe3w7+nNzibahDAEfqBzayua2UWU7NPY9+QY+5nkn+0bRJjbIASyRurR
KUEh/C3S4YAmSXOBccrb3iodMgIDtb4BhaC2/mp6NSz1UTnW1pXtzMBossgIM82TTymgWEM3PdY4
D5ytlJnTbkFsauCGmwBMXzkIlLUxKo5s592UQGEaX7rLv/msC/bfhuRiEvtiP6BnyUNl+SrfN2rF
LqNGeJhbHxwXTdrVn/BaQqwL3eMoBDdNthZVyGUsn/bQD9kEeGTsf6wCAcats9PW2uvIMaVSmN/d
LqHLUPwIDcv7sPzjbCCWe2ihMkt/9IEfS7Tn0PLQEzmJSkekZy3JI6BzvVC417exj8DXdoOZf4Ih
AkDft0QE54aK4HaXt3/OnDWTPVdBAh3X6NBwXjfdCwKJlOpWaAYd8m+EWfdvMQBMN41/wDrEA+c/
fPdrUklt6izrzATskYFvrw8hgTfcOIRDfrj8vGPJ+GweTxqggHoG5h8hy3OBV7FkIZOWlawxQlNq
gsxT8D7rZ/NeXQao7jGdv6Wurv2Y1dEcDLkd6oyt5limlASJGfY+gG9mo4NKGJEpL6JdSJ7/hU8M
tCzOvA40qoudcnkJ2GeCT7h1nXmX+8ZuDlshFxN/7WWhfj7X48QFATd8eYetVWr9JmAhoamc/U0m
hl9jSf+nJzlzuRlnWAK7YmWunPPb/GgxLzA3Fm5g6GJaOXmryXKD00aJ1YMqjhHiDOJq80FbeLXN
aGE0/G69+9H7KkF4FrFv+u11I21KqKlNgnfwJxIGsgvCaU5A472d7EtDmiedcR6IgrADhKFHNUmJ
tg9EYOoqOZfEit34PxmGMAYWuke+U5bWTnPyU+1j+FSaqw1iXoyg6JZBgarVo01pss2wzVkENkF9
Ax21gDkokT0NM1E/jNo+adk0gvuUkaE2x/7UvnYGaAcvFsYwamUh3F97MVFVoRDlqWFIADtjvqnd
khsAI8AVltB2FN8c1aKpSCXCshJgGKDg13IGfOfVdikV6flwTYuYeHxsYebOxe6qqVJScUP+eTjQ
o1eQclRQoOlL+b4yo7BqQ6J84hFYPXiKJeiQ0FE5ITZRg8xR4lMntCboUeO13Msv8at/1gzugdEP
u+BWxg/3MkpH1ciO/4PMt551hnmD03CJ2UjqfxzWebKQrGW/ECRA/b3+D23T1wnUy/Opczk+ypkC
itlcMcFKOUCZFVw8d0uLZg18Gte/30+U1GOp+q0M0cYOCj6jawsX1GKtKraa83+RDqTFxndcfdD6
zevLdZ8kLgKsX8VDmTb3v5CuXF8fEIrbXtLotquYiUkHHQUrNdTSZjhb8zR/1kal7oYwuqccjX6N
C5sXLhVmTMF1GoHBKP7TYSbFVLGwE8fB9PH8qY7AHtuB3+sNelMQdVdTGZ9LvyIiIMcGaUi0kVBZ
BsgDXQb/pA2VB7y7XshD3c4Y1nxOFrC7ruezq8xlE6qSM1G1+I0fV+i7PeCujQENrqlL/1h+LQYV
T7sVD3SwZCIQ39qMgYsmoZgxONVpofECQGy6AX/GHPyCbTmaBjU+rN0kPgHjrp3i+qVy2N0gmVA5
83pLRXvt16Hj+jjd3U46u/F09op9wJSTwiKRkyO2RjRcrdytw+VKiCslhZoyE1fo2ntwYOh82t4A
8cXJ3c3LZ1+h6LW9WmDWSZd7QDM0vPv/QUKLqBOWR3n+QAKZcaC/hMk7Z2A+D+nvlPeOrLtwokTD
AuCMjzTHVr3YlOb9hXBISBMYxP44FuOtcRXfTQyNDTGclG36dp8WIs6tuK5xGtGYFOBiTcGVeltS
F+VAusNMKI5mEQ4uZ2wX0BhsE+cr49ZLAnCKRMRRyjlDqunrkL3dhqXu68rsVhH596ilroOWtIyq
jQ7FiomW/JVW+9TvTlR9eIdmgv5gVGZoJRrB4EtYI5GZnw1Yx8QajxATptnJkPmOF/EWwmXn0KDB
mEQWWf3oXgnB2E8hwPohgkPPfFH/YlzSC3AZVf89t6msw2Ry2cQfL1JheKvhr3zZkbgEgTHd4s06
kj7iYLsCdT98HrTrn+5kOrf+E4zQsNqJF9jE1gNFQr8raGc8BxngGkmf2Yj1Ii2So6x0k5m7x6DP
Qxe/31J29MSSNeuv//6hiWq2O2UiZ7fUfwW/z/Eblt06OCs/17R7DCU4XHtAzMxHH7fz4Qs+WMur
99CS4NdOghkETK3gCimY/WrqOhr9v8jqHkY6pjfdSS+2P/O6JgfFvNgV99uS3/Q8U8TuqXVoXWYT
Yarhm4zFf5glX+dvzsKLxVN/CFdnGdexecyVCN9ItHaIRicMxYxWp0goPppug8QYd2ClJXFTXbgg
CPhAcBOnwhP5aCXZ2DzFuDw77GMLCZFsQVxW340Hce4pZm2PU1+4QsM89s40nMqg/tGLiKMrW5ec
nODIPI2nkd3Xrsv11hV8wVmCiDT0mjJwqzh+9+v1580b7vyGjnB5YjAlOoX8TVzH7nhJ5SfORGtT
J7BzFVmp1pADohfEr09WZr+TNNIklk325/7LAvIUJTtecYl5G1nSvDq8n3EYqnMTeeLFjzrymF/G
gWd4vegZN7RtE3AX2XVaHahXMbvFZVM56cQPHRKXYTVw81wZGPLIAF6slVP1Cck8Jkvj85ZbYA+F
WBTtuyffDXiYJmOp60+GffETUYHFNgLUbnSm09XJ3cn6SN+iC7EAfUZhmFSxX0PT/BVndQwW04p8
bSm67Ynjd0RuPJsQ97EdzQtaA229V4/nae8rApBYVOPsuEgwXDzqpFfLbwGdDO5PkDgdDGmcO0xH
XTa4QCn5lfMyntNtkZd5l0ccrXrfzKD89daLHg/sguD90+GfnGsuNgiqNs6RyaHmGkV53nPpP74Q
ZXHGxO635WBO3s9tTqLEzPloNNErJKu9I9D02PgmrBmZkJxxLwoFI9iN57wBXQHy+CXY4tEe97RS
AWL+C9BGMQBQeq27Nd6umJDppTDgzzAJYstLww85xqRR0ptmu/OqBF2P7Mv99gU1BEtgE8bw51Le
2kpvrNs7YQFlY/gnOd6xwjIhWD4tLOOK657AdVw8XKXMeQldkRRnenlKjOMOHjHoubkRs8Wg3Fqk
CjSY0XDJaSt/Akumyhp+Wi5/ph14om/BXpCtPhvGhCbPhr5zXbVBTaHWL83dSk9XkeFSNKDbAEI9
MngHJ8nzWPu+4J7oKdX0obqFI47wH4J7C9Kf3T+U2kVeucsIyMKB6uzo5AYVD3zJLhCZJa5tjIUF
2VPXCLY0FJt0enakN0ZUZnnwr8Q4dQT2I7oyzeFu6wVbwDT/ADSNayMcODJyRZ5SZozUo4Dc18r/
OjHU2gxUJUAsZw9LEXpnila5LPSpocNZQwC2iOHPwCoWd8EYNqxehxGVTsNSbnRNJEYvW1FOBZss
u61ko40IbksAezmGjLOn7UWCFaOORrqaYE0FpQ1BIHaXlCAEBw2s0Z+43jcZxtDqvPjM6kvJ0y3Z
OfKtcK5FYJ8OqNs8CsEZlXiX5ae4wyFQPBLvXm2yjx7TEU172/h3Bagy74U/wMIzSu8GclD9KL/W
ZC3wo1OaxKf0CNOsCccag/KRoJA5lD9S+poaZ+o0LH/wH83s/8nc1MENUEeS4kw+1DUZ2Ai3lHSC
vw4qLb7tJrEYonll6VLRu/Re2RUAamGjbmiU9mTfEWFsuNZsZsGHo5Qm/NIBgt8Vf0AaOe7UCaHW
rnzAAIu3eGGDwrq0OL+dA6hyW1hfu4jLR9Gb5XozeTeB0QRy7tjo18GHQij/Q23PdT5QknALsQzH
Tpkf4c5RcaIbwapfIGADSIlmSQV0jQGCkJFvlF1gH/9zOqiaPEcFD2ZteBRY17N/TCAwK4+aqEqB
aSvDV5apU0779dQYlsamiiSTkUCCMiBnvmGCn8ozulcjlQZQcYwkngfYMCLulZTeaA7qkXk/J7QF
QfGBUJwzAnttPDRZRxBmoNbkzzMa6E7W1hNRLOmPw28SLzCP5NWTjgrb3/pQmYnIfs1i6nfOBKnO
ZZUhJEw5Io5MCL3YQ0r4TjtIit4N3N1t+ojTUycY3OM6zBKgSEL4M4KKMfVJQi+nABXtTxuA2LzK
WEj2mv0owZuBo6Iw9HF39M1/k9ZLP69aQq8lLNON8RTA0wnu6dqpwuwBsysXlnwDGj1pEG9Egye+
QRJyuX5rwH3D5udiOK36NkzzQGseRxwBfT4U7ya81m6NsD7jI+7kccppDWMsDcs76Y3HDOoLangG
sx7bLrv+hXfCu2Fa327hKnfJ0UwfrQf3t1jelJESWJC/zz5MbUYuhsN0TnalYMC9pkJH7IR++FgB
zb/yZB6gw65kSy6mXyZQGtCOEMIwYwR6VJGUCR7Y0alq82Uel2IOfU2rF+/Hyr9U6oac9iF4sVgA
SgBEmV2Ql/3Xk2878V2nv2OtuMMIgLzNb8VPJC2XqDlgKk8vno9nWwRwoEDJ7UVCAmp+jcn3DXfe
lTqkwVH03cGoGyLioMTXeLATQbLDTxOzz6Zc8wwahFs5TfoiWAVjIvMlaFoWdWWwEslpD85vdn8p
nIFdxJAm5rCz04OCmKZy/rVGITSMMOedJ+1iBsXNEoljekH2PRANpkViynmevL+ihDZI+H4FJEXh
uEUFbTY5fsdQVm+Lr3hUYvJiWR/Sd7ZTh5yt2Zgz2p4eugEA4r0bfWcPPodr3l9qb0LA9E79U2zt
NI+Bj00hGxOYm+Nctm0nyav3oC+RGzAhcYkmQKYHW+MBTpjjzTjqDeena2nkPZ4GG0uYpy7psUaz
GN8Ajt+HSIeuPeM6TCaJfouI+um1kFLDl6XveoEcwz7Wy1wi/hMt5Qj7hq+rhcvFE3Tg8nFt3tt3
+1utbBYbzbYJLTKd+dbCpSiWzWtL+CkRBV8B8BT8/2tbui2A7eBUwRVTNEucGycb95bWAWR/MwFf
zb5G1XGMb22xwU3ZhTLpisO2znF46f+ekUBNM/RPrPr5AG20nENq7U38MR7bhbhamsZaOwkaY/a+
F+wSFKOJP3kUNAglkFq3K+DTy9c968Kbf5wja88bljg9DrAvFgSiSnPmgwXHBYQHvz/GJVryZ6AE
0HsIXVCoguaLoFJHSkuPlRfHHyDbyK9rApsCn7kBtJrmL0hv4XlinLVNrVPt7QRyHOxAVjNF2dY+
agLtP8GoTthXAfcuNafMR5ovlMxZzUj3ctGrbj4ryq9NpPV/eb4KwNtSsjtvElZk1A3czQ272ULd
GJv33Y43hZvJoJXa0Ks/Kbb3ciKpXYsVzH2ESv9ivgx6XY+IgzSh8wAKy9LXPTJkyYwjharcKysr
LSAcA5l+ue2QfHZ4hBgJYgGAyZGpjw4tdFzLvPFqw7hZmdLS91omb22C6v6Az9nmN1vKBB5rIT4Y
vBGQZ8Fdh/50RPX7rOK1ilf56Zl8+IozQ6sCsOBZA+vjnbHk5bfxonuWllMU1dRQyxsx9bJZ6f2S
+/d32wozeCjdr6zlhriE73zUgVUlAkSz7m5/3SGs0XEzk7kmpFlR5aPClS9lgaWpA1tS6G0qorKi
3rs0PC1IXX1hoQFYpGKEXFyDmYd5GvxbruvVJpKj7JZ4/aZ1pGS3/AffSMCNSWEd8b8yawShQIrj
3Cdt7f47nJ6c7buvE3vOpNLLDdlXLK51wgX0IcKYENo+FWHjy4RZrQGveNFIZNHtbyMpoBVyypiH
AD9E/MCISXgUeH777sIqNEJH9Qj76JYkCX9BFeMd8HM5JxjA2Sd5dnpYvi0UBmu1fiTM0UScENch
LxV77VgjV+coYsO+7Na4GhR43TbGVXcVfkCuF3mGLHLxdEgOeSnMa9mE+B/p8IF3ohfcC/+cG7Ai
mqfdPJ4YGV9SYJXu50NLzq1wWnaPUJ6RtVvZplm8O2lwObhXzQ6BIZbMy/BYorAmKQnC6NPY/8LB
UW7BS4cc9ZOdL4FmHF0CjGLV5dxcbowHcoXteTxW/dTiGM73AsGO3UG4vXwXQttJIooq2E7CHedf
MtpTTEcQg8mgEIP/+pfYS0eHvdrZ8LWr/fsee0AndI/NWWEDZK/2YShNKUN20l8mWS17k7DiRnkq
8KSOKpamuyCSJnPiKENPfc/OFAOI9b1GO439J6L9FF8lPLobWYfMdzl8X3K7tbhYxsfVUDoT5INi
IyxZP7QqJGipCI0GQC3NrwZEcG1P5K7UaGferhqo3qMWGKXEd6FNdMYyEsqoJWV+l1rnrnzag9C2
P6K1g8Syv0ddf6aDFmGyW5m/WUtC1QpMxiI94BcVqhZ+IsAUyUhSKdT/BBlqlsb2tg5H+0rhPtzT
LJVHrmMnnV4YLJ8zEsEk4AdYGXd2em96kAflqc2WcwSyM9hPxZe1UA8QtS7pvPQcCPjBwDmqe48k
+5kNE5L35EtrY68YfJBZUSx/8n0BlDeP2JF5QYxgKBRq8vhDetqgA8pE8bM9wPAey5YYRCqxqcCO
xrapjDgCM+Rl5yp9Oi3/uJF+O7PPsxxftZvpq/ziI7cq7HXZoIYdIEdMrw3ppV8U61Cdb7HHcLTO
OqolG2R8ZCEEH6VtzC+w2atPuuzMM0AnjFhvSXuui3/k48PHlquztDcBQrpncBZ2/KZte/noIkea
vpAor8CD0aVvNu3KfqqdMSpWDd3jn6Arwha3XFeBEIhC36bx5BwAhmX84gGtUaziC1rka04xS4h0
8RCwJ90lPtVRpBBhG5hGRX93xuIJCi/Kpn9pzomjvTS4RsSDzJ0ds8GF0Wxe0Ra+xelN1AhJ6ztc
F1bRmsAQp+blDA5Obf937LzU2exjLHIcdE8IRIWtjyQqcTJlVuD3gT4uSJ5pynJSruI+jYfd+CYP
b5rLM4cGY1VmNsJyWCnKRvJslt/tejXdLOSxsHvgfnj57zj5lYBwAfDhCAQ0ltviROcPcEvg24iy
gJLc8bokjj1ohb3AQQ3GaO7eXr2Hi70Sl2nyGv/8AL4q0J/892lHkISAr9+EJNOJXvNgp3kqpxec
cmpa+VNkbssBsKL5nlmhWoiM/upgXGopDhIn5dUzrHwI01k50tthR9T1kTa0CKFXFFk5hU6gbZmH
iFJ2Wtgg3CwJH7Spov9uKAVdjxB98jyTE44v6JDLdElM3Kilxpoi+mVmAC5/yBF6C/53QOd0bW1v
TmBr43rlawNoPgDGU+Unmz0aIXaVyiiCNm6NyZUYV2QK0yV54YpNUISIu3RZgLXwk3y2168Hbdpz
TqXmiE22IGOnz566yvz4U2U+NVDLfE4d7nNL+WallZj3jnCXG1Lwn0x5uATBPM9wpUnGX/mBp/Xy
yweVjLc/3tYMgfu3m3FYhIgfGRKGo3eDLMYhg1lLdEEoPw4n7/7E7ugW6h/OgEcAzsyRck4nKoo7
49fnxXzWtzTh02BQ37KMH35k2y5TRczEoMyC1nnoe/Nalb7sX6wOJDtCPxrGHk/4O+ZP+W6mGLBs
wH5TuZX0Klw3prOnG60ze8KdNIPtd+gSDSmid+J+e8ayY277TyTPC1gB9x/v7WzBGUOmd/WhuoAC
y9dtRJU4m5OGZtac1REo+XGgU4Y5cEs9wIeKLvSAT9iqY4C+7dSiBK9QqYnLxb35MqsGlfLnBMYR
1U6By19DFpmQNg/NSaiyp/+dH9CJKYKm7kf7jEUkYnuhO7fuq8oBjgAp9TEpuFZCAiARXtTPd2Dn
kqITnzGmo6HtlX3xXxOM3TVBlwHoVMH/KW7a3feKELrMp00WhXSwZ+TnpO+WnNNfKfZ7zJcLe6MP
vYE0XNZyzKgT9M1C2I95a43xNB8fXokb3hScUVBQYfTcGl0Zvyw1hMGOvzwpgSzgE0bfoI2iqrEA
LXehCkKI1KFPT5apY/killG86LM9dfBEXxe0axlusrqm5UiDnLrW8W9kBJ/3Ba3AT6j5WRwS0MIJ
7xalTVOm7nkZB0yidcFTz06m29t8Hb5XVaZ5oV1KGpRHZhaizcrYlR93+WSSVLjJkznFhFLNP0V6
hFwNuznQV6GQcMuzJ0n431kGFRqKPp3LYthUHr+i+YIIMJz2HnAq5D17x0Zm/KTfvB/EPstyOllq
K9llDr6J76mZGF6fBWHrVCliQuOlfve42WCOmHN6qKLy5UGHyACxQgPqlbF6Y6rsIf6GCWfZZBH3
NCM5MzpMGtE0jMBZH8OR7ABRU14LplfR5pf+biQ27nLSae5dELqtTXF4GTwr+/JRetPFtjwHMBXr
jdG0CrZQV9ySkobxIyzpErI/bc6MpMH8viDHCzv+rsjZvN2EmOw1tn0uEx7kBAViCa1PdvHHGW42
Ho9VMzWEvHZ2ojyuWeAV8YYb9VXjFdE3vWWk0J32/SB40iYWW8UU8RThoh0cUM3AolLP3lWNW67x
mnUV8rsejE0gfaPSpXFYbQejYGrLcK2Z/h6LsV8sOG2Pb5yyN/EIh9qY5jNy0FnhPu/DFIWedUcm
vTElo0pu4G5+9U9S+EcZ8Nez1HYZdDO3QE4NEVTI2JBdwkuF6NL19lFt8ukSlrNJV5x0Z0FTLzDn
rJaw4WB0qX3xABJ7fG/7B05xPkWckb2eLfZg0tC39xqvk/r51jsOg/EiDs8tjDpSpUo/kDTMreVF
HmOBX6aeglXzTYd6mkgQMHgK7NWOy9aE1GdRb32rK1AGyeW5Mdr6M0Y8pIvrnWynRuZh4/QpxDu0
YK82GmZcWgvHmLI/xnDtnPNPUu3nmt5rnNN69Vg4s4Lgnz9zjG+NGo0rg41HFgLPf/vivagvaHMw
sqiPxIszRZ6QP1Nkp/7XrAQpw6huQ03+lvqb1PAMWBy+Hnq7MgGExujxh3rb0oIPeBIM+hz4go6H
Z+YBqM2FSlmvJdbilnokbGNl66h2BTZymMTFllSfgfkUvdifY+FdwphL9Onu6N4atIqN3mNsWdfz
cs9Xq8D6vLCHteIOzmppc5LP6PNS+qRUocx6H37qVxzACPlhZcUzwLMvUiPiFUPxeqI4IyGh2b/C
m4pMWMV8VUneXGkZTVJSqPLC9GzMAsEQBZYq6QM+xjEqORH8Ducxnuh3yVC6UGDcrC3ZbTS5pSzl
oLBu4m5HbCgCExlxW0sitouHE4jxGkODeEmp8+SDiC84+jlUBHtwFXRtIGKzeAyyJ+m2wrPS7uW2
aHw1vweDQmBXidNkoM0l6zRUG3xMpQRawJup6ZK+oT7LcXwdWDIswNFVb0UPyTQmy/VpKsVuCnm/
q0tivMviAD0ljn+6+rfrkiopgPA9c40bDqrsdb2+2PpTrz97Xr32Nn1AE/3dEtzHZJbV45cTqyfq
3F69A/HEk1WgAqlD+O7CS+IWb7Vc7JI8w1+8UIWCZfwkHP1e+7lhFys3ApqmuSCi9mmUO1PjAVm7
LIrs7PkG66jM5hmc7O3CZeXS/MStEdubTIAYk5YF2bYnqRyCCLUV7LKyonj+JjTpv+myTubI/9lu
HR0W2ftCV2iO838GiiNgzuDmnekyFLxey8ySBFDW1oEarPHRc7Udaw/pqepuMeUm7yvRTNwOQoAw
H3VdRZ4JqKU70byZYFkhBPF21siKXv0+LLNG08aO47MZCDebt2GLNgbaczmeV2rVGlTQ6TG8zXw6
WTT2kqGZOh9HBtg1tggOR2HKMkjPW0hMJP9eBc+u+6C27tmApWtAhOIIeWtRDfc+V7C1WQQ/ZOIG
Lzn85jmCJdhhNQnR1NgUIHYh7+B6KXjUFGH+GY1vsj70e8+CIb4ukH4WBnKx5zClBS8X8So6xq1j
iQGIFqHCzR10VvaDrlbfFdkiTh2J9UmWMZwOkAaq3PpK6yJKdYvHzHwdgqrPjHpH203aFnR1IRZ7
pGStG3R9SU1xUHBU3Sg62kn/APWQ3zGE1Qf3CAv5o7cFhA54NFKl7rT6MotTCp9iKkVfLMzTsYh2
lZ7gotlvzYXVRx6fmCKDQCjVQJn7FuOm6iGnL1xw3zoolHvkJZQJvRbjbDGekrUQtEbMgklLCZes
3il6k5secqLa/CtrzrLabpw2W5q5mQa5aNnJOe86u9aRhYPXmJ4mKdoxt3LIjEL0PAFH1dv/UpJo
mLXs8I+jdis0OHC/s9nEvLvgzJzzeFirM9ShW8veWqVKS4ukPTyYmXrMU/V7j16cDeaiG2CFPiVA
/XuuR8s4+ajgZOekzwgwqCuWOQGJ2+Biqi5EB9e+74BfUSgk2kZoOZeg3591WW8jYg+6/KwQfQCC
Qc+DbfOUqsUuyOH/fwBwEs+YivN1tLlzrnXMghpybCC1Lc2qrMXhklIsM8cNyhB1Y6MqyqgH0+/Y
FiNQwnkdyQsF0yT6ARjRfzcdGw7fvIypzCq6fL/qI1FlBdY4d6z4Km19BlR41KKW/1lS2TPFzYQG
OUwrAvH7PxaRPZhHbG4vfbKvDtEPpgnfBGznT5g9E54PLzwDED8rejka8e8Q5kRu4ddix93apdC/
PsF1Mi9oX2NfdjofuJ3lp+I6uA2+iLUxpMR/J3TmmzwtuZZ5PDRXOi9sH8tXXECR4gWVYSA0Zwq9
YagP1wAvVBvBJzOA11UXXzQyEhYglTRvSe5vXutObLsFs6S3T6tbLZ6lSlR1mllDWuJ1vjJTS0Ut
NAmAYuM3JANyBDntWRc/o/KghWei0yL5fdWoQOUlyvU3JyPs4gMlRzRwdUDZMRUi2GMjto3leltT
D6iDJez8+JxNUqFRj80bjUghMCDPv3T6iF4jw9jn2CtGbPxCeadANRH6+kKRDTrdJApZDiJuqh2u
C/OBv5/ATsUhz6sz+E8PjLR8OwDK6L2Ho7JWIB2CTH80xhKuaq/JUxAt5m4WeCP8Uhiy0x537kbW
sfdVtltG07Lp0ZHvSZTGZWFwyKhWJTINBo7az52mALF2G74ud91iQE0DGc8VrqDtClKfKF7njI4R
JDxiOxfTUILXAjH8YFdWWzNyINa2mRKn79b+1mwGbiJXLOr13p/VwOlHLhUDTyN0nQEZp56MMDdH
UJWbJjxAARxWpI/wue1Ibfk/arQ+hIAILzH/YeyG9RyA0PkqsE/fpUVUXC5Q0OmOozKOYLJbYCCW
/1e2+TibM8ZE4yUK9qs+hpXtqBXGNVNr4/jqjWel1TkHOus36tiT5Bu6xJWUCXDA8GwCrRf2eVeR
y4NL4zWcHLw6iLsKGa7eR62pLDXkeqWtjGGReq9r34Bnr050lSzEWOFCf0Qj/tosR+dC/OInYhtI
XL7kBwRq/SPcOkV/nxS5Y03neyWdvulEA0vLQZ16yn4T3FRNQUC8MQW5KXiYYFiCgohukGOMdgq7
EBI+O0MK8w+j6/BfY0MvvE06d+nnH8qkA1tU8WrYAZV1HbVhk2IUEr17fnGWGl1UPWMZ/XXVE0Da
AgvUj9Fl8OtIyWMtuPtWe7MBWrxdt9tx81sEtZbm/CbjvWp8JYBBH9wDRYHgTTSRLVWYi5gTjxOy
MlVo4Jr5YctaS473q4vT0fytqcvnPxJmsxoC6AYPBKHi35rxIfUATYw29+Roxxzn1jIE7gyrzDDw
UXflyfrEVntEVcSpv4+zO44ThfoqRk9VkUGZU8fBi1ojh4ZBj+Zq8YZNMsTjrMF5KMrcQcVTTQR/
xZnfENy8tukD5+BjpxTtugoIhKcj4sYFY8SNBDsLkjEKXJ0OkVJzGvi6wcbeVXUTgBqhHQ5ZI4+T
tTzu3ghvOqUPdHy9oADRdKgJCSM2KPuBFUWPAFXqCpGcL2VZtZBD1krFwm9Ugw2LaejPJ4N3iJYm
+cmZcnDbRUMbmUJ9hZt1fKE2DiOmCnK/D16x5ZmeaK2llVBEO4F/9qXYcpj/v55bBbbGnnQY8wKe
wPrC9uQdRyxYZ7UAJjzfHkqWbM9lxPNYb4mSCA/EOXsReF1kb3tfHZoQeDHJ/9GAzxceNkikub/k
ZoiQvFOR2P6Ws0XPaNy5DzM2xvDza8INNF2fCuL7JznTOjWhdvngq704Tdwq06h8n5XuYz4Zr60S
t74CAj9+uTv/p90g44derGtW86rXzEHrCSOC+6uZOA+HBPDt2DHfZu91PQtK+AsfQsh+u1gakNGU
fIYBdArdJFuckHtbesm2Unov4QPgbhiakgk/UKKYypbqpwmCc0Lzht6bKrBHibTq5X7GoRyXEXND
RpbG0M2yDJerVtmbnWfc20Zb8sIhVyFgAYOANbAX8K5zkmczWS6T0AEvUTI1/S/aMwvHFZPQ9k/n
nL6IH4+wPrpojDJSop4JlvWhDia+kCIYGVgzgB9+wWs1euByDN6wgoObLrWt5Maut91ApCWHZ153
IcbQalnf+zKIpj9iJJVw7WJ+/XLGeKZ7OMIWQr7HmkNWwOGJ7XmV0fjQRJy8kCgVLITHVr8vImeM
O2G1JMAOmk2Eq9VT55d9OMcB/J7PFYr2DK065HNLF7RHJY6Upvo701WMhyn+4QuNMYI1njp/L1vm
rNLz4Hg7sHVBGBfIcJUYXxuZSWvpXOOOqP5zDEwcHrT1pJiPgBbyHsr10F8DH8Mtli4W360YBfp2
PVDz9HRafQR1X/A9AbzG//N5go6JLue9fybHf31LRf4y50/S2g0zNyOp1s134oH8ooY6rwfMqDuN
vXbfy9FWmQMR70wY3WCgxcd8ahFzul/FTxG6pVXTXI6LZsM1ITHtHJdmGeZ7Lm/gM/i7NCbgcDPb
Jboq2yHmpyt3AjtyayGeXPepK1ATPFXAk8xCVOcQKhGfh/UPusk1ppcY0p2/hv4wDHpfiMUmWTG6
kcAOfjxPTOcu6B1v8RchOTMekn9quDcGE2Uq2xebZBkMWpbq7Mzejs8/0e0HLiS6Wfj3UsF7h+J+
TVEYa95KwD54mxoTwRVwmsMp9lmvNnXX0ZbUYTCPCh54BqoJ7n90ml/a1HH8XF3wiOYR/VPzaBjq
Opc6BnbfICUgP9CIvcC7W3AADR51SRoQNl+1GV/bcOmGKTIHTg8KZUMiGqC9JQr4aqpGXkLV548u
c2tyExDtZPfxzL2y7C6iMrcct+ytEbeYjhc+7UPWzEJhNBUSTE5d+ISW3ZLGH0aCoqx2pkOlTR8j
wXHHnr9GvSC1XjFET7sPTtU0e+PZhWqKyW3VeeqH7xL/o3OVNpftNWbcGY1glF+POB2csVIwC3wj
E+IGuH5Xf02W4ZIbQDMxOzOcSPQFk77gurguBTBHKJlLOVIEznoXGfj78795KU4v39NwpD7gPDYp
lUVV7CZIn++0Id59dUXUv4sINDIEC3CeZxpP/7UVjbSAWJ/XcKobEKq+WtDO9OCswJHPT7w7jyLI
BDnJAQb2P+S9dCHwZav5GTazUtEdoyiE6fUGQvlLAbX85k8aA6JropHJY39EUtH0Yp2wmrFUoTRe
L48Wjlcfp8KSQuxfYNY0lLkOCaoLcKFQzF3z2oj55ljtLcWS9Godej6V2ZTQYh6OO6Izfb9Qs/gI
BxBeQxOmjwuaz52Bo2jvIzow4lgt4Me8IrrgUxIPI61xp1XBZeeMqGsarPW7m1arNOjyACweFuAV
VdV9cmByIB6Au4cNkCga8/gYOfH1WaAlaa723G+zxtR8DyoiVEVGJzUI8VD0UIj3FIUziOJFsl19
vXbtQUn0oJZdVlw2I3WFHTgOiyLZwOmaRclbNumxhrS641OwE3NKbanc3XAkt57XKOkoaGXuqYLg
dOCbCB3IC7q6MxSzPip3mUC+Apw4F/Zw/F7F0xKINDRaL8RVN4iaQBIf1inF5e1vxh6N29gNvPIh
JqXy92IrQ9YLINrPuKMW5vYGoQMxXiJEyyEr4ekual09ujAnpdTLqUbU/e3pi+GZYChFWsZDrSd1
0f2ZcirG/KwUxif5It3IrYss4MQB8ir/sq0i0Qb79Q550ph5vgJSnwd0ZGFn2rbHBacaZ/m6FjS9
dp8qvGzCX4JWd/bACh9PNTVRgzNCNCoc8i/jVQlZ599eWhix3N+KHQVIHOJ3iFiExYE9wntZhRIC
p72feD6JmzxOdvq7idyzIgct6fmGR9iPNFU7i6yAXN/w3jXkdNThoOtMqAqJyGrEotyX4DLpwCcy
N114g63IrC0mW+eCZdqcBzHCJ3R8V7e4d2Z6HJ1U37ogLNCFVrcQX1wCsxN73USZmqD//n/vdk3E
aOo0HpcafmfMuhklz5hoonCsbGDoZg4qzxXHoy22MlaQ3cKheVAjtvFxLDdgcjKxG2hWjqdNS4Ar
oJ6z6b7/yMfEawvFAy+8nhvFOtklzjOdaDdJbmC73l7dqnAw4GbJ3Gp5WHuq47gJpmCDFYrzzA27
WRO8H1ELmdzml7RSh6hFbr5XiFirkmVf/KvN5xxSDqYpga15a42SLhL65M0EUKaiadAzxTXgETxO
oMIYiMa+3d8nqV3EkHk/lz5pMWkoR1+io/sDc0l53FpF0B/Y4HQqGVw1WBn0NaujMF+Z7U8Ay/YV
ZLb566OnW3ySytZJ4bSmo2XlntPuIWe1sIaAxImHV+RLsgu6Mp2bk8kDWLvi2vMqH21eu0bMRrxI
ea/9bQR6RLaPauV1BWlA4/geNvmVLTOJTv15k0erGMjV0KnZ2VKZegWkothIbRwfizrimZzvF2Yw
wuWt0nsEbvluuHFIhP9PNqC11pCD1jDl2JJE/WoYdeHDgI23sr3EzBg+Xlgj3aQz+fb5nYshMTAm
YzxniU1q6VnskvHdWJRKOaj8/OKXWGz7NFvulWhV9WkgYCQKVVhZ6jr5yLQdTgURCNSwNa85Gv1i
DF1CkiBYguUVymaBRKPy/l22gqAoHRyz5qU+oqCE9QPLJg3nCEcytjtylIDvvHeOwcqcBv0MTJd/
cOzQ6CVLpEsEBYnr7qQshnAcsLhBjf8BtLbHB4WxX1bAXb5MXE4s+IwcfO5IJpNIW0bYQEZVXaei
YIHHeSXDHQONPn+YukAVeuyp8dZRoYDddo4mL+c2nwvJXQiycLzLUlxwmf0p4WWnhwSiE6dZh9cR
slGKTiC4xx0Vr+uHhm/VEH8wfd5VRtuSIdg2rdONVo/G+oK37KEeEAOrFvDJrNZ6Y7Alg7eC42pJ
lJuR/RT4F4egGFNu/fEW5mp2SYZc3XvzbishQkqjaO4VScoL9CYaU1PcKF1rnbsR0cSqhwntbtwi
XoxzWpUfza5QbcSdoJ3WKac04otDvvUAmNwda9EbZaeEMKWfziGbmE8BBnsEOaLoo9rqGrXfDqqW
Yi+B0g4LI3zdAz9nYHHXAvQ6nuYdhapO6vhvxDXvxjBW2NBLqYcNXcZvrFB++xaNHvruvtO+/YHf
7ByKvIBJMwgEkE9ZUUulnwOtb5eRYhhGSKIIlMPsKvDlYx5ZWvL/j3c+EaZOiXXDwoRLKH5NB82j
dlGD7Ly6Oijlc9jKucFbBe1sW/b+PXbiww/FdeDkgxj7EdLqK9Uunl97MoiYfkCyIDWDd5+vS4sa
aEUO0bOzL27h2rlZV4o9WTcrAAkIBrCm1GO9Us7cLmKaFf2qFQMha4mDikVtWdXGgw1FLM70N6X4
um7ZqKs30ISjDkxyAcBq7eUTs+cnCtPgxdybYR/VT237U8Ev7XkZsH+3YQ1RoFGTeSvohRUb9nRi
Jl8fpMyDUseoiwUR/VwWUQHMd5mvd9IzTlcOL8d7oCBTKt14gkIiVtnNA9xcPJb3jW+Yx88nLhbR
8AX0PVNAAWHIQLrbSVUQxqFkyM8wlq2nQBNOjIsK/lZXEFluQY1qaK7aDdDSsQnhwpeamHxlD6EZ
RrubJcTKuGN026qdKhIgC1lZ7xHgih/jNtGcEDQavg4ClcJymVWhIoQKZR1vzXLr4Rv9mP2S7Hxi
/nEzJcMOdXfEk2u9CaY+cq1VSn9v2qfrkNT2XUt/DSHknluVVXKMHcIJqS7lszomX1+9NATu4oCK
Fmj6jAhj7NwpOEqIEAHhx7AdU0RjS+AuL1aaaEswZ/LfzK2qy3Z7Vk4jz935Oljjgzs+2NAunQFi
D/eZCmSLpFCQ0LymHhbRVnpU6rTkcvXtTxRBy40UJmCoey8xJk1lY3hYfpbRsYu3pK+sY83jmjgV
hVSCpqfAFzjGJ7AgdOIJ39tmsi1p+1wDKuxLoYDh7UpmheJgx4Pp6ipwFpWrpHRQnTHZvFDlue8f
kOsKuDVdM11g1wD2l8t3lDxKbv4kQZEKEvG7U+bs30AwfZz+0dkt7rsMsE+UYjOsXXfOj5RB7qaO
+MUGxyB8uIsNux7aV+d7FkZKtwAQAP3QnJsZOYUl8kAN03dox1zqkBOrbiM4SNmsz5UrHITMUjFA
SI1itZAZ3fgd2Vf8cHGEZQscdCNCyvCw97N2uPvzAILQkmPlMW/gZftIvskJlJbqT8JKm/GgHaUG
jcLTs8nqOuI4+2eFjrkUmd3C1uJ1VTJCwbi5wWMC4gSA92bZ/7OGggEYJl6UAvE3gdS0EWZOWt8H
0euute52W32WTWEOsbz18hQPOuwqM4/Yo2BMFTISg6hwTuCo3RnI88w/RACQqzHV+cU6uTb/v7GH
yB+jfBYaGRR71taFIPoobIZsywQI2rr6fSlqPpFQNzPhdpcLuRpliSBGGrCgGox1nBbtg4UBr4a9
+fjSAvyKHSVKISBCJLTx6yPJ/KpP0OsaKj3yrFGCeAqQrY2q4VaBGWHYYpJbHZ7aZYzHrKJLiGz7
9Rgz/oGB23Ds0WcvEPQrSrvSeTMXZx4LKqXmMJitNBFTnrA3LTfXgUPpARlbdRUXWEGaF95Phj/5
hraqSP3J+OM2zpcW11LsltNU7opzpZYCKbmpzS5J6j+xpLrNzPBmdUT2tVypnOjWlHzGf0n7Rq6H
nr0rh58a0FUTKov56YNk8rbiBuyUzuU6XJoS3aOBskC15Dz6cv97Pb88zdc84qnmXiytIoo55Tl/
Nd0OQw/xTU3NGcuQiHqzUHnmAlBEV5qh96H9j/2zUhnwrttncQ9+oLP0WM1Usi905uwTR+oQMnXO
AY7RXX60ObbRZWBNDgEJX+6sEtdm7WFASPDWzIANohgbrWFjhlFI3uhooSQy1LXNR6P7WbD4pXb2
ueB9LZ+8XplDDRbyYO/tEMb0gfio/1UMdUHgLBLOZMPYF5DRc6TLBPAtCpslW1siF5YUD2Kmn4Cb
IXN3GYiTwhsJlSo90NUarz4SO6E+YqnJzuYwLn0O5KQHFVUNhKAaJm4hVDZzkHQUKwAUFplQ2YmN
w1Ly2/IVREaGDC9ex26StTqzqwU5oIIILtaRDHBiQOI1/S6tvz27ksFpuiSZerpzY+Ar3G8Z30Ls
9T2ML7XutFlPcAuqEJ46LlZqJHMMQQyjO5eoHy/v29nU7VDsgl1JJCzgPZBPiifCjIpTWv/PfKQa
NWdRhB1iGm66OXHn+N/Wa+aH5H/w5wsGeAQyjkvG68rFG4GY+QktrhVJ9A5iHIfAvQYZrYVHB4B1
cHR3rQxU2Wt42p1IlVBx7pF2WhiLPdndT3e/mAz/hcnrln7g0dUEJsVe/LZLMgz6X+XZfxAscgl+
3hEcO32QR8A8N4JexksAgaEKNUKHPLlK3N9m08Qi74HIE7dNbsFzw6j42Ljs47V1S+4j9IM9qm4y
Z4GZOlt0dnO+3W1mZ87CXDiaMxGD9f24cRIzvzhM4HsagloJ80XbbxJqvUrruxXRP/lfRl/NegqD
uFg/yRZxevX84diNiA/j1k7w/nEZXuk21P0Ke4ar77rWbKnMTOnn5rumr+qyNRoqnRElDOhS5nBR
TydmYvgTFhnzlhnNyakxBgzaoRtqT2zVuL/RYkZDZcrkNO9aoJFltx7JGcIWNg8ZEqd5DA0CAg5Q
O/yDPbpG7coT11bIDKqPt4tnIbHQNyTmNJSHwRUVqJhomB8Umkb3oI2fKpMmLizFACLvejDOUa7v
AhfncgHeFjzYVpKP5OPslno+bq/7E40z4jF9pI17OBwuxzaRWs5n180iuO6/vljeSZY6+pfs0VG9
QvLAomok99NdXFSBcf/dlGxGrzSGObEEIrzAYGR50a2Vi3d0ifWEYs3SmFFhxkOlfNbyGJ1WqIB7
3xdeDqLlW8UUJkfzMaU40HYgLz1adA7ESeiyELBiliNAmQS6PqsCa2yeuu89uHsiG2LhS+IFvhFR
32OqkD6DpS0ecYexQyVq40Xt3FKEBk4YCBNV/7zwms2HsxB1MV2zIaCDQpozwHRBJUaO+sOiIPt+
fmlOIHzS784be9lY7NYbzUimNLoB0z6aJD/0vCulAIsETAEC9AqRccIoNUgEAF0vZjOMsf2MKKt0
LCoRrnQVZKpZfz64Uq20zSOP0XasxxdSkdf9vn3fN2yK8p6R+zYQ+pfSk6tCUZnSt2P5XklgjK2/
4cw0p/Ln13cUyBhMldTLpD7PAYh4l3DJ9EBPzeS0qEnxSNzcNiQB3KPByvYZ57TprjElDs4Bas5O
X8z05T5nDBFJ0C9/E5WA0qHSfBvCm54AxUiZJTX3lXauyDdAlVvsWouN2GkN2pgECR/qizBIzyTc
CGX6wtRht6FybY/bl/JwWluiV8rezKgT4F2Yp1MDyNpzw5GsZ29EyiqN4UndJ6o8m3U6QDeVTxr8
pUjQBlTH5P+JegRKWOx8Z3HYuyMBeqSTtWN5OPdMzX9aY656s1NQA2T+qugVYwxulVc7tjZr1Lmi
8aL6uD++h/pM7X4YxIYDX39z8uLiXpdiWJuMmULJ1OhWftpstTKp6tYXZ98ZlsWsFlQA4Ft5tXqR
GChUzjT+dJ5jpSqgwI53+ZF3aCGJJUssnKsCdUZyzoqAi97MhwE9HRYS2cRZapfU3Wa5GoqkoW3j
09IvjB0Ti8ZeQ8bUTLAPfw3AkhZESQknFKhLeaBlquzvHJtYA730XFT854PNvN4BQopd0NPJUqDI
MXbmSuImV+lni5FnfQmatGQjW1lcVUhpMG3UsdbdA5flmwTmLEDgi2dWNf7FgMvxWU/45h5VO3Rl
rz+TftRnDkQdhu8/nXfmEn9E2icLLfHWZCbVZco0Hup6YpN6/5r2yXQCiYJpVHugChwqPJUcMNqc
Aw44ZjeCVHgrylouqqs1uEYycvYNTEc19VxXmBVUO2bTpknlz3AupYlxiSvpqnwsLFk+ahj3l739
As4QVI3f+CG1Py1ijRYphAuHVc4OybHXw5y3e1/pqmub92XcWlG9cPQd0ueNYEJ4nn8WG6oS/Eva
ScrRW5vdXTVDoENxIT3c5P46CzFYj3b1EtXrdsEEHqtrTjYiBMtzgRpdww1cn62VdMmg8UCjhGS8
13rQUrIOkR3BI6BssPdJhWnG2ljA1Ai+WggkSFfFZ6R8hGy8Mkafb1H44ZDwa1ambhB3+jds2rNh
QrSi3U4KK1P4h398rIIAvnlbZVk0zrn0Uno1r1+y9mX/j7OnIk4wOrPQKm7EM1r4IwiW0w42acOO
vGQcsjFokVYTw4/GSUCYAtsWROvJqZE3QW26uwQoe5LyBceTo6k30AgYdbXXopkSVQvptsyNP6tm
RPf8ZKeMD4stxyaOj+pyhyJdq5bgCENBfFYevsHfd60rwdrLBymY467OoVIaMBybMat0he1oMHOG
yvsdJPd0DwRPXbDBMhZHkA8ib77wZojfh8qubmLpnqBsU/ZWW1H+PbXPtCQpWOroq6PUd30SeAOO
Atu/HV8FLBc1Q+O31kLf+wTNWDeCvtHhn+PsAnLkgr4uWfrU9DTTBMkblDo+feotu4DwyAmMXaT0
U37Pjw9GIejMZqI69diLlogSXoUaD8lO/vCYx4sFnex/XN8VkIO7W5acz0+/HURaW/Ch8R1BAzeb
R5sPfdBQQrkb/HNeEHLv+0RmauSdcgmDgMnahzP6NZCPe/tDggaxXwkJg+bMo9Ydw7nl7Z8/lhsL
VTgLVGfddeCzvVmh30ETci+tp/TMemqBEiVe4Y6gICepOAkpAbVnmri7MOQXVPUdGG3fwemo9hTR
AfjZaO2i9XxPV3myxPP+U+WpaITjgblo329amplm/Vx12L567sNDUNw5XONudtT951fx8bvt6q5j
mbUa9jbVoo6B5Spo05OBBjGsHKE660Qj1QZOk1S1g917Ew299UdP/Sq1/IDTwolx3ppQ/Fg5EnEY
1fF83qLMurC/DK022FeQxdAKOA2rqXrP+ODrKpJMTZ+HLfGnhP5njgQ7c+rpvzbjKKEqRRbaOSiC
GJW5+Ydi9DTPTl0d25abT0+U/+8bL91E1stswsOhcpJ/8LjybBzYHsmuT0D3ho5KJ4SAaQRJbYb3
lCO5tDVRjMQUuQgYlJpbIEHpw7Bm5wbCGiN+WPXBMthXMvM6hN8pki1zYJDnaF6ldmf53Vva/vy9
bhspXLWH0I3K0rR6TXygHMQvd+ADaPi+iHVYKdIG5ckfRpr+ucPYQiq6Hf1rhur2k5G5YCoiJ45K
6D4YUlqGnF7cX4PsKwaiRyBag6d9dqovtDd3AGB0i2mLN3zAiSbyZnr4aslD6EhhtgBU8o1ZLCVQ
V2k0xqypbVaC4gq+vyk8nayJlMJSO3c1wm0ZVUgi6B5eEYHL/y1YjLiijLMd55Lxggx4q/eWAsyy
JAT8A74oQ5KZIqoRuFZbJ/ZPOQO94QnBlhXvjWsDLOkE7SpG1hi5ymOes4JAxi8AyvtIw1Mx7m+K
1JBfA21pUWZtPwf8ytf4ABeK51EU4/EwUZo0cv6YzRrvMd29RDx1jWA5K3zOthVTDrcpEHUWpEWZ
+dLynEJG9ZOXBCLz1Lk6XSg9+q0bVNWhKnRvaxXFdTvjSVR6dll75iYGSWC5NtlaQkIw/bXJLfIP
6C9K1iunVhLQzHMR7XlOPtWP5s4C6Mty/E7bcaz7xmc06xQM+qgit9mCfTUrPtPGcjw0CvGKrDU3
D/lQChV9Sq+H3+BKC6Ys6E+oV/2RoCaofNq0clfv5oULw84omwRHvSQKPISsLMMOuL9djeqSbtyz
07G+C/le99YsJAFikydPIEbuiWpBxnhta/0HB4xDmFqyiyCKFuphu+sq/+kskyZy4I0b5k/8KQ3c
TnrM8ya9s2sS6DhqRN0IfQ+p8wITi+PyX/i4b/yu5TagT3kmqWLDdemDWhUWbjsPh+0d0JLOled0
r0aOMm90uLJqkFKxsgMZLa2gzTFIkgEdY/KiF0nFkepRDzHNd2I3+EkbpqjgEtU3/ZUe4nL2P7ck
bgjuiSvI2J0iyzGAAyV/Z3meFRWbIreYQ1t5KpbvYEIsBnVbaoPSuOxL33/L0uAk85hMCJjNBYjQ
FLQ+RuZoXeDz361AZQEgPbxWLKCw+Xbduh+XeQkQ2SqHMOtPu6nFXH/V8J6+SaMsr5NU8qq6mdGq
uKtyWstePms1u7haAHjYQmdgDbmqSCsKaWuB90l/+BB+iGmkqJib0K9rfuZdH72gCSWbNbOMVJPH
qNP6WUMtko/pe5b6rNlxKka+rQH9O0r1HTujcC4yeRDvIC+8XMzPem3gj42OrGdPjKsTMjT+w6AA
LRoa5k+8SHT9Xz5GtVAMy+spZATdJA29CNvpJ4czmDhDL9b0soEyqkjUzpVZBQRb8AB884hhWRbM
BB6tZZJsmyhFFzeNz0m2zYE8NGyD5lrbXQIhoT8ntI0KqHPvir48krUoZmI5Kl94StyEFwkSdIJM
jtY/SBGFbS52NyYsH9/fSV6k/wlG6vy7g8xzLsowiL3KEmqiVaBqXv1vKXBrD7UfZ/NkiPKHNjkB
TN47ypVHTRj82W5DA0vf+CAquRArShnATtbFi0UyT0sDPiZ74UvREaiL5ms5aroUJ6vOH5zd4tH5
Ruphnk1ZMUMxH4kLhXdCq/ylSbfByU5Gw6JDY85MBcrg0ub3hFi2pgW3IwD9uw73kB1EM+5J4PrZ
BUXRUIiiXukm13q+u5SaZsZ34iLebdqA61yXOhfRoa7pTDaAytuV1wsVpRpZxslr8dyNSTz89qWp
PmmxX/wLxwoN6Evd2rEljCs66rewbegXa/T2ZvT+CJPjPePiLI7rYKuPpB7WuqTwosg855bU1Rnj
yeX0ED4dyXq5fPn2/z5zyaIPFcbU/o+Cu77RQot6AyNlrrmjWcgmStKryV9JmXYYNdJr64+RdcMc
kx+0zk1EMsyiUQwiSyN3lCmc1FIV+oAJ+pPBjNgHapTOUw1r8nGkIr5KSih0N+MSNDWAMEw7aUgO
3fy/vz4Q83S/8zjN4WmdP7FOEXa9saFh+5aIDhKj9mpiyHtpmDJYQSpRXKMQUMs8srGufxkhh3oz
4ctz/GZAc+Rs4QqquBfGSbzbe6MxgC1mLZxC89YY9/1hdiq9Wio3bC1RHXVEryYOPFMa9wDuuiuQ
6A3FqVdXSFzC2zQ7skLsGwVIghTUUsewwn6fs4GBHy+89BXAHskozB1dwL9Ai2VpIabLWf1vCy2E
jOs2o/JKxZFoWk4I9vwp/xPvxkDBCHxQ+SEtuMVvW7K8MysmIVmL5aJ7c3UiogOE3GezLuWnwYXg
nANfS7BLwp52rkLVSyklcWp098GAJW0XaMFt/FmKBzi+04pT86cln1F4PW41xE3mDFK9c0+t5GNM
PfHlIiazjUf0pbomVVGbQMADgd3eHTDL23cFQmQocg+FbJEPh1deXDoPbdqceBgDldSyTGoq+zYP
nhkjUnUD4CrwCPRWbrHtP5/wn+S15ZXCAjyTLcOjr+nFbYPkkf2f2yzNELHZy+guwer86TwUStSu
vecPEWzyZdZzndDPb6s5k8pZYoBGkrobTuJueDIplYGCKJuJDPKjIrxQdKhuEwSYhY11Jm3nzf3+
KRGaaL5aKW5vFqdrUl3Wl+olz9fDgHE3+RbRvVizvDC1NMMuPwlGaFQuz7h434wbG/yYPXnq/Xe0
Yy3d3zn57z+xv7ELVKUltshuDygiLYm9dmSodSrwmdiAUErlb6fHuFpKJmFX/2KOjSE7xiSSW2l+
v4eG8GjZ1BTJX6L8POPV7exU4wtCujcHXkUUZjEOCC7/HMOEEAF2VKLu4DGSspRwK3PtM+K0r+6E
IxmC0PINuEOx25apFpIQ1H+Cn41qzYPpiosTtgTwPs7yWSfXhLixWDQSibR10ngmnkmgfwBSzLX2
nLG4Ci6M6N86kkv08o/znZwhpuwpGf3sbH5iEUPA7o68QByDLbQ+AoRc2qQhgmE5DxPQeDJuIOAB
et3V+hDsmdLWhkpwmgtkk2/Y0tw2j+TSP7npVDRDXHTsYIqx7fmTmLZ3x/MBRtPajFjgv/sszQhp
wdIr475zQ78r/HYkS62j594poevEBF/Lhe/bdldU8EuV2c/CUUs6mnbmv8KW0lNjDlHTqmkjY1X0
TH8ITPbkXAGUcDGeXL96M09SIDcakXX/YdgK8xJBVY/kwYHfq7m13/pSHcLOEn3SjucxhlxogghB
CgDzPIYhkrCsryKw1/PzhuuZfudew6BnEPGduWu/IT7cL4bR/YonXjh/TU6lesYHUw9pOerGXpDm
CA3mC2FxziiaquNER7qsQcCyv1J117PPDxcyFSidcAySmezYVWeHQbmGDSso1wHPfC1EGYCgBNEt
7kzgBsbtF6n+EGscuecew21L3WSetpnKCIvqwDyyle3IXD6btyg/EJAlLIfe5YOUgwUnX+ZOgK/7
mGPILwz8MMgtw21vfYIWN1fN2L71kBZ+WYBbluVO/52K7/zSCW30sFtvRuSH+RBJuqdzuErhMIPX
euaImbig8EKmjFv1MgJXrT9J4ERZEhojoUQ4NFqfPelWSvDAR3o6n42lM1su2MLwFxhhJErVDGl4
o/Fi46s66lhMPhUb4hYHcSc2VEl/L9Rz+DgJhO8IxFCe/IcpatxcLi0EfMKYQrPhtGLqHYNfzmS6
2o/9wWvPLiQu9vt9Yst1AVXXSgylkc95ZMHzmHgdymKbsEQFjEhJggBgygXAgDeZM8DFBwf5heQh
o/HiPek6LGAxmL0E8J5ZsfyCV14lW45107cLiBdEK0aiMKNd0edIH4SjONjsvexM6qGre6wW5Q+q
O3mEo5VDvQGDThnYXu3jfGp3anyFq+p/I+jmzrpq82BMwZGDhQq1zRk5YSleaRtXEHYTtn24Iccl
Yw70kCgPapc2TIhFK+TvfWe2pYyzxTx2A23xPhHfpo0sQKUOq45ljl77QovgIEowu5wvgoIBMsfc
YKgE9WhxRsbMxRbEoZKrzDFVvK/vqs+/wr3H6/WhD9MZ6q9bfNrsJ/oAyNUswXv9lS9sWsbJYZM+
+v7t75ZMvY1dpMjMLcgLdzxBJEF9NB7uK505MZ7gUMSjWAzVak7bf2YcYI1hBkYLIQQAdBUJExqp
8+lNZGdN9ccrF157+P679IlTqsUd4YWV//8TF9Ju+csA7AH9seQ4+c/bMqw6Qa/isXl+/SClDdzB
PjlWVxE+zysyfOxmrVaSPROXaQqrY+CE4Yo3TXd8phQZOB9mCE7rNiSzr/duGyluy4ahtdr0SJhx
1b0zl7dbEq4Nz4prjzS5CyXqo6ZrqWx+ObDZxvskI/EUJ0d8kkPZvwfKxlfLj2s5nL3bcwQfnEKW
vB2qlAJScKUnfhnUoLT3mSC3/JJ/7JdXDIniKgoIILcbiJZI3LxiCSHQLYizqKyX9NBxcTvT9uRF
/0WG5/BtUzJOeEPARRqep8Gfg7R76CiKZyLI7lDWbzeQ/gV+q+IHfqP0RGgFO+qh+IJKGXjdWQWM
QTCJAbtc6b7g1Df8Eh4iDZ7dXzEMO/o/bDYOLkpgtT03LGXazVuKVOBjjd+2/A1q0yPC2vJ6DuLx
K/DNPdSPOlH1qAyMVBuOiAGLsmGjauTlWFw0xpN6mzDqLl9XtrhIRmevE+Vo4T9xIYxmRdiExGMT
HEVpCtk5RwGfjGEyWIVbPRzs+l4hIRasm/SvF5LbWLn04E4SJ8loG//4+1cBRsMkA+8bHwcYHwIy
N9ho/qj9S+rf/3o9rTxBFsN+J7I2Fuq5sGhC5apUoGCAMfC6vgql6XVYifwBBGfE0cF7dTgR/cfL
it9OW6R1QXorMqSQktH+50Di0pCe4v6dd0UP/9zTXiWQI5RRZPQlZjrb5NW5zF9wrfVdpEdWpvu4
2XTp3gdW/BwcABYaOyJI2wMfdh+kwmrhusTKGCAuuuLS9+P12w0eWxjZSun5AUqagSI406GfEdA+
llGfZgIl+BhPbiqgtLNec2deylBisCKlt5GnoQOjq9J8ZOQKZZy4hHRDyIh9qtSem00FmhpBtEFB
Hm6eGhfb3ebzOti6h3AFl5jJNHlMLjzQOhdfIhHShQNQ3A9A0ivE8CZcYD/Iw2vqss6FTz8CCgRJ
Wg7rmiAHbcX0STAxSZxEmvz+SWH3257Ln9y8Z3/9hmoVyAJzr+M7EPYqcsSdgaKdqhsCrmOu5qWN
M5W1ejpPxRt5canEmUX4YL/+v4gEYGxDNvSnPcjyskvq6aKfaSIbwW5XsmlLQJWGoJPUVJ8snAMD
uaUwPWtX7w+9ZTmd7UT+KQL+XmeWLwQkcJsYqg39+kfHs7NyitmINuIX5mryFwFY/2a/m/su+TOJ
rxRoyfLJrp6baZs1NijlRDgGv0rb3bIVHiBxY+5958QCxtlKFskHE+CMk5ESSiZDvqiZ2XBgxZGi
Qdf39q8rv0AtZjm0B+1dX2rIBVwVgN3zUAzAsU21dbSQ+PdBRbwk7gLm8nEI4y1ahiyktf1BE+M1
2EXXxCFWQOA7NmMr8cIRbZVlWhHEzttIxWC5oSshrGC1wFIRh6MGAZu0UQoa7ydkb3Gi2btQKbNH
jyOEfKgxH/MPeKNFyr5q4iEPWhyDqEnjyNAcA9HwFtqxA4nppljRyO1joJrMRoybe9pXXGQ9ItJX
DGLTp6dGj2PDdslKtUB3RBD3pjBt8Lb6NBk3xJ7+J0iJVh6ajh8E6rSP71ghviECfY4tZiYx4F2Y
nWXQasvDT5KIvlKThRgWFdaPdIuN2wnCQlB6YzuQoCGDac8SoSnY4X0UI5lN72W8JwjC3B8jMNAS
cMO0ZZDSq7tIo4PC35YxZblV0WzinwrdrlQ717amq/Pl2ZugAnWYYQNbIe5yl9wTsJNmAoCNn1ib
Cp8UZ/9UA2WVGwWvcp3rmDts0tqJyK78E1gBTHhIqDejbEbbdHvhwTwqi3u45n1nVhiMvDE8cO8r
h47IWChAPhFoRZoZatCG7g4GIVp+OdDvZ72wnv/dwof8FU6CxlnoefMWm5RBiGHLBT58F4R+fPAZ
XP2AeVky8kySvOlzj/c9x9AlDPnMlgVA9tvnBpAYCI3Vi4Epc7tRAkkEy53ddOZWOHIaGiTpkU7x
LkNemDogrLLiEWFG+0ybzUY5p6wtrdxNSHWGgBQCTZGwHuA0MRpGTh7ccF4zQZI9gObZ+29BqcNj
aMt/6/A3IGjp02N+nSQVBHYFqNhj08ymnK5+RgfCWrMCarPbSXI1zQ0YqOOfA02pI7m3vDm2LaNr
QgnH/hXRw/QueqhBV5Rs6bEZgzngQnjFzPO+Mmx310cpPZV/Xne7l6tV1eJ9qe1GQhSCXy5G7blF
DhMp2La2Jzjm0jalYJAT4kTWKQ0W22KPfrFrae4eJda7NryTZpsMi3x7Eh97J6b/YipPJBcLId2y
sNSTqvNS5SN6GuPySWfaFowbDZCxkL3m4sbWRJqS0JmAMYXCoTcu2lbRpz4HTLWBmi1VTaieMATY
tjfjke95DBXhcKf3qrSNQuSy69vTjCobIm87TE40dmPscAxBTFjGkqg4dbZegJnBvoTIXMTc++Vd
YvyEQb+XerNxi4kuo6QhP2cMK9pwSFXaob/TaNjuAHX3ZNPX+TvwmFw/dEv41HdXLd+mr+eK/j4I
dc+LYjZI9eE0nbL0tRxv/4qAukm6hfn37baJtPDE5iwZ/H/A9jGfqOEk1puvIpe8PnsGDpzaEoRL
xhbO9SUIMdUGb7BAgBuW7EjiBPm5ej1zCfUvE3YrAElgWJqesKnJ/Mv+FClEmbjxi9myQgW6N3Ua
QqoKkWAeXmjqWwTvX4VLxMTA1DKNlHoh+M4fEh6m2qjCf94IgZEHz773AdqjiTyuCfwbuTPrTs5a
uqtBvekhbssxnC6TTomz4cui4oZAmsrdsd1RV69FLpNp9QwXKLlW6PLgah0SfpgOLqyTTbdwy7Yq
IOma1KROXr80VKrFAvyWyF5ebuLayMtgzfHEHO1LlQ+zAmb2Lpv4tCUsoax8BHizT3XGBit4p5tG
fNwVFJn6YqY/H9VHcN8DRJajgLPvcl5JcnOcLBmfj5OZB2xW9bJ8r3X7sfEDIADYhM+DIdWZFKuP
mTJLtuwYsQyVOaL29E1bY9fAFWeDP9x03uYn/FlXWHk5xNV8ZsVW8zZfutScki7nmcXCH06NrXRo
057lv0znk53dY2h2/AkZEorJ3ii1qetPu8TqPatwPCGoU8Mq8VrptSXXANAmhZ2DEuH3G0u/1/cH
XezC0XAo8u510S2h9QFT0MuB8/iinfS+aoZM34it671JASr5oRupSofcgxF4HtvGhw0qOTE9Cfd8
3IfAOvL7FvGvevcqAJF7Ig7rBKtWd6ziy6i2IV72lsYAH0Ok/Pv/n0yjyGZK8ugoTG+zktDRTz2Y
nQrbIGWs/4TcsPWitmAjPBvZUSQ4MXgB1YWOpeWd9OKTNwE+rB5utguQXxJkbvh7He7Cpr0WAgvR
vEVcvWAhVrjlpPkQUiPB+2gIhLyz1PZ5qb6SXJfV/ZwH21Rq8vtY1nS7GzhZdrA2LeUq1gf4sobX
6ImECl2eUqC50YFpV4m4OxDf8vyv15kEOD/j8HbHOopRiClB71S7jeunRio0RFDeCHQhHytpURqc
t6a/LKmTKXK6GId6YrJVlXjD6bIKM6BlGStuv0/ZIFRhqJbVqtYUoTBNLhoDWwYd2gE60Y+4M5wA
TQQkF26k2tHtC5mVg2radMCFb5fcOI3DWzg92GSTSUpiYbiNP+eWFx4uc3EYMhuhJdWdp+kLpYuV
5/N5W+21MkmGdJqKyJ6UHi7r/3p0EUnJQjOtyHGy67xiumoarxgUhGVoKD6Mk7xfAFr/hFwojpTI
SSwr+sddYYnOgcGmKEbHXSNQTxQs4laVXWSFgAe2EZx/maY6xg0bgYO/x+POCoWazAiTuaA6hPRb
HNdF44xDatf04c2tSlGmfoUFLSROug4NjUL4Sccm9yU5wQKBS11hYqZnnruWmUoXrgwwWxlZBcwv
81bhc91TMk7B9SdHClLePYS6ejCyuT/GEMZDvvD8nnuaxmWntCFUnYzu/Bq3pjOm1lHXUL0SPtmq
9BGLA3UW8g78POEL4NXzi7kvrWy1ia/XSG7ad+QVta/j7G5qBHB1TmM6kIzDe7r9NJxjjctVpoNf
Tqz1UDsgmsKTIFAje4J8O9n9T5PmlYTxg7DNQvgFZ4ZY1MilEVoffmU2r8Ys11bg0bpoI9Nf1AcN
p6jyVulyV0/81JJiePqf1Bz13lARLJiL+SpIm4GTsWHHHPdNM3iVXWBAetGZX7yDd2KQpwrKAcG0
qu0BS6rWdvj0Xsy2CL/aCaiQyMjrCxfsyKEwj+LTo4UGiDg6ZGHUPkk3d0ReRHym5cUz4HM9rGi+
bWSUhWE6hzgdA0Y/POzC5zoYJUvd06yjywXt30KN2NWCrtjG1pfKKN78MngSU08MIk+YZiFywlBa
0x6WblD6paxT8UUWfllqhDSB3xO7l9OpP78QetZ+osPoZ3aE1zBdRTO00t82eMXe/rnLy2/IRUV2
bZBduerG9X2QGR4CBCnMqPvdOC6MQfgz+69/oFI250zSMXwdPnZ0Flsoma3aHRSZSKnYLj3MMk0/
SWgTpllOJf49YuxNWlfMk/D9+a3HwgsBSa9ICCm5KJaiFyqieEZL5v6e7QsJXoT7jKEHvA/yu+dp
i3Q5T3luewxwaCGl9bgMj8r4UcBwaKpXpMivB6tp00XSf4Z/9PmUqHOOIjyAT4x3LjF86NG5/DGh
JTMD/Bx1qxXg3qmPWXb9oFxi/LO9ihsxqFddcOlbkOCDA9XHHy9d2aRxFJAuGIatyTbc3alcDr+I
YWpVFsqnZX0tyMmKGSxJVtuwUNw5fZA92Tfvj7pR10UWUapIcpVb8sXIOtbWjusNupJUvkvg1l9j
Rskz6aDlYKlL0en+Pp/JD7OUgUoHKHbFA1ZIneYNNW4YYWxl2g2Q8HZMMI8enfrJHfVgxjPifU1U
o7o6vNHIf2pnjz1DnPkitOG9IrBtXrN2wa9JRhkaZOuhEIuhJUyr8cTtTokxV7x69cth4ldhOxTp
KKgMth5w66viVxflOm5S5J3bjbkIL63mEEJDd7l3cHrLyeFxZD4ms+BIyLhw9Os/yo/pYaHO/nQ2
927Kd3Q4NPhaWSgzl5SV8DY3mGKK6Vx1UkivoIbFeXc529LImSIzUQIIQYTA4XaK9lXoQhM0pG9k
jGU3DJhAO72ZMn7JoPu5nJa08sjKIPED4k8TZE+LZbeYtR31oXyATEhCnr5NqwKqkMoX7utfDUyy
rJgw18BMYV3owoX7G/tQVIP0jiytTPc4rFY0PIVDOjpyWK08RnwNVkOn9w4fIPlMARIszVXcymPq
TclAkpR16yH3AXXDvIgHtGZ8RAt3qW9oElDl7cR6QBZzddiBvLYnLTea/P3fZUz5db8k/gJnLjfz
oINpe0EmF11aJ7/aDY1qqHkRRAAX615KO4vchu4vS7C25yB1AZlryJIW0uMty5iciFiyLDii4e++
BSwU7TIas6BnjDF4Rv0AKsk7VGKE2R/jK8qEgcbwLlOEZoG2E6EhQ+S+9G+jJA3AN4A2eWQT+7/M
CoyZzeIPVYR7BJeQxdeC5G5KDwjy/nhMQMh/y3MNMUnaUBF8A3Fk/q5PnLxNebjFzblmj7P095rm
EccpawWPSZPQrXV87vN+o32Gh6sB8DD5HSV4jgpsG7HbAcEUjyHV2Ic9+9baHsxHHGPx5kUEQofC
8WfeaItN05cIEAepLPdt4m94HvyTQY8gtLaezJwhMt6thcM63fYRVR4cxOyS1wZnMeYUfDlb9Yiu
E+zdBSFztYMRaNWexIMSFsul2k5FziTKp0czI3+8geZvxHkk9uKtkl98VAdLZgq7AAiyudlV2eFe
dNckS+6kEZLWGWHmHEYgiisFLF7E7soCIs+E9V1h/W6YZKS6tHVHuVK6wGVWlU8yL2ltDlt4X/cl
91fSVdEKYELOnINPgfmhF5pJMMIJzpY/FBNOtpThfimAr0MnM0EE1e07o5rbAhoLXGHJ4lr427VA
sao3SKDvEs83sfsDg5EJWMmVrcX3dAmtrE96YkTk1jGDfXZf/GACeE1ffJYKr7y9bsTJahtPo2os
/ar5UCsw70QZjiA8YQytvucoSwycjx0Ov5VaDZuqrcg6OgvIVIdfPFksrdhzD4SJ839+TnX648+I
neA7peU0xm2PxxFOWpEuKRbePnntOGiIQdhoh8GfM1YKIv2W88XGQhvi18Jp7sXXilLeaLKiFv73
8uD62tlC/t4crnkjvWvNaP6Jul1fkDWcmbkTcosyhMJZI/rnVx9++rC/565VQAmx9+epwZRQhwhn
JhTyUlFEvxAFcS5lkiZoFlINsaHSmnqNCDHJtJeG7cvScEYDMUYSAImA0zU8I/1WQx4l9SpHQ9EM
tDoF7FMtsq/30x2Us9TWdJWQq0P5lkSt9L0txznZzZvS/CfgrWBA8feF2i5FHd+isEzxVTYshUQ9
Wu75RHfMem+NqnEBHI9VZ8Pdp9zOs/vKpksMlIn+CTJ/sdqpn6GI1dByRAYsGOSt5EMLiaFJnmwc
TD/FoppR7yEPUX8yWxyunWjW6P3iZkhUzo25HoDnISIK2iTmmcoKfe1Dq6l9ZVc57C0qFYAaSPCw
fPE4jdG8FQWV42ylEQqFHqK8ZFw0s9+nkkFfjALVJcnXc/Ml4huGhULmJOEm7F2XqvLmXe3EzHDr
pGvcdG3dSKXxDWh+UPe29OZhDDaodqhjwmMtr7A5ApVqUO0NyOvyWx4+4rkwkkW3r4LBZSsWEvHi
CFpIDirCWLEC/Ey+tsc6L6bjW8OVK5qpcgA2VBf3NL6heqlDJqmUqyAOgralIYSwKhy4VvqkL3Wo
9KoLEr54SN0vzmA3eOjFKtDZmZV+z9oPUuoOZha8adsNkdCKyBqxDzoscN/YKxy3TmdDW1Z+SMhS
50SRnBzyj4/jiSTQAixvP8vZQ4+j+wYEjq+MSaaw51LA3mRRs8ap4Ug1EKJzWB0Qwhyde67hnuZY
k155vuf+kqPgzSaR9Fgg/x6UJhCR/jd0F9+DJW51KyGTKaJrBXiesHpmcmAX2fJnFHbtfya3H9FK
XOAxr20YhKW+gRNL6APev9mVoAU6XAHY2vSxNNUqHMCF2YlnbETWyeDIJ4HH9HW9nvw8yvCNd8oR
ZD3VksggVVAnHipT301pCigVn8vM1jHDEdYz5zyR4k64A0KqRDBGv2wfrcGJ/8NfmUv+j7fiUxbL
zCVKJTd+nsFyt074O1Vk4c2itbcvXdt6+HDhAx9nowoj0t4iytmhRL/chPR5eAJGWT2jzrOxZO+B
z4Ai6o9AgAjTWPua1XD/Ogoc/URAsqEu7PvB0pUvLUb/NV66VgYjkRxhizmXcFYfTYeziXXrgoFt
lnuQ5t1R3CsvtbZWs9SsN2JrIUGnFVvhQCQGzTZJbyd9qhRfS16iheOQ3M/KN0RidTGf6viX8BLU
CoSeT0nj6rnyUWgrnm8nk3BVKGaGuAJAh9SzvQT/+hLiD3QVST3Hl0hRr9lIIGsO4gIX8uFK36Ln
wvjLawKUTdCXet6sqk9Pma0IkPqhXNh1WP/gukrdnWUANxS1CvAayFBxCpzcPfKGaI7uFKkeC37i
6bRI6ZIbH4ka6cmR4OwtBS+C+67CabRJUTwf3Q1zp1aOBfQ0PMUHBwM0avAQoASzplGAEem2ARqU
8bcyiud4W5xevhcMQI41VmEQQNVCoAyOpE6p/BbB8Yd8B6WRgiSRl1f+FnQjFUoMrs4VDfDBkLJj
qxZxYJoBCgMKFtnbMMt/TD3wQrrUpAloiojovBBlnoC8kdbE+Hw5cdcic+azaMjNO557fWohZwz0
Rda2lLXn8THo2KIoeknck/8XjT1fgrgb9GJt0X8C1II/vZDOgUTWTH4n9JVCSzYCN/d+uIz4Mg1g
koPANL9ZyJk2C68BIQz3juIwefb3XrMesUoIhCACLxyEjSre8N+IuvtCqXc2FHSl4A2A2iTiQafD
ZlHn+KJgZ3SqNdWGj+Z15up/52NVkwfxhb60vfk8lSdecidsfVjpT+nW5V6/aWk0yrpwMIusTGqK
IG0sOnSElfKf89Q6rk//O9AprzM0xA6iR7DueTx+w+rJGW/3hy9hyVbnbU4u5JzIlFj0Tr3p1VpJ
IRMpNY5chGUSD4mE+saqjXrvh0iOuD99dprnb6w1n9rqnt2UdvJz3SDnXH2kaEZPXcZWYfcDpaSK
wezNoB4FVmkeEuDv3I2ZMIUebgWoAo0Z2v6WVbgXRiBOFoJAiDW4XfOjUbAMKE2D69J8grL2LdG2
0I5mnLkonulGVFU/2KXSOKSMc523Ih3z9TT8mpIsb3xJk2g5QIYuwgsOe1WIO+A2phntQ1+6U6vZ
T5oV3g4o3d69Hvmo+DOhAzbrYp/ApxpJjhGDr/g3n5EJjfwZIwANkvM/6DxqXV3mpz/4Z+7Ru/aA
Ueg4+y0mcw8xSVqynV4z9VS9ktvmozbLas6NCOL3icVw3k4LEnnZdD6uVEpEUcsMpcTWaPcy4muP
9HW/1K1K4z6zKZyDzCadikrArZW7pX/kZ960wTrjBBdd0N2wLNK2CfSWsgb3VqYgOlt5vOqQjjcE
VK3pQgayORB4RRFZC/BpvdQiPZ2USKV4zDO0BzmnwCsrYNycNUbKNBjpUyZFjQOEKGzNbrhOg8UJ
iLxsB5krcDD52eNf5HS/ojENKHZdOOEw3LAaUxNrb6+1nDPir0e4p6+lEOLsrFtBJoYcwsGpYVkv
hfNLPezlKvNUECuSy9pv/TEoGep9HlL2VBkASIBwxGfMgDFFzXy2UVXFV+cDo9uZgZ+In4eQ4Dsp
IK8vxek2VOhU+1fAiBMSuouBT5Nm0OYSf065sT/5cS0HXVqM+SdwqM4lBpmBaiKpQPgB7NBvlTPC
RGy2OdhXrC5jj4QhkAC7awhepDhFaCt/U5qJGbdMSVJxTfr3NooAB3pHSRDA4tSJ5A781J+4lx7v
V0nm0Q0GuVeF7gC9lxLIZ8Qz23LiD6315HG6r0jZ86hMhSxUxi5B1cH2JLDZ1WVmn3aC1JpvDjYJ
yl4qXUQRDfndTfyleCoR7Oy0gA/T14pYNZnJSIrsTldBIO7jBUHy+5bRasWS4Q0n9S/u2hEc/Sgn
OiAXBhr+3Mffifh3C3f2mXZjtXcvjWM2Tb/w4iZ+zx4ow3ZqzszAzpzjh1wdmvcuAS3aCpnPkIOf
CFM6TcDFT9ozw6Pt+SNXAU+dpzAjL/8bRsAhDDiPQpDUPEoavNA3wBLMSOtcbpIBms/tWRpNuJ7l
FRuobdpsZ2KsUEQewnpJyjXX2nvhySoLG0cilnTR4UYycgKxvNaVZ+rjlt//uzs36Cgn73VPrpF7
iz0+t89ogxS7zLVkoRL3e3xjeQ8+ph1GMqn17+kKWGUA7eLic3SsiLvONv6zhaV/ie1IpswsYiY3
mPPAqxT/9d1S3A3UlmLR2gcMLejwtycRT8mU5Jf98ZX6JG+kBJQN/eeO3UuyrFplzEkUWYAVI31m
c2B1AkdHdbPwR+Y1mgrhFJeg4rdeSC38/ml9Cw83zq9psmRg9eBy5hpcLZ5BoRmJmD1NXBq0iw69
kgjT4xdUcqxygNbH1WcIdOAgqu0CFXanlNbhXiWWWRGq2oNtoZ/g4eQNPG24ARVjnq3ziP0rTnSm
nEz6ZV9WurC+lpULrG3JLT84S0NF7ZAlgV2Pp/PlJHpPOA+D4CCKGEd4oEhrGozka12Fhz0uGEbY
1FbdHt5rhFikxtBUW+izOK1t3u6VXdz9sfI9AQnvTjL8/91wfYs4RhKApzEvTwfR09zf8gdt0SvX
xEetp+nPawFJ32S+dEvUL/MnV3xvEg7Y3bVVkD3vOgOB6YrQb1KSfAvZodcZB+fUq/TyBlR8C0mu
rYugvfJF3W/1xcPGws0qeRH217xoV9W70OzRmwbQZW3giMTVxoQxPqhffwZ6XPQ5uCs6nd74As1o
wTlcDQQApDvpWP4BmdvR8LBZpoFCI8VkP4vaXqoBc9Q/KNj6poWuVBL0L0bwGSCzXVgo1fcQGWbQ
YwVJrl9DC+h0E+JBnv0Fq8lCA/lTEq9iXQ8bSdKZU73wU2FaXECNTZfTTs/gVdPUJAjs7RIdkuDZ
zN/DxTAw043/5Qn/tpyhuWPNodjx+ptVuUUTxGlLokr8YXT9VYiMTdPFVKg1UOqIJZkoeb86G9PD
k5beMjkOtgkd82oJKZzNmRCgel3tPcMr7kr+5H1Zx+tu9Ml4dF7lgWp9WTRaEn/CT0GdnlR+kUyH
9Yp5CY+RtkUfd36+sbBSecGTSLHaOboA9eMQFq/nDAU//eL6K4s1Jlf+pgKxZeMOglAHZVQUY6+B
2sPMFn4rxxJa5jRI+faDfCNqCDYly5qu+xc/V+J8IWoNKU/TcT9U6NGDYqBEGuiBxZZfehggBB5p
TDiVJfQ7ShnKYXHn/4dCgLO2Dwea8kZGK1OrgMKa0aEBVyxsVZaRQRtNqQT+/BXMudI5KvOZcMBe
bijqab1rAtMxR2uzE53o3C0jX1ONut1iV9t9BNDo7qEC2jf6tvygb0b4x2pcJLu2655fxAO6z9mv
gK9KP2G9MBVjq29Zdl7y7i33bFAS+upTXzMsGxD9nGvjC84miUEgnW0T5J+Gazvgc2wOMvPjXeRG
djhChF7hOfTDz3s6PvdsV6g9fp6yDqHtig49lkvZb7fw3woVCdqxdjFCZuI9R+lffpdHyt7Qz5Td
X2uFIR3q2+4AEhRFqaVzfl+ZstoSPWoFyGh2W2Vkn9xcFHr8+TN51FXVCyj/4TpMJIY+fGIBFSs1
RH53k/S2zF0kCkkzwqWyhaUYx8KfuWfEPF0l/AH83N6Ha4Crn048sGa2rMmmfaXFWEdgt7QtDYwV
8RE+6PzoJj9FdQDV0jw6/WAyOp0hTt2cRaVcmisKYxBmf/Nq78JNgTXrUBZz+1U/SvhCFBGodJj/
QVz+Oh/dOY5LhAhuq9wxdFkEotUxZntVyqnTDZ3cg5DbFz310VHDWwc6J1Ba+AUG7VjxEOZpGyx5
RLuB8X06iHM6SboQoQ+Y01M/1PTlwPk+KUbBF5CSvyJmjONxnvfBPanmvDO4NotipUq1gI757Zf+
SneC3ug0ENW1RvUoN7GSRNbkZafHCtQzme3RgqDI6VWirTsi1zI4L/JmEEz/kVTMCwyDL0iMrKnu
MAi81iNdFPq0jEhwe/wW1EWFLKqFjG64w0fbTkj3TlIoQG4ajaEl/deojDchflQtTyO+Nu834HtB
h+I3ND/R3T6uYcyWWf516WOCkPZQaoPvqeQYi6IHNOvVb+gln1nFtTmTPyDoFi7M1buZrfmhDX7X
egZhODCbfk9msbBjt6GOqTKVWME+FNQDxL0uU6RU7kHBXBJB9mlpcuJyz4u5KP2dDfxnTlExqqME
3iL8PBwjT1eb7+YZ5ee0/XRq68sXJrdaHEEEt3dqAQAdmE22MifNJjqJy864tPJI+GvlQq6sNUMO
xyYY8UXMsN7Jb1rqTeSN6GuxRzRgFnSirGh1sHCQdRfFCEGV8YC1a7LQrdb3zBA5RZSsyFsNW0Un
GflWcNommpkvpCypcdjk8I0iK7K4N7HzLB7sLtKwIBRUZiBMsRJKMo2OzjrrQnwK8fjVPT69o+nr
9vopc2UsAvoer1WkvnlkyI2FvHRbOYiewEwIIHrWYciRR9+34MkQD3IMPaSqu6rhLxXwYrI5LI8a
pT1+B3TteTOsARTAOYdlLA0oP6LQB+cVqQM9126w7ENoFTf2MWJ6759asM7Uz3aZqWMe+hyQWNhs
Lr4kNPksdCNlR+8QwfKjR7+t0LdZv7qhZZgQsXBCw5yOSG6CI74CQ3pxolyiN+OuS0lZ/wE/xxAb
UNpb+P5trlepdf+ldzBqJqXC706j/8CH513uM8SbL620Gh0y8rMRd4n+csGOyL2tF8Tzj9cLZejv
NvxZrm0FBZhFSrwG60Y9GKvR2aOPMqIJqd//1mbnt55Ed+Sa2gBEZgNVvHufDKZD5Lfb60FLtVrb
Zrn5lIjoKuCEvWTb1vjcXppltTc9fT9S/kKADEHdPrBfvpNiJhMON1UuV6AYCo9iZa2T66zn+iOY
czNcGK68yRJBQC684Nl/eXoRh73nZSp04nmmIghBL1TPdDRMMyw9EElXni0CXDCQc+3KlyWAyx1K
xwHaOq44dnOcET+ykVHW2sz2FvaLuJ3Mes02ZgjCyXXc1n+k/OFPG31tLQSIWDdITXearv0//zm9
Wd8UGwAFN3xjNBU4jwH+ea+htbMvfUMRyMLcuhdFDRn3V7ZsaHsysXssRKleVlVfXLtMpFn7upwX
eqUspJc7ju83kRkVI1Z5sXM1sgEtqq1wuuMujLphaKLVYKZ9R2UjRCETZpwBKoGnXq5HhY8oecfr
umVkl5Vi97wvV2SbzGkimXkE1BxdYzPJVmYuusaKAaHV3XtCP9Zes8FQ+NaQjMePcKwtpIcEXvaI
/J99dpymvVT6wstgNxzPsOsxMk8N+P6f+0waV4udOpPdSVhMaAsmFXN8NVg0QUcgHHxq7uAOgwvG
Bgj3qvVpy1w2g6MXj8caO2/RjFetXnhcUREbifuU8IMtSEOUGT9VE3mnHzc4ArPpmwfRA4mglDmt
qLJQ+DGTZr2Y93AfAQ8LxbuAEeX8+BXiwEjGxW8RucjzT8Jko+dfFB1VPU9aAuMRPhE1c68Nk906
2GhbykmWV3Hwh48cRuS0bIUSFxEFcFUtG0SdQd53doEN8ROisrCWZkDbFAYG1T76vRUpFsqfBQE/
1CTP3qhje7C9DXKvArgCBbN5JJ58FKCkhOxZHQ27/Lw0uJBkzeobyEp0LrUgkpUVVBL+8CX7efbU
JokqEIMJ7vVc9c/jy/C1w4Y0ErPTP+WJXjf/YXIlDZ2vlVBlitsmV9J3L3RP+3xO6UkNq26FUAQG
Q2Zg3bexKKAclS1AtU56MYrLGi0xTAh54D/JyCAS9JmYVw/Q3F/BQ/ZjyQnJn2dM+4IeERNN7LvR
GAQN4BY8mMJ1WKP74pU+Q3QqwXJxbvq6c3jUZTkomx+DySh3jHb10Er+CrYWTxaV14bDnzmrUIvE
nALWcmwfcuLJHK7tUOrQ0VIhwO6Nc+JfOnHqzBePx5EPvgriBRZXBnYPZ3gaXsDjDNnEDtUG+dV/
r/tPNPjL3c8kS8sAVTAYRmeQZPKl4HNqw8uqAP1BNGnPjBJF6FRNo/I5BV0eDV7WwZ0AjihCJLOj
aFcqcXUjkQN78FIK95fUVHS2bv+iv2kohwb4SFgV5ddvZ7CbLWT/cFWXNUfqE5Sp/bz3fTshgXbS
DwSZUAZHepkzG3tlAfQ4DuFYu6kIFm34Vmlicl1JYMNvC8TGPeC712/xbgbiHHVK4PI4VV8/Uv1i
rjQBArs8VlMA8t7OSQa6/a3EEI9aB1qDTUVts6QkyV6nq4RxPts+JVwitBZFqb/Mmf0KKH4oZtLS
C3sA3o7iZz0rDwDAcsTKGm/09zIupO+tNFfjO3+PmrDr2N9r7U9BRMdynLOd+3IndB8i2UwjFrWV
q5PCp6lczChX2lo6o79RY6qyuOFN+vhEloLZwGEp7iIdKqmf5HCcvpV90byzIK/1aDnETk/gcTmn
SpEZSdGBrJ/FpI6O+QMep0F4JW6ik6SMRqr8VNDtjgFQUYMHNhPkE/UvbSXnlItXep95ORGXg/Pm
z8kCDlLutFRaLmaZd9UaDECr8I+gsoN2Ho2EnlxX4zfE11G6Diz+tyARheHPdTkE9yNcjSoFfLlj
trf9NvORjn2ZBjrYXa9LAd9H+aoLf+F34ygMQXeiSWlOfswjdqQDaKaLHrdsUjL/A7YXKBZFqN9H
AYHP7ncMuZYs96MBZ1oTJyoFwqz3fauxMXnNlcMwtXxoniIMGoxC5qUjNVTduJk/82bsWbPg20i6
PNMF8mQAR5CRc82FCR9yc85bcrXxfXOGTI++IehmY0waevtHFeru9KooY8rocyynvTc0TUb1KvU9
7nNv54dHCb/LrzPHKXgjTERo312X9x/tryK6qHdk7Ymqjy6pYVKgKhOuCk+RfsPhLEAgxv5oxa7l
fkVxfA2q+tKAzHAScVbdnz7DExJP5U9rAKmvtOqDP0ieW2DpWSLLkjLaYbmL1qqiFL0elhk8wbiD
AGUNApJEGOoUCy5AHe3qIfKsjNDRB8DQA0DaY2yrjyB7HjGij3cOQH7XooQ6+5Ayttdn2XM38bhC
zE56iLje9HuK+vBOx8eJQuiYHnl7i2FvJt3ZUdmTAJW/p4RK9RWZzV8eELpfNVTpM/XctEelkKJD
HQ2EmAAt11a67cyatc7Kuh+6WeIMmykX00cSdm1zjlUDKQV8FiyCj4Biz8dKwVThf+3ijeq3UNGJ
zopoX9pIsqQB+RXH5VxFHT+A8+pZg/oKahfwc0yZ1he8GxVLUoKXRHguKdeW5EA/jDknYIGo6/Qb
c6F/S7gv09i1tp8b2rnErSL7Bpi5zqSy2rhguyonEARpJhlzulu6NL4vYuJXNbr4NFN8dRTeKDa+
MP7+9nQ+yFvT4+Wp+zR5Xowu05LFsYGhR6Sm6vueYRP7FCXWwtklpulytkRWV8zSapAOMOPBU757
s9m59Ye/p5CrsnzOt+fpmbdRV4W66x+luitT6W/OZ7TvGgxTx3FfKFbciOz2HwmeRR3PQ9B8LrYy
VXkT53wa7KP8sWkVpyI/Zp7WHcZu89xFf6NLtwJ4hrqS3q/kcrOFLAylKnkPeIpSX8avyHLDT+3O
NYoeiodyf1bsMiuZyykgELezUV347HdqOH7DcgxJSlcJ5p9pbf0CEb3rStUQueTIerwSq3QwVycj
TuTrqqMgRj8vVky/D5MAqhwUQJyPRqsS5m4QhSiMVH/u6oQtRFTpG9sboGYA55xWKdpnnP6FJSnu
R4bWF5deP88qEuoJPJOUToHp2ZnhL0/eNL3dsM8el0EnXMvBgTwUshs4as+jmVNgTeQnHFswBEH/
Crg1HwKvEpjm6H3soZ1IuLlbtc5CiRHJxVZ8Mzc6RoZI5zVFmSU2EoFrgrf4V+dGMnInBI49tzN1
29rM3ADL/HHUAij2kpJPFpnH9C1cJ6t+Bscmf3XlLk+s1cb+xktmFAAXBvIuLcHiaaa9L4si36yS
jz81XeOorXoZAcdc7ppkqa0vUxo9CAJj6sfBM7aHiJnxIfXhEuQaan+7OszxLktLOn0qTlPGOHb+
tmbAer402J+byU7PuyodShYoUkvyzXKRfLfzyfyHl4o/kwKASGNYmalgcqC1I4Zoel3zTB7tPF2u
+GprbSFlSK6UefxDjCdn4vUaX5+2ISSjmxQfxSE18sVKOUo6CGDrF6H2Ev7+xEZ3Y1A88rDr/gU9
qtukiv9je2fV7vKzH/x6OaenPVkI3Hvn8QXdIdIWRrkUTIuHF/D+qOjWeslhc5Grf+WHJgZub//A
qFT4MKUKDaLNIVZWvbMaIbfja7I9BvotOQYT5xGei6Mpgsrg+Oigc/1IbvF1a5j2PldyDSuH3Msw
jNBbTNskuGQ5nYN6gKwiIwTKDMLNNK27zsAnzxYEH3Elxxd1dc4Q2rD6ctlx3HhUL843JEYriqEs
3qQ/q4+U2kUcWwoW3x/YD9Sev/CUuPf6FhBmjjc5n6YirfT2nDeCh3PJn8+aFhj3Fp0uzCn94oim
fKShGkjEH7iLCebz8h1Td7xQvoyVeydZW/UEIV+0JbPsKt0oY7wTYXftFhOoNRIAEm8tgJE6GhK9
UL/yL6FhR8/DsdvbddpJ4x7S+0q7akR3FBjyIqAWErwsLcFpeiaCYmBWtOHBPbNL4FbDcaS95SuR
Av4q1fwRdQK9qhyzVaWn6FJfWVWSOsZ0pOzKNEmTzytgUYBq+S/PsS0t30LOJnsd7j+0E1LOZobG
xWuNwHW3EibSTwxgH/5FsfkJ4e0efbq/wLF+mVgE5myrFnL3jqUNVuwZjdI5zw1nVztjX1FRE31+
JjSlBmpuwiyJFvMu9L33gQUBNMh9uEphHAIF7/sbQzzIxLyNSaaVaKVOd82ECiEJqke0dwghPQhW
5gs81lAIbEl/nqm6lF5wZpc8/GnsmT0nQdxzhO6+zEEN1b1SW5k2aSDNXPa62pUTxLjcrIluXsPn
FLWY7Zj6mNO55Q+ao+n3AEoSdWBDupWgBAJwH7bzwUTyhW6uLqESi7CxMnGTc1vG7D0FDmYSmDi/
b5gWiTvvojaVmQo80o0g/05Lynq0QFQ4TmG3lLPUZ8oV82vu1V01yXzSjyW+I/TS8P89fF+dKNhs
HdGlNb2VQ0+kdFsCm9hqmxPOB5gKdGpj03w+Rc2GLVDLzpCUJvDUL0jjc3D86aubLzfsF+/Rr3iS
+KEnQtwbRqCEvPPzkg0e76pW5toQ7bY212QnaVhksPKd5XYLbWPQXxJMZHPJMs+H7NAN1Qgok3AN
cfd/xpBGZXuExLSfBAn56x0bMxDk7oCuEvfQBKG/pUkz+AKMEreYLRdhFXYj60Q0r1J13rD4aYtC
HaHYWN9A/5eB+DnnTqeX0q9SEjEkWCcVe8sLL8kH4loBDXELdHtbSTDZV9a+Ev/YoPzbsHTSDSKI
l6QxV6SnO9S6Helz78P+9q4pHaGIcaq12qhynjRLULz99WBsHbwkAU10mMDWRGt1m1eTA0Zv1wU/
RSYUzY/ToVLTGRVqTcdvmWfKkI8oEsiSge9YdDjBlx9NA613/9P3UPiXDPgqJ2/PbrOXyEj91bu3
1buK8eQfzSyhn2e8ZLaxsPEbMEQjGmL3GfdxDIeMTjmXdTz9+9MRz6so/7iKNPKnlUpMdaVaQRUb
b0myB8jToJUGeogYkBmDF51FqkS3edx5EMXNsqRPDF2Z2/Ko3gFfgyLafqap8dJ8LqgACX4adYVo
glEpJ5MSjbr/Gf6qh8L3zUjqZFhnWiD0FbutIU0hnaItTldmsy8lJ5YG8HSP6s3C5jfvGTys1qC/
XDQvlslX5nPC3RAJAFXjT62N2meJNtGw19ksji3zn6meGrwsTZywswGvWkYeVTw/8e8vCR/WOPXQ
njE00uM3b1usZm6QdEXk96nWsZBEiQcyV6aO1VfxZyzL4jNBN2KlRNAqqfIyWb5yFG/4o19I4MhE
QvGvBiqZ5DBqL20EubTiClPuGB8O3LX0Hr5IHbyXB//sxjlEUuhD9vcaSug5tP/9hN8dmf/ttwwO
OyuAaqg2uTuMDU4hKBXbuLzWwetSHtEo9e59lVNlFngtb8Xm7MFPZB6u5g4Ey+JHI/V/LEKD3epO
dPuX2spJISHEzR8EW+3bNCr57d3Kwu0zyv9K0ZNkDwvlQUzSps2UENM6cvOEqxht9J9Y4oc1Cbz0
ZjgveYwpr2sk6FBGgh6C26rz1Hp0+D19lHj2gtzGsQS+xW9u8b6mLfeZuPSRs1D2KwA8l3l12BLv
/BPMDKnZxyjm/q0sI/Uc2N8aG4F1zK0MknlVIvvbOVcTbN6O347e2+BneU7y+KOV8sHwNo3Scq9H
VoN4otMd9GtislXP6zkOE/qofDr/Rz8fu5bl87XrY/Q2blAfxESiV33uq6q770ENSO15sWWZEggg
zx1MkZ6nCtoTR1JCMeR7LGNkHBrfv2YxrWpXTG6BLufPlGFYQBYRCT/Y01Hk6j/iX7n2//Mf3EVc
Gchij/0gx03kwIzNpV9Nmkg7YjKAl2Z15gzRjpQk1syanRsEriFmv1bSEkOO8EfLJE5A02GhZeYI
Gekf0zXfSZDCdahjaUdAHGdAojsgtuI/XBpUqHbk64kPsyCgd6KC8qq/bEcJ/UujwgXMVGZtfX5g
2FRzdpu5AY81HeXrj4zoPsTUapuhYY+a3knVhyH+3nFT6u4+Ej8DZ6by+lnxC630HZthdOyzpI1d
XJnyiHmZyDu/kKoSmxJmOX7IoDjtMecgZqyDX3U6tsZnS5MTM+VPHz41i45ahkYy6D57FecWs9Kb
TD03s7HTmJ9Zu64TAONKK65kSW5ga9PwbBVuyWdDzPqoWtBekYQ+siwTYwKLyUIFSAQFHbRKSXjJ
KIHcvb93wxTJb6NeEA/8T4p4pyfjtnTvMngeFqNucjJs+B/IPvpBdzm+1rGUMos0/9sRSkPMvchK
RQfrJG4bc2KC6bIsgXBckOac2DuR8J/CWcYaY5iQx2uBBLcUO8581AosooU2ibExQ2LGq8OAXKnz
rjzHxxvpYgr1QedyX+1SmTIETfbqQDB6OeS0AZeuIC/77M3w5hRWhWcgfePS5Q+aaRoHxgwo7vFq
zx5SJvG/vbkwUSYuONIaHrxXD/CFWmvE4roLUj41i805KHYsG8rGXJ/SvWvBXGmYVx5bD7IJxjN+
gxOXhLV80Xg2GWpSlcjxbRqQLiV0+UHuu3YpGZrnsV9HWnRHjx2/PBvM8ucRxiYyjjvqc092aBim
KQOSDqAgIQRiocvh6bMqpLBe1LS6oGFOap3UIyjIyKhZV6866n9ENbtTx9xLoiyGjAg4Yls4w7yY
d8vsJY9k/4UiWkT/4+QkmsimE9McbVSk0ZGhPIcs+mb2OU3F0IpElXos5Il4938+yqTZrNGh111w
Q0TSuFuQGW6iMXbHSJwZQRYj+82fxccEitH0+X6ggf0SK9umcJmmsMaUgR1CACqbvIn15n/wMTzM
6ruTDf47nkHilSqnfUl+ez0BzMaMbDeTLI4jBiZSHpLM7LMcTvbrX8z8NnlbfixYL1Lv1mQr09K6
P5TxKLI/wnksgWdRoophUhEQR7TQivvF9EWM26UcF+TWerixCcJc3xdNkWdGK5/+CHc8Y/IkyIT3
QXGlE7oakUrDLUtv6FkZXEJ9SdNlVKfpHHUJN/0H6k48xN4OzXGRi/WsEYYeAb//aLH0/q51quk8
Y3rHIkE5EII/s6z1mSiZ0J8qdS2cf3EY6dteeQMwCqYzTJTnytopDT88wW+OJZ01uC/R1inbv4jv
eg3Gon3dftXp9IByoLWOQszk8tn3zZrVyE0XyiTAMDYFIa4AzEz902+JVC/GEF5uKlnL4uSqhDH/
g/MMLRYvzoSVESViEtQQBw/eVWamxC/+NXWex0DkgRAihDjE1f4JXsxCz3+0F/lhtF93UustlNIC
OG5NNmQywAEjUli314RnOwIgKdR+9UpSX6bbaIQNMj9tFDGt3EC3wJS5OAHUUNyh4igLfjozGc0R
YKBZZ5JNJ62hGAqJdpjhK/C9tIciCVEWaP2/MoDaHlAQW5knT+0uKF8ofBTdO8tvaiV1AD4ciz31
SUEXhbq6rCOFCQmAbjgmM9G7WbA1h86KYeOiZhmLALs7d47D8Kmq6dLvZkRAsb2Z8NZp6g8odbRc
wICOc2k5bamxT0LqyABoLKtmiMsyTlE7XEgcCFhYOJWv2w+0WP1dYNKSNEuS2gzm/EbjjNXimXtL
4ziyg4c+Juy7IjCmoym/d6Pj3ZKj4FT0ghHAg+YRgev76AEnpxFJ0mCW1uvVWy99GQ25U+fND3mi
s7Sa2b+qnnVU+DH9i/CdrVkmmYFD4Thc3M+r3RLbDqwE2G6RwACvVRNk5ZT4UolFAX/457rfzSee
8aDJaYU0P+BAJDkaTQ0bsSYM0ZSVPi0S0PLt8bypZ0Prig7UT2jawA/QiGeBeaF27IdqGBQwTz0u
6mTvP3z30jzXqaZxPCSCoPDOZBcZaqiaz/1pax/aT7JSSFBtUU9R5akJpRM1PUNXP6g4IclzaIub
2D3nEsGG1HfaJXw+MUIPWBoB3RwihESH+r4HOXwPEzZniKqH5BdosecEXACxsRPa/FPzbXkxi92C
BaFoYLhwI34mClhF2L1jlbcC7Hr5M9ajGwXhshTY9T+qcJDX2HA5+5h6ELjgEP4u6x2iBkLDVuPA
gad7EyPaNQaGklhOHd/f9faiN2gInOil+13Qv+kqc0jaj5fwl87ZjEdTBiSxKjvtH/8vHm9Lla23
C8x1kWnX+BjSvB2hZcvtAnD0f2oUmwgPA2oclkpNlRTZKJmRpRlbhR3oB5MTCfAk7Og1MoF+WOdl
SRGA6OPXF5P79M8EVQ0dF8TA82yf5ZKl4XVCb0+eROdmX4YHW26l2c/mSIoSxP17Fj7f53V++g5y
20W2Gl29PjsBaBuOGXRd4Dka7Pr4obvZTkd3Ue3xUWV0psyXpAJw3zjWxg4qU/C1vJiKKi388Z+a
PFJi1yQkSUSsxbuSHRBC+/3DdYrjyhVQ7XFVnExsN1WzL56UHJ9dXTkSJbqmaWDSjG6TBUtsgTIn
LI39K8Vitp1EEYGSufvUqSoUCnRKjgP7AnviKUqWZ9k8f0yd036IhrY3GpSsnksrjiYceNfLOI00
7yi7E0MrG3p7yTKDrxXZBPiXZ//0UdSdVbw8jwPKPrkpNSCle1CDXcirFV3vMp3hkZLYPdPTU0xV
VdyIs70ED1tUCLwowdtlgK7n28SjEo9Q2kLz2uQG8uebLGc+q6UmP47q5b0sgK41TA7aeeLfhpK9
WL3PKaHldu1xGviEh5x1yYK+e7JTGxY2khxmaCIDmqNPJOkAk8qGp3hogaJXAoq1ba35DAADBdqf
4XDAWMll6Wmg6iby6aaVVFhWQrMdO1rGIDqUVN+3FoS7nNFWgIFK+t0wv/5/58IR0OLlne9bM6dM
Lq4AzotiHMVVJjzmRHIoRKwiJEwbhJdHv1w+3FYUZWxSIwl62I9eYrNaX85qG+467YL+kyonIlo+
BJeZJKz4WIXtC6DMojimVU+if57Bctd9M23iRK64a6RD1LSDcuVMtQsD4WIi6RwvkGZyBqjgN34C
ZL2sm+8oIKIMx97byPvAFuDwXVY6dPDFAtezO45qOXk2kfZZrEkrcXBb/iPo9fQP1NosoVqTVdWO
hnH+qOXclTbjxdKkz8Vv+aRj0kNNgl+Vny+aLZhZamM7VHF/X6v+NS39wq9v82QVKdpRAM1t3IBw
ezgAeiowopX8emS2kRVpEcPp8Q4MGkUhlvTqM8nAZqUQnjXZuT7YxWAuPx+n4BxCNNOvxB4vqcvs
lnswhwFz16X1WfUf7Q7j2Qliz320kNZmdi+JEfSRiVCVF5/OAhpt+9dR8zZCw9iG2lbUcEoTL/fe
y0YBRszsN8x8eQgsn4rSIWkzRSp5cKext1WdA9caSCTT9cgxGgMDeKVTsQX7ao0JvBu8QRSj+oGy
aI/FX6qg8PGa6tpTRoLHXP1Z83ZxUw/wA5rEi38kSRCKbYlR/9RM4stxCjg3xbD/AYDRa7MOBC4v
tTxJ0xWZbJAIJ89LBPBHFL0/jRZXwe+2UEAhf6W73/QPNCSOy2Mm3t3qT8Flb66j6AvBy2ehuiOc
Utwb9PNaQ2l5WSI01TkaiFx5EJJq9lCSZbRKg7pLC4NRmxohH/Fx9s6ZfC4zKKTVdv+xC7Up0Kel
MAzh19ew4U3Wr4nUqFNkgYHtO9gnkXR5k3R0pfV1vjmXAwoj9sHknWkt5evDaTu8yF8/j4I0/oVf
mo+cDSuYcNjlhM/QVZuTQbVwYMEJk4xFjYcrNKOyikYXo2M845LNtK5EHy+1T5+2iB7KNnweMvnE
XeQrxr/wAvGqPxu08RoHnviATCNkBEY0keEMak4xqgfxl2AT9jIYnAJiYyuOio76h5Y84gRDRY2i
fEsDdDvSVihr6LPHwUFs6RyQ4yYhX5GYA+9pFoH3bo6UOQCTFVFkz9/Jr3I8l46pR3TKFedBnRC6
uaMJpQXSutZiE90SFpVrX1n+KvYmF2xpN3JOoj10jRr2+utSJ57YN4SQ62vIuxuZtor96CuU5bRH
tvam+MlziUQxblKCDG9BGk1N37h8i/+NXKWLIVCYNj7JcbSFwbZVigcYBOyrya4oxEDREzQxO5ra
bqv49JwFK8TLYsi38W4pdQWLHDCYFFKvAOqow9TW6boxNO37BNdCwEQ2X3J7B5IKLOfB2Thmglse
nohSjSOs0Ap7mIPvYnyTRQJPArH7kOrLrMnXc9ZOp7xB0xO9M8MfnAK5sicO0K8kR0UV34V7BZ2f
/UnOYRhulVYayjmPl0hrqTAE2RxVv7ECSr4dBeUWhSFLI3CRRNK5fljlTrCP/RiSRJXM+I4maHPR
KGRPXElmsV3CKitTofTzBGiaF8tsJoPwfaa7k8CcYdrphXlsrp6JPqje/7qqFV/EH/1JTxSF+R1n
FH58QJYKZLTVU65+T2Ws8nGDW+ZxXHbns90barbE5Q3SVUHIwqfc8nD3lWwcdu7k3RxX4MlnyAGy
1U2vV3bfjlbRv/170iE5EFdAsafXYrVN2PAhuMgftvZT75wwPb89vDBC3aRmP0P5pq1G8B8Mx9gB
G0GbC1nECkZi7C3EQq/Y/1FQYA69+oXetAeTKeJhEsDSARwaRd/S2r8UWvH1kVhDClD9+TnotNWP
01st9l76k4lRcdHfZ1Gpm4MV6fcCdniSOsD5DhCKV3w3KxBYry5pgZztQhtT/roX9HZykFw3/LVS
4WRAf7xEAnch8CXb8DUV+MKLCQrdbGG+CmzOK+0ewe2sLuBOkrsN8iuxswjaduT8eg1C/uV4B8PY
kgd/E1egw6ZXK8qD5D8kDwsGpS90e6004GpVPQvzxkgiHO8Wdf/fXHqlPno3vAMhsjaUCycn9x+Q
I71pLubPAoBW8+MjvGGd5UVBnrDnJyfgjmreUzHffGCINFD49BIRDrqwwl+xlZF8J63aFgrE6kuW
6cKIMMEprMq0PByDwgqG2CBroBeJ4wy5GC61ETHJdpBaH4UvgIGujJBirdZ/EwfKm+qHKEKjUdCW
PfLBu+SquweiE6a+1oC7et8wcEQUTe+UksETrqdWvemLo1JIymST1dbANQHkteJXlJ+2d3cMWN5C
4US2P5PTYfZc8oiQBSzuSpCV+utjYhL9QZWocmuaL29Q2m3u1/WXLDtw8CQTruhOakbmnd9rehiI
Z6QguF2lmjStjFJbkXNrZ4IjJcgksMeBDFu7lKCY+/aXkUMuuLyxQZ+7gWhnH/KpI6BWQz0eEaHP
Mp/dEP2crbCHgNASwBNaTD0SrvrEJ4PH/z9yHSknYB+9s1xUbFspQef7sLCtre2/rsSkOk0GSEcC
KQ9CT2yzyjzp8azQ44eUET/QnYeVzCqkfzyE+SNZIuIKdfIWyHKjbNudioTijIKKUIeq5HNw7HZA
khNi01xfqqv1XXltF9a7lIeXe0PtTwSJKrMZPaQXvXeWgij6vwZRPFtnQyXjK5ZK8jAGpHvx2ekc
QBc2PL8nTWnqcCSSRXSyaJACovRVrMeb8IPo1a3t811v004vHdG3CEFEirDE7BUca4hw2NW0BGY9
3FwN1SorArouyJZkDK5nVSt61Ymb05N8Ku0dY+hjhIbXYKq/Ecxjyb26zUoB2ZcZog9MmaDUq1tg
taH9bd8JLtm+n9BJvP7ziwpvX8vEvmKRfmWN6TWtY020HoorwIypzJ5JWdCDVIBjv3AKlmrnlxmq
GIlDsySt4EbYH9jFRkA5octmPWelgGn1y4NLUzror9KfoiioS91aJIs70mtH3l08pQ9tMIKyNtBr
GTH4XGX/4IX3hyOnXNpDD9ClNljpKp5qZQBO09ehw8j1jafEyIqC1G/DiGb2xi6r52NgpAU0hLmU
bn615iYB/66qibaRt5roUGTZ2zjE4YZPMKneK/LxPJtVKy1+bvcsfQV8VmoEzKNMeIGFWrGk8yhn
v0TQ3a08kOfzsbL7u3qudfCHwGQYTykU+XPAgQNkSgNGF3F7fA7s3CU2zwY8VTCbODyFUaYPJlPN
OBoFbFduWBJwu0bwnBlXvloPVJLv6C1k87GgNI23DKGTZDQYT3lz+HxDRpblnlJ/onEQNMzpzauJ
OGcyuFogPpaMuSjhfNcQdpXXUKTGaDIwp8BbqXToGtIHMY5y/BvJJP/+T8jphTj7FhEo9cIpd9P+
IxoUHZCPkH+3b0tR62x7sHKvt+vb4LUauc20hgWyJelJD1bGdnVauBlcHW9muInlzrLTYREIHNyI
6CZM/xWxY662jtxsi49+AfVCRmsUD/4DQGu8dh9I3EUFNsc6RVQO6vK7GKXz1SGSMgXxlt4S18bc
7c7pB9nvgjP6u+qXRIV8q1HVyOtn1FBkvjLk5cN00avcx7HUVT8JCBdq3KRMGV0C9uJnfwiq2XIt
mAWiG9RDL0bzE+u2LXyp1bwgUfRJISfV7pRHWpFjzifI38XhpcRqyA4mbpY4WdEQgiQfesgetVhI
PylFV8dKxhHxypOKsftycORP0QdMWqpSYMIBXxUjh292p6+RB9a2SoUvsA3Q7SynpxWGUZUeqW9K
LCyPQjNk9Oui2OK+a54UHfXdoMSwn7fa/sJ0wNjPGAN+9Ar9cDMYRGGrWs8QnGk0pYWrBP11ea1q
1VsEQJ+LJi7yI6myWIBB7sTSWrjtnmSie0gn62RUz1uNjox6Hzpy0/X5OPzUv8n7rx5awFQVqKQU
BStrkMKl+dPSSvyHMG0eQu7s9xheUqs8jW6vgiUChE+eysI7TyB5mBGKj2UYUynBc40406DcsaPW
EpWrKzs6fnm4LLLS6aTEbrEueAbrCfzxDIIMn8RpuhAmbmaJrp54xpQ5+USKqGQD0i0SY80v8a4X
exGTErOxNT3TVXY3u3L2CPcv3KtK8aLk5JNpnT2WZWFqXYfPUg7wQZkcZ0+eRiC5p09D5FSAD4qC
hLYRGY0uRaRAFTt7o/R8Z9OYn3AzEYnicWxFSfMh2sWN03+2LBViWZJWk6WP7GqOeoTfitHz+s3N
DD1avCgiJzuAR8D3Fvaca+z5TJRvzvy57Wh95j1Mg3VhPSrhV5sxKOH9SaYX1xeuIgslecJJ0N9D
nuWPBtNmdUrN/GkigA7afUVMlrd7iUVDv5zySDzia4aLVOZMswglIEKdh/8EQhSsHGb3AIrTmRJm
V7oHjpg6E3k9u76llWUT3OSzbd1IJWaC3v71/hml277M7cyZDPKGVLdto2DSwHICp0NlmQSEvLfy
GhrqaK3tvZGx3TTjX/E9Ftvb1xqARdWsGLShJ6aF+44Ge+ylZD6QvW1oOvzw0pWxXcTeTE6DZfIn
lbY0BGMk7YIqp/zdKigMhEw0ynGdpmfEax3Mr3DyHuPGsgj9Ttt4mtAkqkDUqW5r17YDHTs2MVyQ
vrGmur5QtvDu0memaoB35A1vyoKR+XqJMPL67+pE/PwCyFFXdTfJHLIFNyjyggG1zgpM/w9LdQQn
fMxOMxKlXRxoba8Bekj96OT73E557INTttcqLc5KIK5bALGjSK7EUEODnadSEt43taiYpCormooq
6vZAQ6t8aS6Zr/OCiiS//LnKOOvgmJ86YaMz+nkk4irX6xz3x6Jx+11Axi3/dU8sOVLCPPRXBPcN
lLqTrAh036M7sKjtvKGzkqCiFw2DYaccxwV6f9JzeJ5KwmP2zhWuz1SokwUP4LI510T5jH96Cz9/
S4LG3f6wCvrXGdrhehEA6Y7ZrwRRCH+pW7LQFvuZGNTLEcZMypcm58sw0pYiRNkQLZ30HfQT5ea1
PbdlWUu6aqpFqBpb1ellhcKiNIOOZWVkDymd4Y1W/DRTRubnqUxMaZnMG9VWM37j8BgSnX9hx8YW
BFXwQDKAOjagmqdlp310al/XKWN9qZsdfOb4ABTvYVNq2ehT/s+RUAZESQkAtTVQSoebO6vN2Lzh
aRPKaJdxwgadmoxsoQkNEHpNhrf9xFjPinpZ5vu3KHAp+J9gV+g756WdMxcmkf5EU4Qp8ZteeRpq
brVb/8SPRD5wh2ufAx6p002XEtOWQhir3iP6ULVsmW8aFdRTtczH2fpVTh8UjUrP+O664lUpEIvZ
SDgDpb2ySYRm3wFWgQRTJHZH3syUdByEYe1x3QpXJwws752Byt1cXDKg1CYibFWp/Bb7+GptaFjE
zVOgN0SfksiuhUcCamGtlRK9yew8Fj+enWgcRQPFIKpaARb0ydrI7bvjdz2H96gsLbXY8J4/Sg11
TCGCJlu9uqo4yfpqxH9GlhW7XzsQeQofsjZ+fn8d+kBaSoL0eP0c3KgiW7kBTtwqHSA3OXwnb5Ug
edQ+8GUdgltA3n22J1mkHvlEYr4tRtyRUWL3IxcaSpEwKy7mGoxKB7gWtBZOhfthgh1kWDqdsLF6
8AVqbvpRR3UaTb3cz8o/pgHyCclMRYUZwBolEkf1FOQG9IxTHpvtNqoGDp6oG5xVb2gltbPdsHj8
RUCeONWAL+kq9ON3k2O9t48S9vEnVgTzzqpkKbn0QmrD74TK0MF6MfDfbr1paE8scvpKsrn7eDVJ
qXNyr8OBQRxPgEPSJkzHfULblUxOCpWxZR3RKtGkOBp838xWNEwIZGqU9ooyB1RJWy3kGNuy8o4b
fj+dAqUUxdCvaske532EBYVDGYMP7M5g+xRAtUsoPLUPdhdDcjiJxe72PTWEAhwcpljUpviWM5dM
S3N2nxTGxJ77xofmH1KXAsEcY8x5WXwV/cBhtyL7cmDg6Vj4xhsxZ7Qm7Q3e/GVGA423Vpebhhlt
7032p2Y9DE0MgZnn++6mNJAp2ZdpF9HS1aLawgczoCzqVQC9P22CQCX6HyS94f7zb6a0tjOvtuLa
xhNw2F1QJp+hX9Y1rHvvYFiMwu4b/YWjZjcKQgxw0vI0oxYl6Xfh+HKdWuzTQHGR+Tt3L7Q/ubMM
88cU3scv1W5S0GWvYpwOj8nHY2deopc7Tj14nlDZD1j0D7psGu88bcCuqEXuOm9cNmiBb0rV8jOF
yqCl+5/iD5XDlrFFY70e4OmNaiXVMhDSN3JavxzLL3YBlwzJS8C2u/ffZtC0o9uRMcgYXyMMDxpA
v7zCFkRMhF0CC1QlaUHeL8iVsFQWKnF9EWzDCJh7qjVxqqKl8RBYyxOrWuhlfVNcjvkEtiDmlzwK
BfN1zbBJ5aLdXHzHejQlTseFlvWjTpZxCk4JVhJGNXADsxIAPv6j4rMJqO/eVMuP8thNBpVBVoPj
CnODa4RkEr3yIe5LvWh/S620UiPMt/IQH1bico6kAxEUFWYJaHIe3pH5QxthWcccRNszSmTd9S4w
Tl2oHv3168P/DCIOyxoQvRWUxsSAyWlrKolH6EKPF/NjR7CZf4LLmLvA6jJMzrX0Vt+b6/1+xhVZ
X+SXJqP9+ioN7NfCW35+m8t32OEReGrzsm4w/BI9f2LYrrneP0QNGeQtUQueroD6fRQ/R4Khqs3/
DjOg14A/lusPf2tsJ8GWK2kWSOyzD9F/aSRpnapJ1WFH5ffVaTE9zSKQSOGPIkeBtIKO66nVYG0n
LfruwTqLK0p1h8UsEgIjqdqKIMxfhh38CwJ/bnL6mzZPBAPbWgfUzwG2JhJDopa0yy9QGUGjZUbp
GSI7vGVXSTtWZmAYLuINEUfvYXrBFLHmZd4tiK3FNU0Zb4CPd66DA91fgLj9N+Tpu3aAFxnBEZWO
uic14u6elRFx2oVeLHKATz+vJ3Uu0Jg6ONPwLd29Y/knTMlVMCQ8y830lBOi+JHVDf+UU9ebq8O3
x6CicXQnNSMNHy48J2t24iTpbjBYkbMaYpGADG15skJMYmnI3Uy2wjwpkGp5W/gqNmFeUjE5QTjQ
O6t39Vsw0ofvfpTZSat+875tNcdSRy0wKeS+zsde0e9f6afFzFUcedwLwHh7ot6Pb5debu7RAPXM
CWWq5BtetRfsQSUh5W5H5GrzkfVjnwjaq6/ZQRCfMKix2zsiD+4uCAmaKQTgz/sB4RQT8We7LpRy
yN5VzDc6dE9Pqt9wET/V8Vrwb0Rlp5m+1vWZe2dyMvBoAYudKKU3nhdJO4GbcE1yJQEAXIv+fVbe
45qL9oIWUQzktmTKsHoGIYzYyE7V8fMP7KanmnN6Dy719/q0AIkMR0h1/QSxgAy0PSkA7a5w/uu8
jhR/L9YcFxe0fKdLEDTzqBEkr86rP2/kDqY3NZmJcVKYFwy/Mtu17QtrpiFGg+3mQ6nXSelHh5Ug
yOYqfg2Px5zVfOXfI1JV14kPhZ3o6ksNV+E5awzgPPqi5U5WCaA4d89BsTuu4+F6bSOAjJAnm+tP
SoggQgVYY+TTshv/U3s0QiuxDxYF+salMjMh5xHA7LRsth4aR7i8C+BmAPZsFviaCNq6+jVvLthc
U2m9sOt46ehFFNFjvWIK/V51dcmxnwgjBJ4WmYdlrwBVPj+/EimANiqu3H5poMY0toL4+EW20C6N
m77n+lAzIWeuK/ZgGcJgyAU5OQmwNNDUFehsPydBMzWZFsCtjpjxzkza4IjN8we5S58D3p7Ztkbh
yJhEJ3HkJ2l5E9O56PjJv+evWZR7GmKyGmp8h8y+lIxhMwYG4T81Z27Pl9vfXfyEb1XuBM7HPEbh
ctW7POyAN/25KagIl92VAH86gb3+IOnfCryd6tWlZwtBpFnezM5XIl7erc3y7TYeiEOfnjdsUDUz
hNowQmEo5X9CBnqRvy5bQhS6oljPT0BLfy1HjTizXusN/7qDBpYG4JEFbIM4Lyz8079TcIOnTGRc
tyMQiiMEoLoeTOUYdA1SGXW//Iye5PCnTFJ5JZf1R+3v9wbETwo2+9+3T5C9dJtW5BouQ1uXG7zA
a/PjFAJRkRs80nWB7rMDfJsnn2NGDcTxUDzMEG7dwEmYTNPL1WUrmsSM0oDav/VDNei0+/CKeztm
v1wlbxeOmAIM4v8ZOaRg/C0U2ntbPeN/bl1T/ELyFs/sa9VdcBe+wtZ3CKQrbE/peK++a0MshL7z
K9Mww7WNi1Y0PgAlEtE2qG+x9jOKxJyjSzUVXfbx8yOiU/OEAPCWs7nHKOD8G5/RC7kPax4SKov0
2J/QNKCz7Ahbueq4g7VZ9vtw4foESHFsgnqEyQB74Y/YPRIl2XKbV4ThH33NQ/F4ltYEp7ZqPtnC
7WU2kl9RQZ9dUq1P1zxS291akUehB9hYiZP7gc1nJpo2/zvtkD1WvxWq6XSl7kbY0yM6EkxO41VN
sFO/f+a16v69E+OtNIArmAnQv7K6tFRWiMiT52P7x34rLUpRaI3XdTaNVv5fdtykrZGudQ3G7y03
mmgOulTHyJLTRf427LoRUKyGX9kkwElCACHnB4Qch7k7vUWGcbLIL4pME+swEUh+Q9Cc/mSE3sqC
KTzoEI4f/bTgHo1bvdFI0dVOTd/bxUL23rwBI5eKj/8YdSF/2vgYS1Uhv/gdzQ2hov7kgv2CEkd2
HAOv/IKmjbgoRavaiTfDNfVYotvru9311mwCRL51KHwF9NH3w3H0pboJ6lGaCkUk9M7iPhTiMB/S
1ANlPDQkJ81BHCtZkeDRyEOhu65Y9QNtDO454ev1Ok2XeUvEdLBAlidioqpOnVFVtZrLUBZMpIUz
v5HIdJEc5Qe8LzqBjpKaNyIzelgGqzCzzJ3F/mA11J3zz8Bc7OoIbcLqbjndvUlEwp6uu8xG3WEv
Kr0SU66iVdGtb0PMw8emPnlTmwEbgV9LqTxQBZGqYhl5Un30KYbDwI+k9P2TudnT52V+RcQEF0BX
7j33/Fnl9OTboeyDw385f3CJxcIYZtInikkkC3BQCAJpAj5gxHR5G62aSfr3iDjfsAN0fiaOOqji
P9eC2Ko8omzqGkj3/BTZoFyatn0jyaBA1/Y5kZ2qQD0lworUvE/UEHsbb2oPekdvZ3F4tBbHfvi8
GNnOt8DiGBHV8OuM4i2rJ/SJD0t/zPb46rrjofLiMrBP6b985OY6K78v07XyqlGHQHG+cfpSb6GO
qHvyiH3uA368X2UwgFojnq4DEOXuIwHPyHrNXyJh/O/MLHdkfTdiZXKAHQyJHsFqNAvwYo8tn2r8
ol4SSJBYqoJbChjKN7WXttiKQj+w5uPK5uh8BXTUIb2SteAlswjd0JToeuZpgHaoh+guOKJISjtz
lvs+KWTlcJLbVZkxXnAW6sb4L4/JN3cDpqIJNlw03XTaB66dUoohhMreubRsXUyuxNnKi2gU426F
XOq0beepYWeFqwxUKVdK8IjKeZ1bsHz1lVatnZGhltHZkuUB/RarvcJd6l0mvyteKiGgcDoEZ5o0
ujeovSu3mgn0hk4AA0wLCldMZQUeWtoAlbASvfuufPpqr1Z5OeUmTxxznFcnegE5LfRcj+3kl7KB
5scB79RtZhVBaBui8estHJFhhDhuAwRNxK8Kh/TkXUq/S0W1SYK5nAOhhr5EX291EgaOGVkY8GGg
54/gJDAkNRx/kJ5eAIXSaAezZW/Ho5IpJ9EXJOWk8TB1e2DerzqAq52BLZt1bFOa+lCiEzuHtYy0
dy0pajnUGJZkmUfQhb6RyFdmqVs/aDtxdYcyhsKVSNxFhuQcGcRgCpw+hlXs5ShCpaA7R1N5iadw
ah0Cu8KwjRELF5NQAwGG6srZRd90oV7fTfFf5BAKXaxJetbHMw58mhwnA/0Djj9XxHR5i5gC3GtE
XquCXFXfvMhpum6Ae/gZgSWUwyKeV9mBQ78IYEBrXSsAMrJcGGhpsXwLIh8ANh09mBKW4XI2sDHT
4vEAgEN43qHMTkFLl8ikd3/fm1asvkYwaXOOQJ7jHNHm2ES/eYSS/+tokzi/r1KYWBLYbynMIACK
QfGXFBKIclkVrcg/hrsNuy5cz08duu4ZU0UJIeS6hUsV8Ap2ycvDX+eGBQx/9IlOvd9707KorTof
VaN43o6P1pvzSyVHlBp1MG14wua+gfnWDCc8HRlLmwCoPF/8bhsHUs3srZ+kjFTDuviUyrCebJCP
Wh7k3dmBujZrOvUue/2hF/WU/7tKFxhUPYMOagk6HpkWD5fUTt5gGm/pOX96nH0BbcMy3rpA899N
WoIg7qrndM+UUEbXglUPJ+/xaMjogiXyrGiYXcboFlnvi4Qj0+viKW3i7hVXVeMmwpKXecDvq44y
zwW4KNhoNVXReTeTDL2tpeNGmmKUGStvIuusnmPYQbmo0TlREU4VjzkaQaYjH//LB2vW4TvgTXzw
BNnfxqzweS8PHnbnGqH6ydjqXbsVWDT5A3jlQsbP6S8A+4l1GT0ecwVNxGGYdhwuGoWhDypUQJ03
69uEEyVY0/AEQq6J5kaL3gviRPt0cNvw5BGq2kbAtK6xO7Tug+Nf1+U+PGs5EnQ3gFCBX/RXDJoV
NFTzKH5kG8X69HwocVaxhBzpbP17/o9ty/W1+bwJPD0eFcOd5oYrvZr9qatSDW5E9mY9a+XXch5U
44qDqlC+Oedh3qNqmAXOU1pUvXT/QaOkMJgFFqDVttCsY+EX0+wSWm4+oARoiWdF0s137Y6oi931
BMqZOc8RvD76rLAld0KLh++Syaupdq1nW8wJF6EoHPd2kMFkaKM2UzxhSzb8IckcsLRaBNZTWz1m
V3tGQPUG/TpOfKG0lEXjgxaaFU2PLehBipQYKPlizi7NklpeJOq0YIU14O8k2tVu9MJWQSzzroKx
3X1in29fuSG8pLOR1XqhVetZcD0ZxhqrIYxCIgeAqXKEHQklIPFtRv+e50N5szA84NDGSn0+RGi2
Ta4nK41kgQwcE3pvse3S9jCZwxqUy/a7ADDr4jGtOMyh+zVLbq6rRNm+1AjdhVPAn+Lpx/T8BLUp
LXgIhaduatkzOAh/8dnp17wNcJxcazXVGCaigt2ShjuZ0gkHCwfEcqQcrroaLfbxRziINaYbvqQi
i+0VgadOAdFwsnEIq44xYiP3L/zWHU4OmAZJ8oq7BW/HU4mEp6nu3+CyyarpIPrQ5aYKdo6Gj/1g
P4MivGzBnvzmYcx5ihridq1Rn/Utt1rq21WavjdSfcXsr4lqpnZsA1lFw278JdLybQSfPfGKo9Af
z24Q1jUMavb0pZ1NXtFvm2DCj29GNcFSttKHFHgsHQxY3xXikhf+pJCdzHc5lIlmGP+rdb6uzwuw
uLyJmL6G9+AbM7I4aUpmdc8Dl30uTTnJ7pSj9lX9YNKL8W5wlZo6GDXCnX8EN+fpZkDTy2sH4NxK
WOIx7efeFac5X2DcYDiFndO6KjeX8gDsAgYOIcwOzpIyQ8dbK9wAL1rytym2348LSO4YWVscATok
5I3uGTz3wET9bVe2NiQRD8uKCW38SuGmthMnOyPNkQrUYhCV9lKpsN2f7LYdqB+kjiXaUlm6LaQx
ujSCc6B3chsdk0rsGOEI2LJa6v6QlN4AotwjjA9eAKJITJKSUCnWQuZ6GXEZDnI5pfE81konKTch
iuqFLpaWcmmJQiFeKbxE+usKM4BPMUSfK1eIm3+toKAm9Jbg9W8P9Ie8Ya+Y0GEgk8waWf2VJ+jA
N56jMbPtebp3RJd6CdjDIhFPazUCx5a8Bs1x7259wQ7egiDoWfGc2OSGKjG6gmBRNmahXrGM3SRZ
uPmxKfsSk3TMK+Xp5CAIvBx5dWE9Tcfd7yLGQFOrtaTc3HSIupREBKCf11HrzyBneYqbi+dtCarc
v31iOjvyPXMSY/ES2+Cb/UIU/cNnsLDr0iTM31mC736hQc6Z/l6UVSp62KHyLswoBLLqa4v9GSnm
yIEf/cAasie9Y7G+9bd0BTTelEtwo4JLLzFxB7hwVmrpbMKOmYek4elNpwi+N/GdSN/p5fn8ivus
PhU4rjxVmfg0eipTsHAgWLJ5yU7JbzJvZMrGYbHPShCkl1sBqMwQUQIkeV6vUjns+AmmHOr2MNej
/xe1ed3cdP8nwffNQKi/+flDf8nNT2K7KQnyC9GhKDs+TAvCvJ6gpV9fo/PFMH9jpYilM1I8wvAO
pCMr5KGX3m8K0//2nDOK1jVCViJtiNgG3ycKZv9pxfqmZ6Q138kBhvo4MjPeVa/1COGxB3IHdfi0
QDRbbuYHPVn59NOcQp2hbGUUO1jdrHuW6a2oFiColBk9OjGo6Djw/Ck8xRzHgJTzzRVg38B7HkqJ
vG7Gisvh3V69vNXCarSJqyZgAUX5JGXPX8YUvmZfXqN8vlMB3RAw65JX+Bs471tFyxURHYzicWTD
yjZnQfHWdFVMhC/DdeLDLmKS5K22Yal3d88T4bhPEzKJwzDn4+sdLWauasIhUb122JL1shKi3yZ7
xQqZlQSchGUbtTxsuj1rxXsbz/LXvEeMWfDdm39mfPK4BlvxWS6/kYeqZZxBvpfYGvvoCEPQdt85
gZY2tl5gumePbwTrXzcse9EthaW7lsv8VNLXlOjkj4VRURVuhLKR4NFHyHekyJ3ueM2MBw5+ib50
4/V4cqMJBnqcryaiAPIlbylkrc/VxSuF1PkKrPuNVFePIOmfTVZaqgklaZu1W/4o3zZbMabfZaGs
tS5GPJWuzD3OGqw+OOYYwMLgszTzgMIJwl9Hf82LmaGnB8gYosqLpg4W/XofYY5jCo4Ty+swXf5w
wBteTosAaBRZJt32zn+k1OhC9tzRxjB7AuhmgPU16ykduVm5AS5RvT4FPBWuSsEgxLqfcZ8MEPJM
HSJnyaj/M82V+9rvIjhoyEW+13z1u6nhtAMfQB00zTN7lIcWj2/JY0RdbEgYW6Kuaqscypm7A54j
FM0+y0cqksKcABWhhK7E1h/n6zLOxwJ8RsU95nstyFimOp4+f0kddnhkiqB9T8GFygpbr9oAXonM
y0uGJiA6f0yaaxrzUiw5r0uWgOWYLP5BydhKII4DECgMktP41ra1JCpZCLWOulc4cMrKsWWpw+Vu
bCjvibKtCmgenFBCOaq6c166Gz6k0cW80GqqE7XmvA1enQEcaWn6JEPFdxtmJCcXGEG9CImMZbtz
QZvs+KuPRtTOk736BO81z6wqNDNQe02ZHMA4J3WcvwdNisL50b7rJF6WJDoGtiZHITjyNeIFAmH8
q+mKswN1Nl12sW2lYQdES1JuyZRNk5ZAHkB7A+fE+5We0bEq/F3nQI8PaTcfhtMXHPyD8OgB5vFU
kPc/7kT+/oe5W5hVflpDhia60RWf3+Z6JZDOgJnitceBNQlvKbugyqXqb/nv5CrhsJXIpMyON81u
qlH5Tb5QDFTy5W7CLeFFXkE8lSlJFBCIgwt8qWL5iNsDlbyQbopZZxcOOWVlNyiEzXeIKU3umn/X
34FmBuorYCvse4UCu9f1P3IIg4c1+0X/NFrlbSbI9gXlSb4O/vOWS51EccIoxiWwfdaO0v9JEDDj
SGX2k7gB8KRrX5k673DemdOEUJNR6XKoyQDY4XaR8WgoTmQf6kd0P79PFDxg4SbUKgb04Tlm4VmG
Sdh/Kk2/gyUgCTDjmp4hYDbIOn5hCk06CYPka6jGbTPU/oN8qDJmk486gFYctkNCB7RhbQ1P1EBZ
zLHCNgHqC7I72qEWtsXN60ljVPO9ZJ8j6KTDS6IUiPAaQRCUkaeDZaMw+uZtTMSxXpvp7lEV1VP8
vXASuIB/m/tLxE1PKNjoPPlR5kugN0h9m80cLmqEq7j2jLwIzxhNdvneqBRvet/wtRG4tj8CYHN1
j6orJjdJllVZB0oYyhwRi9QjweEorXku5bNuC7tE0CZBU1u1+lFSqOA0UVxmIC/ZQfaMBFP5wpny
3ecK/HhoFyXJ6gIK0rGmZkaNA7V+cj3O+SEIGrK8JnBSuBhnbOGGzQRRf/HU+qSnHduiyfIo8hJj
B/JmDzZzPINMKpvCTedNN9WO+A146JRODcIueqbK+dPfx1J3g3LEvOJxEJD9csYNa9x2HgSHDu2A
e7fhXbK/VGRsfAS3XGZg46S8W721B/XH0poRq00zbswnRhcn+TWtayDJnnuOlgYzJRtmZfbJOh5p
75/vWP8BH/607S0R9JMf6Ebaaj3V0EJVuG8jPo7YQy5BqmHJ4U6CieTrGZuI/f/awzizvS5DDkFr
ogDjIoI0ttY1ezhFbPHjr6u6ArN0cRu2DZkrCu84zUDHXzHTzRbGLDr9G3i+PaCpgV0f5lW7kBxh
ubuB+RC5vkqihtlJNk6DnNmWL5qLsTbQ2xS4ufIadvSe2RBkVsEAqBMttIEGVHhbWEYb5MHn++qo
5Fe1p/5FwFl3IW6ePExdW34Nt9gqsY8b3niL3t9Ubopf2hk5M2iGH0mrz9/T34AEMJPyoIqS6KnO
fxXBehGeEZRV83VU4nWmeZKF1dHIkVQ4OwkH9nCwmmKHz76L2OvI7qzYGM7kc0/BkhLhwray1aIW
QH/PirLi1AWsV9aA7r/XrPkuTYkE+5xrNT5/p1XhhTKDTInQxFEUXS/CU0YZiTU5IKZ++HTNRMmY
4DQqFA3EId3VWRT5ZJV1T1JVbMPJev6QvxaXJnRmYyiISI1DH44kOFBML0WKqGzDNbvcuIi1JAah
dWXv2i5TGtu4AjK9cCmngdjsauPNiVHFd99/TIF3EmdAFBoSbTUc6T6KSiqs6VmIaRyHAvcdu+dK
QbsufJ2oCsPd+ofmdNOlCT+09M07bnmUtsEDzptrv6F+EVnB8wNVqB54CeJy/G+/S6tk+oBp7ff9
9391Q/vLPAka1tg/Z9MmHncDreluYngWltUrn9xdWSPxBdlS6uMLc1nOxlHe+RYjudRmHyi6hjGu
/ZhtwyS0QN5+i/YlqzatKQ40ah9KFYFht9qLN9Gq2QoXYE2pxM7Eo54inXgMjSJNykF99V2u8W0b
0gcaYiaLKtexykEu6pk5buxB5+LK6NI7Pg9OzISQ7nHgP8ZD3tM7ZXcrj0a7liN5Sl6gQZktaWyy
S2FBl86WtjDao/LE5+iZaSDxM88k8QE4vPHIGfaBVphNi8hbV6SH2/N53GFBS6yCnqI72LxqKqts
K8FXoPjQXx7sgzsFkbH00zoxdOa99nUl9/JaOkUCdwHcHrBVPHbizlRU09SBDK/Rt2rKc3KQ3On4
AURhpOGXYXQ+wkhbVhP8wYYmsfdorpvQQbtAK3AfBJFX//SV0h3rd70pE6ZfvQuZwK0R8iiyD2GW
bEACtAYorIUXIMYYf/INELfdTxUNBE8KHTzY49mtGI7FjPeX6sjSbOD+lcAfElgyEhCd4OiJgjQd
dlP+fKgKBBI9PEZrLzhQ2FrUHA7q+Yfnd1Gvy4AHSZlwmzgYcOmjX/wdNWsc308EDjtDL4gNAmwf
AfdyHzjsWYHYO3r6MWE8KqUK0zpIfuwTbpmPcHRWHcTpp4+g3G1P/dLy4Dwj9qia2ka84ha/bUxe
E7vhate1l4jhvYhGUT5NMRH0zRq4GRozv8SqwOIho7EOld8kva8i5BxD3uEsEx0U2XZ4BgV7Kpbm
jYoOu3N6sMLMaMgrph/IceOJFNvtA9isKfjMd7S4xxmQK01+JLP/inJu+s7nptwdrHTXjLENzYet
bECf2bBrhk/CaMnh/vnbYvzqAfXVsRBB3feharV/MfLKNHxsAE2d1ih6irGfHbiltcvl623sUd5K
LCVemtYHHsTXv6gKGkwSZbcR412MMvu1Pq7VcJzGYGp1yoiecsZROuIz5hec6qeXLGiSeGcfIL4S
y75Ns3hy7sYAH8jcRAB/zVD/HIT4xyCIWS/BcdixxdpUQ58pQiRdaqLjESkdxF4VY0Hch+qHjr5+
HTGtkzr7XhygnSR1LhbQD2pkxCz+mkKSlMQVCqj42/5iWHXO2AY9Vb2Hq9DNKLlZB5H0g5KLZerz
Idw8TlL93yCk+mNT6GfX3729UHH3YxNO+V6NLigIIJPZ22TZbuHOB2Xx5JdfmjjOsSf12VmUvkio
sQF4amxZ0XSrsmI+Pfxl/GeJPdKNp5UjdspZVj4aw8tMVw7E4uiy7VgXM8RFaOmIxkSbuOkfQaLJ
t0Mri9uBZ2CkpiHwPamNyVzhK8MHGJyAZ+z9de9oe2putYp3mSSbc13DsoOO5lTpGij5wJ0k1pye
RFJlMBcqNsSd/pwCP7lZ+A78h78rqEuA4awVCWTK7kQqLvL6YM7GjTWsyeWtYNf3O9NQTJCzPhv/
3FpPit+46PKQtDj3+91nxQ+E/xXQxZESRWD+xUVK/W3sH0jP1mgZWtL7UrwHQ9s5kZEXNj716A/s
EpkO3RD9IRWWFD3PWIQN11l/I1W2dmBHPCxI0BvtazKyT92SqehW1mUW6poSKcyXeEI0+k3TIAVT
+FZ3QrgxaGpiFZ7WiiOVsaWw0ZK32HYwCzLYw79yJ/mUzwNmJchb8nA50a2r1tvuPlgTccJn1rol
18NNrZGr3uvughffOX/THSVvOyayc4dvn7gr5fE8Nj8zMWqx2W8JeLWC4PvZacjbistjRqW3r05d
24jiU9VFpvAtxudjmOTZUoLqjetoCQV2CM1dvhyPeOMT0P9JW5VvFok63ghGzmN6fKNb7Mj7mrCt
ZvDJ/UzkhjwsRlY0ICyDPHObR0ZRZ+HAtGmKm38XSzhVsDMi/u62AnSgzNjCi1dVePtLFkI2uic8
qRE4rl018SnMHDfN1/e9ezls3wfGePU3reB/z7S2/WlydGWnsmFAv9dPKOA1u8dhmpS5REFJQ9g2
AX/Ux829yDOv9knxFZL+u0Pp12x88KEVGzNcwo/ZeH4vKxPgjeUU9XErKoAxMKR4CozyzJqjrVXR
5RnVivRU6YNCmUCyd/ajJ56sp/c4x4cEc4SG2aCRpReoFRxkFglJ1RZ2d9OOEFZ18hEsw/yamgF6
s/6XscFw+yPoc4K7CDmfxtZWOd6DhFgFjox+RihWxq2gJPEWEdbbExKnCcmbsGrZgRue6VqMInco
hXJq9sdQLrzDlt9/KpzF4XMvMrpHdMS0yzQiK7R0jinyQpsRdbI4AyM9ZkRvFhV80O/0+SpcP4E9
i2y2ovcrbgvzC9WWC1q/hvrTeLlAqNy2at7+9N19/Rawkt3kevVkH31uPh+aB1F2ngrorthK77jb
vFvoAQgyqKwNw7hYsVD/b+lqVQRTPmYvtyTi/OMKjB/6PFbOZLZUJ6iwLSMBXo2dfdXWyTLgrf9T
eUqAvSX31651yohlZl6c1j4sgHyI89LU1c/fUL9ZGVvXLuh3Ng53L1rZ+p9d/fkLamooCcOa55gw
kDvxkFZiSnioPZFrfAsTc7VFZsMaL2nMPOEmU0KXnWbpWI7kPU23U13N0txCjpkl1knGaWsRL85X
VKm9nELqC1n2dmVwP83Wz5NlkP/CljaiZTGGPh4PQYymiF5yHCxqDYyBeq14fOiHf3Hh60GGe+sR
J7u7qNnDZqadxgV1/ojS9IwHvHU9YrrLaQul5z5SmUS/4bfr3491i5cHm1BaoUlRgN6+2yMCRjsj
+8ykCi80PDxvqdDDBUMM76arYddQj9HFqoprOG288gKjnF8y9uhywrc9mIAVO+im26oNfzbqMj9k
hVRcGJ1y2dlHpiK/raukpsGXrzZPID+hD2o6xDiDJ80uhxOu0p3d0k0jOVTi9bKNllDNHFNlYmOJ
pE+uJemVrMdU+SoK5ufkGfhBGzLVQ3vbjjJSDJRtFM+R4Tt6Uif4sBty/tBX974IOaC+clvP8J3A
QTBXR4Gv95FXNgrhMEBPhAbV7QFoLXX6/pzv0UvgYSFBL0YgkEzkpPEf6QHuX3yi//LfsQLRRkUP
h8bwrMxpfiMjHZqPMpUaSggvrqtR8AerTvqZeLzk/x1jiU8nu3Go2RzvDdlctm+sjspXPdANlptj
R17GJbDP/4xq6O+rAHdA2yZWasmUsf6yPWnI61OJWdC4w0kS0ntg1ZJbvuYB18uCqbykHvrErzOc
JwjtvzcBqejyyg/XulQNvOIIaldcyYub3wx3nWBmpFEq/3rzOj4fQI8pT39vG+VQTcEa1GpfQJ7/
wct35Ozohk3TVMgbIPGSBh0Q/YzLvcO8w2uTEAm8LqUL4urCzrfUa4918xlgU5fHt4EOq4MXbZZm
lokqZq6J0uXbEdfAdzwwiL/HACb14Y3ErcOl3XHTXVWrcjVlkMQ5HR0ydA4OiWORuwHocFoZx4KG
oXcI1lu1Kf0ECzYFd1VD6/YaG6BfeFMLM0o5DFPUMxCY6SntnAWIHsjX2aLuCpdOydgobzwLzOOC
4ZI3X2TLxsIB4ogoJ4VmBAGy34SBozRTQLnt/fB3TIHjeMbY1iYk5b+G2LmJWu3IgYSL0P2Vei0W
yjsMroEPqyug/R2J3mP41aiVEmndDG+wj/8bi2GLFU8Wg816+Oi62dEBzElOjaNp3YvQ6yiwXSNZ
HFqfycg4UP39iUgr2mXH6+YrfEU/IVr+utgO3bsObpusO9rYlJ4Qo0IImK4QjYPqq34K+3DDjdB/
Cb7B+eDN6YVexS9gJhWxZl+GyK4V2l6Y1j3J5n3rELwCF9ajSxGyjrz+bqy9R34aYpH70bT+raQj
rH4d1rkMpPHK4fJpOvn9tdv2RRSiFXOn/g2ZnPBggAqe9oYBTu3fSUYEJls2tCMrMVQWTnPKCNNN
wk8ENVQhcGmPC7Oil0ZsnMjRU0mHVBpyDOVaWnmNFqs6oiXj+6k5ZGYiTIvpcu0tKRoZYxcuL8G5
5cXkXskxlXEdlj3/yWo2QyYf0CPtPVAQJtDwPzn12U3poNhY7PF2Y51EjQM1IPpMSLXoHZbuyGKq
FHUUfL+EBpuYWV6Fo4bd4N4OQiX4f+u5Os/ZP3SQVYYXseJVtD7g2JWGSZiReiMJJL0D4LD9Aaz0
XuuoWLAeUSiBm8bcaCfsVMks/oRy0JHs0/bJMxPOhMPFzbmp2GPe/iiArU4jofcuaNzasQQXzoOt
phfHzMdG3zca+Pnk7ehNJZUUFOmjkBMzLrKCtmMDmhvdId7MHmAO5q1N0fy0Y4WaEpZl0CVGS1Ei
A71nHSNu/MJ+Ip8XVetuTKraUWDzqMocmlZwcCkjofOrryXFnyTpQMHPd8V0t2zzZs276zW0nm4c
WMl35uP1YnC8eRqsclKmAvdsZOBdxV5aluoqlc6pqe5NzevGr5LF6SxtMa92C61Luf4AreShcYiS
TENNdpcCXpqQF8Rww7s1lh+iuGfO0qDj7laDDOqaog4HLfjVkAxjIxydxA1HylesMUCO2AC1NvSt
GIlniVjKqJfaVG+SC3bUoj+s8ZXUWN45YLRJIgtIBT5/eXNbwl0SCWoqxcNl7Tc/LT0C8eZQLB5Y
yFEkyNah0d4BlbNvDNu06Nmru1VEM7DwtRFG/wHKnesTwWl2wdp04vRhb8O4IOOKjQ+9QbOW1qwG
z1jaUrVXgQ0/bklPszQmcQOfIIjnmK4+riEjlNj+8e+QQKraf1+rf0OV3bmI4LE8NXAj6L19uy9X
YrKjnqFbMbjQMPSemaAC1wjag8X/7Qhhzrs9BZTeK5WYLX/PJlB6Kb6EgZsgcyQnh6eHQgA7I3wd
9Pd7q/cxq4XJ6u0kr541FzaMk4Q+Ol+adquOY29aKLffv0MctR2nSROxfJpWkcLDXX9wN4v78V9E
LruhuIEe0u3ym/z7hBtnAUQ4rsdz9YhbLhEO6TlE6R9URu1/2hyY9HU1mufRUAVK3J78MFBL2OGy
XdW/BTt1zLfFbaTRWFVaRFLTH7Ps6NFLD0fPP9j73XEA/dozqc6awmIj+hWjq8rwkWHuu162M8ig
x5X9x+WtDv/q++B1cQXLInLq9i25bIYrplDqAngzshzGW29T7QU2WXUHZAc4pJHk2bxWpq3qWImA
h/4EnzROlUdXA3BdWzb1KjQhnfcNCY07Z5w//7Bj57N/XwlxjMj6uH5ESAFLZOZ2lzHdry4HEtg5
Ckc5VPjVVQP3nSDFyXnMjZqsq/7ycwgojOwkZNxArT9WqzfN+cwl2+Ki6k8u2fjuYYA/zdUl0Xf9
ALzmHR6Ypos4JYgcAZcRI6kc6XR4qvXeBkoxOmHlW4dVOEwDKJFZMgzUQrmhhRUObdzupK4cpgM7
xtKG1XDI/VU03n0B56eNhpdijAzkRS6/nDKLxkmU5f2tWHxKUOM8PqNYiO0M/C4Ms3N6Q02yl56y
vUZzwKIlOSsBme3YCoyxuaqliSVsXl8g9jgH5nFi16e6Gz9l2eETQmzNyMzfvSY/a9mmclMIKs7U
LHdA8qyelszi6P9BnkYg2SD13GZYz1t104mpP8ky/oyWt91xMbhGOEvcrCIQWVV1CLuOJkzdVpZO
U1Ry6NwR505aatrbmrs7PjTw6hYQw8YYvIADxxjCUxEGw3gUngsKWXZun6ARJ5JbMajXgDSZTfJd
LKB7IGbpy0f28WtS/3YEHGXx6DTja9eZs5DBmhJ1pq9wD418ZNWrLvht9wREl7tlngwvZblQUXuA
q69AuLoCq3HZ/fwC7CZdC/RIHxd0DN5nAWxZSNUEd8hwtnP0QJSr31OicLEPBuMdO5Q8xrGxPuTL
9xKiOj4YPLs1LwpLjR31ecoOK8Hf3tElzh7vUprmEz7wHpeo1M+pZWb4MpMx1M5sm64nzhSvjbqX
oYUtcXAo8wcIuy60GsRfMCrsifliF0sKXSST0BFQAxeqFtreUK+cqoTYOUxfwLXu3+gNv3+AQyUN
Y6+8sWhWUQMtAtLYCtkrSyo9sy0r3gCE9GPGyc8CsVh0uAwCZF5ifLA+Z5RA0QOYX4p2cNFAVvKn
Lflmy2TJ1TsyKNc6PELsPPR219TaMxUPgVzLfEx45mynqTqhv6bV/PayeeepkavvsBCZ0MODVNeI
iQ2PflnMQhtVv+JC3VoE6mMYkWWtTClmwmAAP8wyv86d9BmDpFQNMMMhNbD5g1EIQPpQE2qGNdyw
wGWSOIlZZxlVCL3e0wB1ZdB7dJzsAlkZPs5P/0dfUz+TMIxgi4HGizI7Y5hExZxDygs/jcYi9H0Q
Te0Rg4dnZtKj8w8Xj4jO6qoS/hMIrm1t2+AF37glkidXtyoWEfi9vetTUrwQN6RPPlqBsheGF7PP
exs8ejbrxxIRlePo3Hw81FYHDfqeMnYjoxZ9DUPBNhSNRnjGYQviWX7pTzprnsjZjS/dEg8doD8Q
8cIBC+thcXLFy5rvSjnYBCuV20ZUu1Tn9to+fJxqXFJSI5cWDN8qHXCneWxAczlfVW7BFP5hCIPC
k2N2Oa5AHiqHh5B7Wf7DUj5qNo/g9VYjB1YxvKDIXcy7wvHMYinyhdrHaFWS1WbQB4sGgwFz0iMZ
GfqbbB18N+jWXQC3GP86A1lIU9U7IBOdEk/V5AqKMZGiAc7CxpoGYzqEdgNM5TnUMwxdEJ/BHdm7
2ulMr7euHtcyQkKt/pWVI6PmJJOqKKQxt5zDuOxvLMK7Z0BTFCxzhYhwnCib34Bylmg4YXxHu9Ax
nh5/QNgXYM7dA24Tovb0/wcIKa9FxsOHSJCAcsAXM9L9AwNrrOed1Vy9TQcxEYVt3OHyjcfAQeNo
RSmQhLJ9c1QguKit2z8JN2zt1AL9jX5ru5AwfLqXR6L/KTnh9vnPeGAOc0oWp9OkF60zauZyYe0/
ZGxn4R2kGbzvQqujjNgI8/nE56aIXVlN1cYU7PAKGFiyh3BmtBmEbyMq9wICQm5t681uli/HnK1l
EbmUJrswz3hZHIjbOyXBOlyaH8xoWhwI9rmgdhwgKOvQqYnlahSdc8IH/kNk3otCUyWG110Znyqf
Ik5rkHKIY3QWGu3XYJiruF6ATwcpTU5FdvdeODltCc37hwb/puDp+ds2RdrE7TZvnR5Lvp2LpyXL
Hgvz2uvWE0nJ8w5CbQ0BCi58D/levftTKRkPKQaw9MFDJIk8uHy6jH7uOFp/vZRyhAgMyCBm3OyO
dcd/xp1V5Y2ccaHJg4Yr26+wQ78mOvk5KU/xBNJdtWiy6UNAVYJSA6DjF1jQb1Bgae7TS1zsEHb2
AoUjshposg++5KIPnKL/sPEGx3Y5xLPGnIm7MMqUbtd7QHX1Szep/aRpDdtfc5IeWY/s0U19xlqX
RPXdh3oksHdB/uT0kRZkTxLKbSpPprxxQJtkoiTF+4Twmethi/we2KF8IL1aVv0m3pLtRDO3zbJf
icTRIbZkfpqLArDwB8yCvnt/d7UMGulBsPsk3B77JZq4GKldv4F/Uv8lgr+tHEQ53z/Yjf/axzpS
BG9S1u62YXCxrsIOB1fKNMmneyzvzfIMDF6ri4KEB7/P9GPNMdLWsTwGMIyxSp6S9yTbfMKBFg1+
C/KY4V5imzYfKMaP0q+2K2+tA5YeT7m0yyPU1z5IrBQts0dsT6H8JySZSpIrXYu+HtzIyWdhfKk1
557m2ZrgbrSOiM/Xx7ydGdZfNe/4ctq5iWe2SpUVL3b7T2xek6C568KNPwPhoy06645dlALw6b2I
CxK+GSpLmBwJOi5ck1t0eN40swSbEGf5cKHgYCTO9UlLDWKuH3mUR+20CqmdMqTA+/t9QwJqq98H
Z5vZD9tKZfYQ+UHBUM9TsNIrEqlKQEkQbFUnWh7kp3BjgelVmsnXXR9C+Z1hNZPFyEjdb9GRr13Y
tI8Nch4gTMGdDkMraP4/Wsiwi8N2xZTkS7I6JojXBqaT7j3PBg8rzg54yX4Q9B4uR47tyGbq0psY
l1MlBp2TTuFxEbTJKvUFBuZa19xb47WcjBYNGLZJNIFGtG+UH1XFscvWeeGzyCkvRLvTN4lYqKIf
fG/AItU3t13AXaHzfc2I8jSRU/9tyGRmPv1/rqL2xBd/UjGJQ3ETZpvvi9r/yD5/9tcp0zsGk4xa
buZbrEt7fWjtdogfz4nYi0MDuj2uc1jVqjlEWFWsWcVtGV2rCPxcI07S2Wug5Tc36DNrzwhqLtAi
J8hYGo6ryKPsWAPubIc+Cbi74HaQ1UZ6Dsi0is8WBHUvsuqe2O0KgW2jQ/0/P2AKw283+BsQU0SX
KZVXe1PWLaUWHnj07AmSSzKgZzb7nbWr1YL4rTiPkDaR0k9XgUcqU9GmWPCUGx84YZPtF7VlMmmJ
TRVVlcmuvPJpeti0wEKffpMmcy69kG/B/JJ0tKBVTWZN/LiARalQtMUXix43ITIVlsSTp1d1zHeZ
Jl2GFmndeuKmOdCr3+QpPz4m3Xdoua5B+bJ+FQd6fPRz67OC5rlgJSCP86xFqATQBG//arMOfLsW
32bmz7g92GXgGGv8lZxS+OwYVmeVtKiQVDocOwVOlB1aWBO3i+8lZZZDpVzCUnke3wmZyNQ+X1fG
UImKZEOZ46I62Z6si1L2Q8bjLADnaI3wJvu9aUlr2NemJv2x2JoE5TbCWx9F/ZaUFc8iMRGuMy2O
PaEEyCnmWEWRfKQUgfh8zzGHH2GIGafvoIS/Nd0ExDdLF8ZJpdmUPVxpxuc75M/6Q9IVj0GoKcDI
CVIpxnJwLy+UKB3klDsCmI3bbeTrJurGvNYEzmBbciK6aJsjrE5oMQc2XL404PpS7CjZGKgo0Uos
zfOpf6Tk7rxCEQkr9ourA9mXA7Ihgcr2XeDlW8Sdfahs2+zOjAD6zppi5rVfz9uUAqNbM2Ui+yz0
eXf8HAllQwu44FihkAJ9vX3azmf5VvsxrlVbOc1DSMdgCypq1D9+W4+HOxhX/Rjy1iEXPGYli9nF
KJbA5gM2khauvbClSJMUXx8cX9iw8Q0vZ8wn5LDoS6HXr4zy88r/6a3C57gdx4rHbzTxL+bpMfe3
7iiKJnonIi3ONWaaZ65SYW5MEFlVjUDmz+QgE7Flgdktnj9tL6nwic5D2H0UwUzWXEegd0k2WT/t
++7Gclu6v4NMitsD4I/MQ9kIKFUBniFgMyO/MiuFHO+cjLQc4DNO0Qy3iS2oX+Zp10/ljZnWMwFX
jC+Ko6VNNHN8leN6YasPbKrTelvmWBAZpvj4jR87HQ4gzOJOzMMuqK41sMMV5KKjD6OupBn8cJsz
sYNaIXhyCaVXWvNtVQnr3gE2KTeR/WfAJc4KyL0zWIPY5A55KF6j4X++bKvpJPDhPsIAKF1lYa/4
dGYq4IaiCzW4up6Em5D9dgZB0SLfg6mCMTIPgDoBMKMeqAkO//A8Ae+Y0iefcwoATmyBoTP5Svl+
iAttLWwAO19AdMTba3fLMGvgS815sGCKGwF4LFsFm3PUhHFCmffWPADh4k9Pmy8M/QydEC8aAWvu
SCut0qCjHfvVl6BtumchjPDvfCmbDViXBdSei30yyja44m+DXm91KSFu0XZKonCtCBF1c2bLO5KQ
dAP4nnfiBw4wxB+7LDlNURCmylYrmQNN9QdR1tVUdxgMZtPvQZDEr/zygwjEGmmAK2+xjDfU0TgD
Ipsnvq635kAN7YeSU/Hpom93rBWQ9LQpdcXfBBeykbxk/D5wj9pv5Z+bW07wopJbuhpkfCgGCxID
z1SDpM03hXo9KOaE+e//UlY628a1SjblRTklufzsxT3O+2e/pccRL3laYALzMTavjpX9+idZieQh
RJEp/Usm3KpVfflsrnyFH71YCEDb5lhyR3+KkzVMowI+3inLV9nQOJFo9WlaYuDC+m++fEBCMigS
zCkHEOju9XC4IABixlH7Rni3flQhqJ/ou7nCBcq5o+lb5QOLdRUKHRaTSYyIfxTvnD7b7AJhe/GM
s/CSuy+vp8SKlaeSNkM5foaIGiEUPVubwrQL8eTPt5HTqPUUBku8M8zjW8/nRiuw2d2+eMSakLoO
bxrYIXuObS3yGexJPpAs4Umz3PPCV6RP92kwHWhMJfz1PpEfJq/Gcs7glq4bo6/XosbKpFpal7HQ
Vu8/MmEH25zskXB0C980IlclolmUSue3xaXXBZqSg5WfoJHKlWOT5arls1powAK8xH92QZ5MGPQQ
/Fycw3THpq1xZ2XADXl68saBtG3Cu2T5IW/UKe9MRjAhik5UPP68NcIYfj/HuRGz20WP8hQGe29H
ng31ux5kwu49itKvubbdo8FTNBINnsGma/L7TG9s759QlANhBAwzGFsBobMK8jRIVXdD81lvcEWo
jwFsIbNLjh6JwqroFRwJaPK7tjv1XzyCT+i2d7flA5vKHyqUpFowvl1+/wyVolv8/Z88zXBBR4Pw
1cKWp8r02AWfBgbR2miUECgE+K36+YWi+S6rCGcl0DoP38xyzbhirRAjkD/lWakVeMUsLSL06G01
RZ03V/TYLvhQD0z3J2WV5JjcFEVlcEUGajBhc4iyCtwj5tTx9iaZgWZ9QNqRP+IUZJQGf0gu2SVw
gcoz/uvKsyTkAH/LHZLZGlCsNnQ+tV7swm2Eqw9nsRI7rfOlnT33bvc/CiFx3Ky4ReK16iEU7iY+
M5tA9EN5v8ke9vP9CdJ/l/GNIVvg41f709+VRitXX2aCt8hYhjJHLtWHTyzAjEgjxK4YS0v/FJ5e
ApF/8EzDtOpczMbSQ/18fHymZKJ84sgumZiegin0QUVDKVGHC/cjfK822OUl0sPoE9qjpz1PHiJT
A3KtlL7Eg03Bqj4MlVQS9FWNUy0rBQQ1nRI4gQsx7tUUTVsM62VIxaTx1SrR5QAtMERD/aPLLoDq
N4UZX2NbtZHelU1XDk3dHyeGi4uXW4nPgyqkzff3i6soWdZwTy3Qp9uK95Sbtli4o6PdFOSHFooC
6M4oKRWMxOtBok9BpWMsDgMejjBbaZ3jS8quYUkIW/zLuzXbpkSkwtfVPEA9wjFhUBggcF5OJb4t
/Bn7WboTAyKp1/UukeaIIcdVkTtpubWJUYOA4TPc4oNm+7sQ81MdZlZavM9+MZpiE76/crbNvHM0
JZkvOjNfY1suOZ+41gP0V+GfAxtWtxyrW7r/siqguc2U/11h3WCVfnh85zoMFoW80FIyge0MXLrC
VTJn83eewBJrcDyZ0SynYPDtHIDJqxR3so9DX8Cj7wL3/MwxktNr37RuFgKSMRZ58bT1hqYsdJkv
MQGn6Mak3x4EAcZM3nLvO5hyjhN9HBS3feSAU2kFBKKptlnOxaZbkH9rn5xu66DZ+R7S06cBUlqD
0ZJC1Tnvb8QUQtRBYkAfX0TbSsJUC9H4Cf5uSNXar8L17X/1bsxfuxvJGABVO7sA7WmOWs+ywAzB
eZvb0SOQ6dhtmK6++abgfvlbCS7dz3Q/Ae/slhRZjL/EPcc5mbGn3fAqc7XWb0zd61tlWMyHDCsK
mKe9SSt75u5bJUb+UnADWNpLuel9nDqwy19EOtOBsBtqghuaEwb3cJ4Osq2BlBtx2ufEzIBM7O4G
i0IhesaS0muUZHbEoCT/8IMZeQ16Y9UPIxwXP2oN9xlH528vuRqNQMa2mYfozSqAXlF/O91WxOwg
Z8gFydBQaSbwrkcTToQQLvMJK3l5EdosWEWkjUCjn5GLMbhm8wYv7N270p/1BIEh/PylBDDvCN09
C8FTgMWBOTPJHrycTWcMx1vqlLaPgeutYglKHwyp87chppAeyOJzaUa2xqmrf/6xesWm9puUfPfR
dtSfv8oIOo1hs7uir99ioZrvRnenrW2tWaP5gJbpdYfQ4RobuoogZrr5gQP83xUml+l1nQX4CzcT
sMtLctVwyM1aG3Tq+H4L04VVIhXto2W5fHeY2mOCTvXxKIHr01MKCeJAwzfKPHzU0515lKL3PJl7
DuS39f7+TXYcPRMEd083Zx6REmsQhmNMFLhOxkkGN5HRd6geGPlXas1mzZqnsJfM5xKCRZI59y3S
8AOjpu87wiAEwfHmsTtiJ3lnjq/QzlIxgjE599bIa2gxvGUNZK76gahiuWe49O1s75hY2J27ZlcL
8YAvgMs8DppQ0uQ446KLxDWWrHa3leKo8Om8PiLTldQtIH2JcL3wM5vn3LFa/eBdXpJi6X6Qv6hk
FrVHfaFdqhiqMzwaeQ3CP0d+rfyBWRZTNsIMWUwJjte9AyGJt8iqi7gGUjLYIdXXXFVuiRQXBR+H
88Mpym6xZOgXoZyou3SX/Hmd2ughnXxN4f6vfG0JkaHiOG3IDeMQ9Z8H2DPMHTsFqkKk3qqEV/nl
GSJgzsxhlb+azmRJuBH0PXPTggLXuK4i8j+OBbFYmKNetaHqMgh+4l8Dvan8/238G1BSV5Il7IJ2
rj1m0ywbgHkyQbSNEsEYGvcLoYM2oX+ZFvw+h/VuzkkWVkTYSwJ5PTcl+5lvKq8voueRabZuIAZZ
t3fqpAVJLuTmHEs2R1ojOxevbhhe2mCcbot7iX/qatZK2jUsF2JrNxvMxu4UWRN3BL4xpJvNrYuu
VEuVL2OwNT/kr+e/HaMjXdLtjF/y9cfumZZIxFZ7WyTowz+Dx4DSkdW/RE0UoxUtiJeZ9ZQqoKSZ
WXz4ziSzvKf9aNieNO03DEtRZPDegHVvs2AhyoSh4Z7LR7qGNP37gkXmq8gB7RZOS2FYAKuWKs6s
BH6HqSs2YSAW5r/30p/4B5tNCl15NeszHtT+TvGidRtzpqvK1gyvBr6mAVhwEJoP3G9Ice4t4W2F
/XwYah1dvzC7nCok1OYAUrj4kTONBDZKaPInxiIb6nVtmArveuShPJk9anPTn1ukFaOgMf2kw5KJ
lgovoMVht7f7YNYTtbpldTYWPBP/i6CurLC8Id3mMGCfF0Pcgh6NvvWI+lJ1j2V37EVT9Y0RDnDA
tXg4/6s6ONpPLSw/3n5NL4SY1MY5ahjitt09z3DOc15ZJG4PDFeDm7mIXJ2WGIrt4R1YlTZvGh/n
bsT/2UF3mTMc857/QMTH3ktn5PIiXZdu46qqNdvcpED4emGhmM0FOW174sG3K+pV8KZHjuRa57MP
QiFAa/k3ayRceU25TBQQLFn7cGf5PT7d6L+7tGg5bLcuSNul9oE46bkRdx3GbZX6Z/fgavSmiDH9
FXW3y8eFPQwXbY52acw4+m8SizhUZaWo3b0SESnRctpPzdX4+6l20OuzgPHRwv83t03NGt77S2+c
xausliVexgJCYTlJMPd/WELKLmhAVKx43xjwYLrt2I6QCjODYgZ9cbjTQETmHy8YD1B5BeOkLIjw
lFKGhc4yphA6I8PWHvVp1XpvlLxnJVdvWqXujCH/l/EfBWkoNXcJ2dEZLhzucjZ3ACTPQkjPs+wr
kBLt2qLzDi5d+gp+lJKy+Bc1q5BYylOeylJDXfj1SQd/T3etQDxGa4hlJHRYuTRGKk2auGqaeXK0
8qItfks45+SSEtFbv+i3T8+tEVyh0qeYE6C6LOSrwTo26848O6KSVHFjQusxExQVhxDbO+T+ZgfB
bKmiIr6wPOzXxQep+P2pvJHlMRLbc5T3fEScUmhgbxSqoUrBJFxesx3JeldLDe4jrlP38Dcb1Jby
5+mPUcILEsFFUxSnFgGuMoVWQi4DkXvE7aNtmstQ1bogcFSNA7tGfJ/pcVVe/HCkHtsSrBwgAlW/
WJOHK6lmwJwwfu7Q6sjwk6joHBkLy9heDcJdiFlGMZwrBPwUkUwtcc2ujxR+qxIMWUJPz+0Xawa1
QCMvAtmOq2lf0D2OcFEaKCSIwbu0XxclrMbbL3Eg3M/qf636eLHSO7asSOblRKDpGIYHS37tW4Jr
XsBNTmjgCt+G4WM5mKQN9TfjA7U8mYqq6h+WN/7artyDRrdaCOdpnT9eCDXHhBBSZOGSrJIFzBs2
NqZvV/z7b7HiHuBzrUrRi/QBPl70E65c3GwFWmb81V8EbJjcEdKwJmn5A2/ZyXvhAVnH2Yp28J6+
rcBNFKTOsZ4gRtPnIf1AJ4wSjYW77Uda6UrD2sosJVZKPOQJjnEOELlP4OkeTDzGXw2HNWiw1dNX
AXY2oKJkMd4ZIaVRRnr1nsPLQDBydy7Rothv0CeYjSmp+P6gHC6qPOaE/b5ZZWP5sKzEzz0KXCBL
zSkPurww3vkzNsqc51Go6ewBQasfzNI4emJASpyYQ5ZGI5Lsv1SIGzeS+ph9avc7rsoy/rHarGfc
uLly9h2E/MUQ+4dGMw7A9poyrHHOPG4ODgV2p4cPuq06PXCuvvrVbVeQfGYFeM+EzR5HN5G0YUA5
1CumA19FAFGc3KLtSXsgXAqgwOn6tztydccwFrapvC8Rl6oVKt7CD2uqH58aXMQzy65+mGaIcapg
BbVb8/rpIBLs3eOydIkupj/lY8aXx75XMSfnPVV2TrT6nINPFCWAaqOKOMNHoWjLd6TsZ3s7Xh1S
E3TnbDbxioEGIuh+GrDFkX/GVUiksG69lTWHazLZfDwvYzAP7VNQhkcFawbKoWJXWepbWiKK3oo9
ervok572rEywAKmLHI5HQ7QpNHQmFK8FF/1/2260nvMQfJ3t2pqXwGgrSG/CAty1B/16EAxVVU1l
scIojPq7FlJj5L1G4XmAKV4xD1FIwZ2nwM6cXMlnv1GBWWVh6o/T8gBRzJ54298Lpz1x2dJUP1Dq
J6AHQhWqagjEWwKIt1Rouqzhp+Q8Dp0dpMFtcrEoqDl9fwCyZib6jhVK7/WTnMmSKtNbFAy4Q3U1
tn310AOtkzso/BjQNjybhkGSNfnaJdnLsULjeqbQ/dNIFehKjvrBIy3M5GHJUSI+Rvbfg1Tdi8BX
0fOmCmaRFA26BVmaea78cILCx0PcaZdR1t/O1z2qs3EBtxo4UeZ76HHfDva4m/9ptzorI4arH3LW
nokns4IR3qO1m3Dw1RDbf8NEzKuHPU/G+isyh5B39o5LsqfGnvaREbsd3P/vitlYKOkWQbw+JyPI
ZDM2JmI2kfaTM5rmRyMbfrITmfmZRTkfZRBDIaqlELEzpQ0lWA+FLzMpPIdcmBEecluJuxGEAkjv
Cv+bhCJQJAkN3mbnpcXS8sd4wc+8Ss7YEuczMi8fxXNeEAcshtR7rCsTZvGrD8Eh6qZOtGe0Pj2x
8/UiCPxt3C4J+/MIUQDMZIRwr47njixylMoIPTRZnWEIPeiOXRMWqSD3Y5rBrxSadHW0feGgVZ6J
gScK6+CkdDO2DaxbEpCJM+eibSbAlsHqY5QCMO4XNHo1m/wtZlgMmtDY2iLKjXNp/NyUX3qmkz+S
JUKDQ12F8lUlFXT0bWvklY4dhR7kUwLbvOv6/cdivEW5lwRjH3E89SwNtRtaYCVErrW9WEJLZIlR
9CkuCIyVAc2r74a9nIVaQQNxOxhzDBBz93NPn5qwP2oLxvFnSAwvy/fnyotYH/Z59EOlog4FV+9v
f9Lc4uf062sqe64HCyPnxK1xySGKNXavExakikfIkPy20JhZrApvTZXL5hY0JMjQf0sbtI4oSXny
QT5/oQ/ED1CRGC3EHDLLOV++/Pkk6KAEQg86rDsDH5EPHV7y94NOep33fjb+4a2ENhmES2yQL7W+
acm5VyrNZVbMGoxXXmXiL9GFrkQ3N8h8lfIJiCZHZabHMPCmuL7WPt5usT1c2hAgyh+Fo57zKYQs
aW+3eLlfcZXVdgDNOkeItbywfprhVcaaJ039ZDBJ+KfxtQwjGabyo0aWbRuIOPsktZa/kG9mM1eP
54BKh4jDAfLsxc2dZH3Obr4+zsRc8c9JmXKZbOwiwNXI+7HN9JU+EFn5d/9JwYlrRWSi50nGAEjU
wxup2CMkZeKsXXdUU75kDsQMZPPiZKQGdp5lokqz6F6RG+GSl5p04oQTehTgxuZfa41IcpV4okZ5
zMgLKLrOCs+b1K3BPUO+Oz02uHeJP0LDkP9rZDlvasZf6nYYSF9NqsbgRA9uGZ0xm8h0TAHfkkzV
r/Q7tW7ABB1fhB8gj2jVyfTrI80KgVzIdQd2CzAULQIBGV5TB27Rzvjxt4AE11GaAC68EJVMoVil
vVTomu66vw82aGJPzEyhjCiU42B1lePA7Sz6W5/pCZtDBMcJG7MXiByiVUBg/tyLMiPucsXN2L2Y
KB8nt/CjjF/HEJkFTFl0wXH4Mjncht4mb2f8ShOzqedMnvUDNQiHXotd3VuXHM3IQzrJkyzun25M
WzAIhQVlMfTVsFyicLENyAK9ocyps+pYwP6C2WU23DtCHz0SQkZf8QauhlSpPsjaZ5b/0pjumbmT
6Oz2niLOKQIFBEIp1WFLVq3FatVzDcZUWSsDmHMq+xzp85EBu1QGprB5iu5bA5VYcEuhlnXRCPVZ
3k54zUxhX2rQuFGNYYmxVu9TlyfYjaVcOqTwCA1wnEBwl75lunxwfbE4wBaeNuxQglSxGsBaTBZK
+5mRhzqNoUdNAFE3uCZ0YaXp2L4tCxYK12KOTpnZqUZ55P5hGo51XEzZUXpP5uX7dbOTP/HXcLAR
KfnNWjAiH+kSdA1ToHZSOD5lrbWbS/unsC5LsiPh1k05Zvx7V0Oz90pg67S3fUyCDibE79qq5lat
VXrditgzddb1GLjgPdVvnpo3nUq2MghYEBNUXAH3dzD0eJ2313xIm2bOsotgXmPdfaF398ps6LTj
li+892004LbBj5ObTdKUP3oMmbqlI0zOxPv+SNFuVhyd1cfykwnLRc9FkqNmDeVkLxdIyBb4Rz6r
6L814iuv/adnCPV1K3Y7SzLBypJWqAKAyvLGgNSTBpeMJ7S4ANnhEYxO8tIbSMTWH0iqOEHiecP/
cqfKqt20/xcNckY3zdf61AyxZFgcC02rDrs04hwJIxAV6wG5tmj3mvwIoA/voEZA+wDFCak7cKQA
9l3djO+r9A9IiyO65IOZNdFFEbphBzR54wVz90nc2Rc65vvqdBGFOAXhovktEcFNrRyhzcJdg8Nq
6pEHVe58gW1Eb/bA3tbDY+AKSg0QS2pKsx1g/y4QOhtiyzfPXi+gJZM6p2nhHR+pdPKokLqMBLUn
dWzTR0Y4YCK/wfDp8rfdWGIIZxQCGyqyRCdP8aupHtSPmQ8HJE8EfKtU5LASLX1dTfUiR8IGVBD4
jlWld0hHLRYaJe939CNsR7kI76VoybI5uNiPBuXTPobJwA397xgjTnA54E2LDafjuRHW5rLpClL/
inDPqlDpHGC5hyS8myshpw3Wz3YnhCd3rvcg6FqV8C8G5pUO8Z3wI4no2LIPHXTnU7Xfi15uM+8M
Tbb0J2DSFQb0Wf83wYLu6eIfvR7iVmjWHFFoD4Xh6oSl3Yp5tUAIKytSnB7ojv3yjaYqZZhD4lMB
FKTEkMZkknd4ingLCP63tDIlzk6rDnyJfHc3VGhGJi3OyzRsC69npPZTUsvNf9dtWZloAvOaWTn9
nisNPqTIXk2MHj5Q4dsqZY5YDM/t2Nml1glqdwXT1xeyc16Nwxk1X/AJlje9LLehLMvMElZfpsua
vHjLjFIiH7OGTObIY5becj+iF74zczjfjJS9puyiuYmKiIs9LEcalYdF/DHl53LFopoQL9LeObwD
mrXwwlCyKCZpxtMUDCm5UfIeH0KdJyqY3xBMO97Cez5GopoaWylHbzNQuY2nO/io6JNqiBLh52WE
y8gutjVJ3sLcMwNUgr7yiPQWriALN4upsdpaIL/ROW9LFtDvUtt7R8LBRF+KrGdoCJC8eCoG1Mfc
DtOs1H6AzKh24L0tLD5t44fnRJINRfzRGKKE/5vjsFxigxsxoWDSWd6FYS72tnleihwjWrPqUeVw
NshVQSbGOMPNSpAYBUYbMyMjHbxobNB81INpX3jD1gfr/2WbO5Ro5IBy5XcHYaAVz0ZhvcYzE+is
8Y1jjC89OIU6UQj965zgcW1mNO4T27uDnWmXlbxBrwqPIEXNfhWn2n5dwJ8N35DWoPitBWGDFUbY
FG4aRiZtyCkOzVbp5eFtZmQanNGDVZnHfKBxyC/1t3Nhlb4DVBmBtiPmD/2SccxH6glc9v5pyNGW
14jQVEE1NZmN035G1+pW9eAfwSpmGKVVmVxFSXjxobuSv5oMeTaoK/O6xjiCKMKIXCrmmSbflEop
V6Om2g0g5M6GOVaoy1GZgQ8N7CvoNAZsmSlj/+un75WBc1eCA8Dz3BDSg352HwZJHGQquy+x2Z0O
WK9CRPmdYpxYTCy486MHfIFIP0cXOdIMyzcZvSy0jne0vy/YKAvuQb10vyhCbg94Q6DgiP+MbQmR
MjfHhsLQeEWQOpoUUJHxkSKTmzpTTq59U939mURgrHywOlbDpFFpoI/NgoWKxfGZc03co3FXr+yL
1XHGizGwYYuN0GRfwliuI75WuXFKx0yPdVvCEMLiEx8wDwNZBrvBWJ+GRcmif4tZIo8An4paGFZQ
byfByH7qTsKrOLRpRuPNIVdbuXEj9qp4UQY2HJG9wpm0TC76pI8fjHylQN0hQeF/p8lYyrEK1U0A
22+QAofQxGJ4bQtSO+D39qVmxly3GobEjkD6PREJw652aiD7lFPCHexkuwvRYsY2uIg9kO+6NIhg
ZuMWsYyV0FVKfQ69RtCw9tmhkhfsau4ojZi1yAZzJThVaZKac+pfPAvBf2h3leElOhCE7MwAUjT0
ryDOyJUHiRioMMZK5JWpr2xTG40uM5r9JoefSrKQfHsKds3tnOm71r9vcalDjKzx6aBabtfObq1E
BFgmd0PVdVveY/AZErkQr3Mar5kV8hwUfMVEtKFJnmz/GweieV7Mtncl49wDCSGV4sYRAM6kGl11
PgYIy70rLyMRG+fC6umxHwy6lWtLroceM2sRcBw3RpEBfmDmpJckIAB9/uhVT/6LwSlLd1x25loR
L0oBCsJjXYP0qBNubc/oc6f7VXME7Cwe8IT2uBzcb70YpvkNxwe1SQWjucBaTDG55+22wxTL6+e6
b7PUB+cTEQvlFS1/Guf5T5ZWMUuO4MfVBKdvflECq7cnkP+m53ykVFbGXsvVN4sG2VKUCFfhdQLe
X1P9uVZhOF/FvLPluIpgsvSpzsxr6k2lwAAoS6hcFE9Cq/mEJnH1Q2fNSUe70Qkoks1KfFkz5B7/
FVrHvde4sAb/yLLf3+FYDzZto2wApVW2ZTbhn4SVDV3cxzACeCwn3b/lcbVuN3WjeY6h0FB5PqCW
JjNnsYtBp43hYoA0MHOn9+4jS6X28oGvPvYI+TdKHuvvYBtpOhYkErDGrxjsTyJ8LXZhjCLblfsp
GkFsLWh78eLAJLK2Bkw/ysnHF8zFmb4/V4k2uj6VQYqfLhdnazJZ1j5d3zhdCv3iF6gkcXx6gMZo
G8nZYcEEYpolxDGcA+9Au5O71RlGpcFepZni9yqTnC7sRrha5OBXvPmUMdd9AA3CnnuWiDeUb+Gk
CHIfCKbO88Gvnu+g6xpTfgn9LvjytK8HDWA/cuTggtZtKehgtCtv+HU6D3aTemWbh3nCh2s0aF+4
g4/7EPS1dTsKV08FmqJJ1EePDAhPz98STDIOwTttPMmvCWYtNVYe3VpgCDtv4IPaddR+39o6Fk5b
Vf1XBL5h4RhErj5EXQcxax69T0buPI15xa6zOEQcR6923xZTi1uIJFdU9n7rrLlNPBwYZgB0XoRc
vBNqRwALu3bbO3KcVPiIFXCBQ0gLwci1L+/VrgiqUEEs8l2uBKee4bYNp/WMAf99b9f1BIjRkXxW
VamlLup4NbritM7oEl+REGGwzLsldhQ7P7Qqz6RYKf3Mnw/InEH5yRgPFZtDP6jCpBg6B8NzE5Cs
jYWhsHV5LTckNGpvFUSJn0KG1IxBHP2xLvedat3qjet7F1qio8Sx8CbE7OVfRlXNht7H9AgDGcpJ
rW3b53StQNhCw3B4mmPq2O3bm6p9AFl32oolDKi6ccv6lcMZcnTV5PgtuMTAa1x37+xNU0l6R2GK
8P7pI2GGgiwCUFi1+bjT0ZtN74Qo3Wttp0Kk7zuJZJBjy4V61WZy+gSwQDijXdOumkVE0F9mVC9w
w9xdjJvm6uuHQX9O8kQ4OUNakd+sSqy0oH6uZnpUkVOU46yVu8R0JSE2px7PNR0YweY9Xm2vzCJG
e2HNoiYe6rqZGVG+QRZIu03gYWJhS4oOMgbiFhXi+R/LQ+sCAod+bz6Y4burIvneE0o+fk1aP2yJ
jFv7fOutaSdFdLkqug5tXXsso6qgz5jAl6vckyadzgeaOAwsZXJMobRvPONSEp709OM5ThJQvhDy
Ix7G+GQWi9psEjhB9X5JJNeAu0S9hd5Wq2oHLtNK1y8aIlfdILL0Efjng+EqIAbLJW61EiUlWoUm
vsxuuq/P3GAGbZwJDuaB/cWBICQdpSlrpqKguVFN3eXEKqsPM6puaWLCFVqMJRbENzOYLmfjsdTe
KU+mvmsimbB6gQwhqqVRTCopqzydQuuBZtOfFRDfbYryNxAdHDsuG9ed5Kg5lOKut+SI2F/u0at2
XahRGSVnAb7ZGnu3NRK64XL7o4ifWdw38vCVqV8lOJc28k7G8AcLNWeEDJ5jSj8jQk4Nx1Kw7NjM
WhJ+oK4NNl82fFY7FKkFzmAdkGZXNDceQsI65T0F3IcBteiyhZ+GEEwn7qoKFu09EcyGl05x6xPR
pwhHrgViKkWo0PGNrw8aKUWs3xIO231bQd3NuiLaq6QCIwofxKvvkh8V1n3C+XzatsaRgsJqC7ox
8UlYbcvMprNLsUG874TMy3rKZM5lr6W3rWO27aEVXZRzJ+r1fB06QFtoam487zzHaKROX+UGpywC
MIFVHt5FE20Aya4JxDGx0kD7/FK4Ogf+ir6TObtWi9CFaI9LMIULV2hmJr3IIeWJt4pemLY3bsFk
pYdWeDFWE9URhILEnaV9dMbIRW/X5L2cELDD90s1uYnhsNn9zCNKWQVMqrd/0ptJ8NmETQNFVk7r
prqi0oLeviuzEcskCqjxTR+AMb6E6R6R6vIQHmJ9uxCmgZMl4GXxOXYXxrmDzQuDrAP/r7tZHz2B
oUytQoOM41GKTBMRpEmAIHnBo5W28d6llfmCi6qY6VOnLZmyQV+YcqjRmpUh9hNMI7uqKGMg2O7d
ND1RsCOXHfF2/kUJQEjReCE8eWBYeqtnJcB8qfzAlkqLXtsErSWGJDV8+YtFCsCLDY4U6cFwIer8
NMbRf85+C1SLjDmJdSjK0Rhh3Xb1kGrd18chXJAR5/bAkkGhXCwHF0KXkYG4K24EQttzgwQc0pqP
uuwlKAWYLHKF/tqw4F4RAEOnPYZC2drj34yVczZ31XvEEflaKiNC9XCGHrVph2ZmYHGRUNYSNLZy
BK9PAY7XatP592TJ5FInCQ5oDEkbL/SJWv25V6rTbQKD1fJEaJG0qH9BrjLmhD3v3AQ9b+3fvdc0
cs+RmvCLvTW0SaM48FpguCXpJH3PvBNSAdVf3YZeu/WejaomjJCpxH1vSveTYz5iPKuO39woLZtt
a9wsk1S7QXgxuBCXaeuFbaBo7mmsAy+yaBgcIChpq+PBZjWCjTMm2Af+8FQZLbIIhjGkRNI47L9z
s4VVCkPOyqrH1Np3Gk6/uUmDl14PnM4NEHvgkCzCr30EJob5mxcy8gie5xTnwG+DXCqEizk+YWrF
jAzz77udAtF/ozjbJRbTi5MF0OyfJVJQBp3BXbfugXzy00hfNZ4SZc39n7XllhlJ3PuEk+7KFUjo
9wmUHaJt6ngxLj5dBvg9ld6mkMG+Qgv/h2gygwkRmWJB0aIxSQQmlfvVMOIreVUn2DO1gRHP9Am5
ruRWBToPnjoMuhNw/ItTKU6V8/DWeL3WC2cR/fX59d2QFevCMwF/7iKM+n+4fbI/2KK8yMPjbC1P
hZ40V/LE7A7ypn1QDD6wcRg+Vznw317s9UrfnKOfEFMpKsr3t3cd7RXBwSh71QVEEo0u5ixx+y6S
/XyTW/9X1GAi8LB/jzGeVJML+yu8D50XUwA1nT5/iPvOy8/kWdZpEe9iygFHl+y2P/rq/RLB2Glu
78LQBNXC4y2VzcgsaiYRKyPqmHgEWZtxEcq3kBC2/2+2q8JCnqruu25kZbFVeAhvooqv41O2eN2f
K/twQh+nRBjXrZ7l8QX1hiPv95ihlQSnDhXLWX2DqSavqPBcqJveVMRkqqDrXnqEuNUUFsjEhej4
sIdBDEcgUdFhpWFHOlngdZpiU3J6L0xv7cX/j0POoDfBKO6cZFsCmNdU6DLKpETPWaByK+AHz9EE
AMJg1tt2ZPT7c832m6buuzx2RQzeANE1yxr5dQXKPqvlc+Akiv9g1AIz9xAKgUqWGJEN7jnstTn9
gVftzUVs13YorFEfh8Zyjg8BCEV3ycLJnHwXH9DhGAmt6elBhd/NBfcE0QtwzXjYpo32NvC+EnXu
/LTxCtrsS+zW2cKmReLGJhmQuLiZYUL41SLJAXaq6QWcONXskfQ+/dmBOqFa6cqxosLDMQiOf1Jk
KOBYtMCm4HuL8K9XqbjDOwzQyNOTEPJngn9dNZswnMn3CbRXOOhcMQ2QW6G0TrtkCWDnfeOvgAe0
F1yco5H6KUrLTu0K3Ay7Aq6/4NKDAWNSOkYJlinGx/JIV+xMetRpojU04imkPJz8IPLxj7VDm+Zv
+qFU92eJYSDmTeJQwwmLcLhi401rq31H6565xlcYfyqis3xFHPmjTVplS0OXYndW7FGTkfO+7ovl
oScS9TQHS/NjpVoocZa6eY5+X5ruJ+BDbL1sq64k3ZYQbLnMYnN5pHc15Pefr0Gr+60bpUhOdn40
R18i4FXl+pVKLHzqhi5kDJEQxDKMbrhSXKDOHs3U5M+DxPH36M+Yy2y29sVWru4PLVMxO6R0vCTZ
LCz4K3XS2DrL668V8RN9VkCykUeaVo4zJ8LUzX81Hv+fV1OZbct3YFvYFBaQQwomSGJWABvxniB7
v4BQcMfM+vPvq0d5XIP8KAg14FXLyQ1lkvs2Y6FT2omi3D7iX/i9ZMhbDzgWALh6rIyTw1epHdpF
djDjeKBmYs4lDQ3VsYPI272XiQQ+YnUShstqrH4OcLaycOKULqMahu3iKv6ftwJ1Bg/svOe2umWU
Jt9Z5kGmXHyHH2wxrJ4P6qIC08TtnMGrwMpLiMCzacUGJhLVfXfgrWWoqRFMtKfC9TTzV5/mM9B2
WBIWlq9p1w1dquMNj7Yoq1U++8bCWwwtpYbZ9pjUem6LJCeiEUQ755VMvmHdnJudRqcmW+5tx7/6
ku45lHb8gwwzRI9K4Dgzhvl9+Y6PtWN1+MNz19Yo0V9FtfIVHenRSUmoleQbocBeVe0XlHXO7fh0
tIqbHYZu/17Vo1sy4LknzpsqSaiTLVe+784MNPoeDKq2A7k565BApG4X30Uds6RXuztGuFe/lM8M
voL1GNWWlsupOk/nD5dGUDluoJXg61RI88xh9QzsQ1z0LrOA3QhPnhwWdPnlfHGuUlfG0OcPBfZf
cPKgq7aliXM6MmYixNMTYXO0rfoZ3nNu7GoylSHTD7tz95wnpihliiRLw6hI7oBZovMcIdjV06rm
3IpN8CEv7itxlaqJoy76cQx478Uw4/3GcenYUxP38cgCFrecZmw+eTWsDIkiqB9W2c3if4ozmRAk
LTSWnyKMKBB8Auu0P1VP2v/HQcifjkoBWtoRj8DS5H+mpZMu8FqsIu0lr9nEzlypExnbs0YGEWxJ
Ar8jYAQ1MgmJvhIj6VtVk84uBFx5CYlYGRYFwhjDB2SZyB40Vo8GH389HrH5JVh5E9n2YZexUANP
3tg3lLRbeayrlAEqmLJCUd6kxiMr7zMY6VtMIYr3E0uH6tTsKYPu7fXAGw0+q7YwFBTVa9lcAr7A
249YZ7zw5pfjeqttAeXAYj9VRGVmOl94ifNZXi2C1oialvMoNHmNx3joyYgV+ESYrXl3R6o9ajNk
c2SgTrCiuq3pjsUwaFB1Yrn1O1jvGf0p/KO482IHLFzn5ZD5hl6msuuvI1+NYkcLik7oURBtHq+c
QnUil76R4R7yzw1osksQDELA2bmrQQoZEgpzYobZAwZwgZ+X0cAXs2MF/I/lLrFNrRzSwfOh29Vj
K9CNI81uLWl1j6nK7A6NTpLrk1rHVmwFe8KppxpDciMmoaO6WJVIPrphIwt40OWl4ctTiT6fE3RU
tZ/EkxYnDsWwH99663Asic1vwmJXA+VK95LfU9rf9xaZDivscAEifYZqLbfulTeN4oY7ZWq7G5Qy
wwBMfQFBopAICA51j06bHLuS01+ewmrGJ9j4w7cD8ZUvj20g+kFA7bcpjBbaa4pyYgXBRYb7S0Zd
zfmnXFZrs7QogKQ8axnudzNXMAMLPl1g7psRv4CVI1cUTYkh/iFOnHyVrKWyngd/F0v/kUOjC3IO
Z2LBqhPb9gDxMe3uBKidaZPlNkRcHtthGyDsxStst1zHmlKWA0QaRL7xj36JNKHTvSWmWwKlSHxi
YlkODeWqs2Tf/Wp7DoZ39k9YYMCJJo3d5d6Aqk5srw6AFNEjBu9iCHpTMx+I3Q9qWMSzm3oZF+CG
d4Cd/L0z00glixjmhyzXBSzWhMQ2Na0HZYUk2V+EwlDCQ+BJKG01/qMc9ryvMFzkVqzWpwZSsn7Q
oH0oTIvEwxvX0w5p7khUJ3Zkkg69OPirYOMz4oodY8RWVAR+H6EM+4Rda+F9EZ82bsGMf3bBvL7R
f3R70VzWoJHiuSeowOAz3/0XufMI9Kw6o0Tvd0IT5eSb1i55xvPDdgV5zMjGhTS3dgYMUoh/Nx1+
+XJvSe8Nx2YnJPr2koTL3fpjXhhhjNbc4l1tUjKHpYnXoNsMN+FvZMWEB0C1egJqrikFTJ5qOsx+
Nb5oGq1F8gVY9EYe/6ZEAhBpvnxKxJC9cqjLT2tDBklEczfjr+szGsTLXCrAod068dxsvgcikINR
+/JeRh79hDw9I/SzE3mgxG9IQSOo5FdduF87oEG+M2mHhOTWEpXnCTmMcFjbtXkTGXAsrX1370j5
XRCH1/WOS9GN9AR8YSrIUA1iW4iUdbb2h+88/aPNu+KRNFYgXpY4OpqZJ6j+dDwZ+Y9ix2jzdJk4
CG8QwSB/9NL6weMsSeRism/sLwMjFZyATWqL1MY3lpKUgYJLjDWRZDM84JagRQOu34AK/e4uL3LN
jQXZc8rDIb3LH3YmTPBrh9uAOJp/kUs2WpIVrJ9mpDiWEOsZwUMPOCupXj+dEsMe2YRad9+mwBrv
/DhmL02/WvRblVYWGdVwYS+4hv9yyhWUroYZdRGSf0MdyMQp+UCOMkokaUtEl6vlOHqRr2C0o+8v
XtJ2xVUhG3WjL/v2QYEUusKnq18BEEBctHja3i4tCUAyQXY9AQCRCFqJcXSmjoDW4Ezv/eZJfD0D
sK2jZbQGRXM6AND9H8q7I+pysX9i4sJ1zh7YswtNVrE1cVdvw3lASIR0JaE+uEV6GOIVaio4mElj
JEEs8e25ZHSOnirUuE14zMdBFbp5NSDiYbULV2b7GBB1K4DDKIlx79qWNkSg6E9IiWyYaNKmRpID
d4Dl4fkM+UGk+Q28LO1gtvBzdyDd/r1HtLqSfGGthasb/Nhp9LKEBYiyw/ZVz6jHCJC6NYAdmRk0
INDI5yPprV480f4nxN+Q0IrbscXF8p7DUivsy2/ZOY+NjaCBOXOhD2/Ih2+6sMptt3RpPoeDK1z8
meaSzoSqm02aaJnXcegW1NI5b/EV97+8P6OQqZRPURMZOiJbNojxxZtOR8izhOKG6jkuB2HbHmaX
s59iksAq+X/W/Lasz77pSS6F5JGPkKOFRkwKFNYebQNDOuTisgJPTZxeQEb4IS8QJ3I/y3SQ64SX
69FSyn1okrFo4F1NiNbIeYOfIIAu3IXxfV/PgKO1S8tSTV1lYBbnfmIzNe4ieH1TTopBfdn2TqqS
/3YdTkHAFD2HfqpdFRyUx4RzOHf4q556ydkdyHuLqrmP+43HSjqf71JwUT8ge+Yps2N6vbYXk3ob
MOck7ZhVWWlCy8IzwUsaV6A6T6b2Kp+6IqjbCnkd/X6QJGoUbB1obbQY/p1yjd8fm6AWzxlEHGCc
hqoVUm1r7SZVoqEl1BH+GlmMPv/uVUlVxoHJ4+vt4PuqAZBNFNQ5wAJL2qeBPB+qd5WUMXfmi3g3
9I61TOVZpzERpbxTX4iaZRvekifFLF1p20jjy4nWH/Q7kfqvFViFLzC0gCRIQJq31JA5ryRbSV7d
EAzRX2V9JvOK+bl6jeFBZC/xhy3jKGcVaj+UMpCortllOuf2QvnEF6xYhEFYp8fGdQu8+Qg+hHRu
NVSbR3LHXN8aNswqetVwbiack/FgGUAOmDbgOGYK/mSmQl83/aRVmuJ8ZgqfneXlWWrHsVkxlN/n
MLKEzYtqK12GdZ/7RxDv3NqmynYSi4fZqkjfbFvDkifJV1M4qWjq22oWH+fVijjnhDpVKDfgqDMl
q5wfHm1ZgsITz90IQH2yMg0iQSx52VOTUOA6LdnCxgSfkFNX9rqCw4LSPjw370MEk6d0uv4H+crf
JCbPwL6AVNyLEYhVgSglitVN2CbCK1GeIb7adzdFZ5xuvHbyx9Jh+D2ftd0gLx4VF3xLae7GTWqM
ZUQ/eFA9jms277pYwKb2uww+DQArSW0HB2sAGsBnNeyL3n+OTDQKspq+o36aeMRYkxEG0lXauotb
L7ays/zfXSi3etmamCIzervgFb9Fd5jA1FPEK4A45iLwlI+Ru1WwR26qW1ouP4BbqDvr6F1A/B1r
HWEPz7TpAQrgjpaXrL4hMHWrCq/YdfImbOdfj0pT90DZI6Z1UrZ89E0AP6p8ecbBmIH6lezG5Vji
dX3RQ9VriqmTBfT4ehy9Hxkjjj0Jx4TNz5ciTc9rA5CsGTpfaKAE1ch6ALaR3Ml9qm01GzcxeT+S
nsv+TDzh9FA05nojWqiaND9kSbuJ7ZvmM0hhw3y2Qu3/kn3JppPBJnWhj6oYrPOgAD9iaGTKO5SZ
k1UhvnbhmWvdeP0kErjDZ0gmqBhZH1wlHa5Rz0IlUPvesu4b7CvHQrsbWj7XFvGdCNDLx1k5JIdt
9/3zwDmR8JkTgUpMVEtkJ71l50UUj6t8GbHX6naeBf76E6csxdYrw5BTJCmLJpI740cWp8bRslfi
MTW9kmLdBva+Ne6alQNHU/WIWaVILP9vpq8Nhgsi3Y1zHyIrg97dM0KZoUvNIboeJ+YBGHx5rrk5
B3AhkhMhnmuG5rer+E0EJxZg4ZO+LQyg4iSszw3ggf+anULjdoCxq2khq8jbTTucOmTU7npPKooG
1Yl3ozuKcVxggjJz4Ntp5Yeetm6HojQUsMLMdwdECxWz7Srj8DoHe8OsE9UFBdanJKLOrt2K8hTW
3HpygoTu55ocVpUdr5y8rGW8SU4XybWvvh6FHXnghmM3sfAMWxOGo9LlAsD37Sy2De0AF1wInhjM
+M9F7JW59xKOtod3AtjLOWUtQt60WDc6T1mJX+fgJT0OBoJpoSyQr2qDwhCpBHTWpkxfr9+tZ4/0
EyXjnyd7rgLj5MK525n+V8u+E71YxllGergAtjGQO9MyBAMjGPd9JDGJpyK8xLQjH2cff0kJomqx
J1I6qtKk9mzY5DXkcZfZeJB0Dlk3mGtYXWVgnLOz+6uX2sCSy3wKQ1UfEONSrBYeJsul3d7Cma+z
SK6rxvXOUlBtoWl9jtYjF4dBbqlvUCBym/dYXpT6zjZVxsJ00duhEsabvGVgXVm++n8pkN4KIKhZ
mDsYdxXZsFmS3YskMZkpd9lYbdrzSClaZ/1gpzrBuVuMllIAPt1ZqUcEqhsBgvbnUDfE4EIYuNpn
LqGnDoScnyWxq/ejRp6h/clckuougu96zdYZ4IdQhnzg7xEXyoU6iupJs2F3Uak3SjoxsAmpVJYs
00Zxbc9rRW5aT7oFSYpLLnnv+F8Pury+m6WeLEI9KFiPN3z27w3ISREWdx8ZGkUR2q3qY4WRDBAu
RPoCj1DUP4+OMWKl/n+O9DUT/lUe2wWhpdP8d1OJ+Td3cDQTvdcDmJNAOkrw73gOIXr0wYr0rXuX
CJPT+vJ84WkSu981e9Np+3iA2FqPZs7PUPsynxMkKWQaJEN+iJ4grRaNccC0blruKRTjPSSSoaR0
rmchYYL1TWUlmfd8WN1sebetS7Pg1yRxFYAVDkvpYmilZrhzITtHEjxMwGAApnVlEEqEYfG53bb/
leAMlQ5Hx1OIO021cRC8oBq6KlFjDL9/sf4/rumiTgEe/eI1wp9SN1u9prUCPKYoNWoGcG5rgRMK
5JklEmj+U2T1HatS4VGBpdY3vwdxkfV7LzTcykQppr9JcBi8avEgchCzAODPi0pEFPX5sgipvEmx
Nq4SG3nWWsbzYJd7h8aCRC2bEEbLc5LzZNZFiToXn2aCRPEuJLNVrKfi8/aDJ9SphR+vevbtqS/C
naaK7Z5OywPzYhgFg0JQ+vDD09S4+008AVwBO/AK90QPAECurOSDBji5a2aJe421s/AxLgzS+rhs
CxCGnkZtk/5qr/57D5TfBFhumFPhOfSVKKADa3OBAKZ4hVleAqT0yFDRhkYWw9mvon/MjhgBFqgY
CLRP6Tmg7DRpvXq1+pyE7b0BpSctJ+OhvsmnSnqGqDBQSEVzQy/Tax6xjjxpY2ZXoboz3pPevHAu
CX5Bv68YyjJRoWQRvHwr2UFpcUWc7g3JGDhdVRumaE6ind+DGMP+2Bewgb/ElcVZTI4XKZTfZppG
E6cYBeRak2nWyHyyfC3TCM7zoaw6aHlvAUw9in3+v3CteaSxNu93hJFJf3aCWyG2ZNRSX5nTBK9i
ucUC2dW+Wst+NAX1m7X7ZCPGM1fAwQvNLkQzvrWHxddwgRwf3uF4YPsE9n/O1JThW8aafxwEeeIg
sy090e+HR3OpKmk8O0gUgipZhKdVPqahcnqlUXimEskRhz6EbYYt0/ileR9nBGLzyH2qUrgMSfKZ
+e4HXHMK/TxSen5iTHLSQEh9PguI7Cy/rZuT2njbCiQAH4A6uu9+L9IMc1dmg/VVMKEhJViOVIVZ
eQN8I1thhtZrETPu1hMkRmvPOa8UuS0jxYjEX+Z1vnqruziTX8lko4oqtSu8y64J4xxFTMi13I6j
d0+OssG1Z+zan5Ev8n2CtPelWx7+5HTKAGZ8+fytQknazLDiob+IxIuN8/iADd7fLoRZxxKlU9np
EYSkQ0wDOM9r2nAeddNVwvegiqHAaDngG+iMZbHiYmMMVDeNCA8l7MEgc1xSQuuD4OUtuWitwL1o
E3uc05bH7OPWDFhRFEEpYcTN1/2qkyoGjUPS7JC0fp7i/sraUWEdm0KnBWP8Fgl7wcFFHZBoQ2yw
vmmxLZdRo7ty1009DUnAN1CrYyD/pGhVDdILhzd48cT1/wWvSWmaFW78enYD49ekhLSGt3+rGVCl
MBXFAX1lC/54uNDsRUK91utqyKV0Pm2E7nq6DNuTQKidFGvygvI0Cja4Bxd8OkZMwrF5JfH0Op+Y
t54/IaNaWmj4wJYpkv5Jef2L3SURmEjasUyvhMYxf6jlv7QdccEOCFZzAPItxKdYTPf1c28lUxwO
mvgMR/blocEuK92URx8T4OSlY61UjgFV46u6mUN9kxbhm9esTjiln3pS+OmsqkwL59ESH+ZrRamH
ugCPIiJPf4ymCV+OsL6gXpn7kODfm+FBvujiW4cWyd7YNvajjdEbpOOwUtpAFYnI/6P3ilOluDoD
uZw2uKPeabAR2Waloj+6mG4TUuCIMHVyK1n3K0kG+WYqX1SA1+vA92aUkoPph2knQVWKuEYtFSV6
fAxVU2U8B8pw4uuspGxagK1tDIcTysw3rCrcmaL3JpLsZZcoqlGsouKkk3o89ZsEKBz0SrmHN2qI
SbiZE18yuCPetuSJEZkt7kOnKcQI7edeDyxohQSGYkMwCoDme3GHGU0O63HfYrmiZ4IalLWj8uF9
IA4/DwBYBGNJFl96i+pq9nEM3z35YCLZVRrQhWBPQ3wtkjrZCaZ0sb5VZa71bVrY54w9iKGPOOo4
/bKfJCMej8HJuNN+Fo7LKLuDn0T7
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
