// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sat May 16 01:35:03 2026
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Data_mem_sim_netlist.v
// Design      : Data_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Data_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29056)
`pragma protect data_block
QE6E78EBTvbTB5AujAmJzZcy0d16W3ybWSHFafM8hpSUNKUaXuv8y0/FI/sG2zSQJV0PYrl7T4PR
skfZVcWx56BTALzsYiVZwFI3xuKqm1kfZUj5z9qKriA7MaPXAFMT39KOEN30nOrBGh6cLaq1/LIj
yiw51tLucU7DckYASks0rqlh0y/7Uayt0ihRfwz5n/lq6hZ4aLNbsqAq3XqjKGdYzgzpPk5NOjNi
yInKW2iuoTYSgCCkFQq4IXhhTBc+DahUdsa0gKaigsFUobzSzCZtk9vQl4izCExb53XwqH8ljJl2
7osnk1Ml+N22mdwYL9qIA1ut8lY8/BgXT1Fysnm4be3wO8mEsMroJ20DMMiDNH5A0NRPWAZUyYlB
MlaeWEjRjEQTl9UVrlEiEtJt1aaZO5NkI23rHvvJEI4B6mEtrWbsgxIZ9bOVpWpoQOaWvIyLtMAT
6zka9L1amxNqIuXUKqoq5WdHMUh9SZ5qAv3sfAsdWk0OwfgNudkVNv93olQLFAfcgoCQ63sDXkIv
kEiNyLQmhs6B25uTb6JMltffHh1z94/l6ftAwZMSeCR6QZZ75rxdKQE7Ny8s+WxsF9rHQbBElOoa
oogT3An6Qpfe9s2Gzu4Q9WxXW9L/FEx/2Ys96Lmc5CdzQ1NfIzFKDVZDm2octaatjoZMTl3PXmLD
SfyTlFzc/inHQmTw5V84ODfLrEcUI8+V1FElPlrOBA0ows111Z8AoqZa2cvDmX1MMHEVVJYZS587
AFdGJxLiWKOs60wDBoCIgWNIQJsxb2xhlQnHpFmWZXWl7yZqfJQVAPe+jq4RaYhiWTm5/dcuHpaL
OXVfWlObEzEmqKD0f/9sQ1q8nqRoxdHG3yBajYPwa+zXAVx9Ne6aDIVxTvX3ihw85QleVGfwhhex
t5Q01bzFiNDSd6Uw/IKn47xaKx4yHykXlrl6/rjUmnXuGAj2ZrUY6sAm+xi86FZRCvJfe9YEtOZq
Oswdc16dWPKGprC/Wg36ulZOJhrrro8VXzStzLESStFZDEZ2JlyedNVZ74qtqgdBq/W4Mj44Qped
+79nMc8J9uisAhhBFENdmU8AC69pylNkxIqAbtQKgrDDryXLw5d3b9gvtnILJYwB3Krb6lYmSNvy
/iOhDW2uegzgQvL/HHMLQabu/zfUON6pin/hodYl5glPehdXnurUI5BlVTac0pgT2V2fejLqrZxc
pghU/JcFSJ1rtW746Z39dGQILj1xe4kGpA3Mu6rNwQFkm4yImw7EdqCQQVEe2sADXVQc6o5lWhY7
lI/JNiPHkXvuThxR8TRICMxALA1sEWYVdn+GH/qEkvk8b6nneDRstaJMGVL+MD49Vs4Eu6V+FX+D
7n95cQwdOoj7JgLZ7rbiGxUbw2bpJp5hN0dYAOP9T1+jPzlywhGTiL0MPcJzD4GlBGy9o5XXI2Y7
6q7CmM39gMca6I8z2+6BrITTktZHKA0bfwMlKaVn00ukYAQnD3d4ulLegy6ZqZZd3CS7PUBzcbvz
jHpUPfE0vAZ9PYsKzLCsnlo+wsxSaZTm89wAxHz/9PoOHvHfKbNCjAGBoIKCuDarUthsFwD9jZnR
dL+LIfKiWrv1lEpykR1TkyH4khcOgjULl0AB2UmLgFHsvf4u5tqld16THJ2JB2SXpsPtQ3l26Ita
IWG3KtH3WoUT6FlV1911xvkTJhIZfa7kEWsjxbX8VHfoqMXb/0cSuSx9f2m/8+s3F4BB6qXaytMs
9gc2x5TkyYDOwEihkgV8KEhG9DRdqrz0nOpOo+PAFnnwyOKKjYe6/s1NH/POFmfhpGfpeaLxNZWK
lWGVSzlL9mulgsYFKu+eYP/MKQhEpGFKm2X7cidTP7u01equV9PFedfWwAOM92IkSNHlTnepk3IL
5M/VHr5DtH44flEp9Cd9MN9DcpVR2fD9Peu+fXS9XXWm+nxG5vAUHVZIeMPdYWRt0B0RC2NVyBdB
WypIxhOurSfi+un6HzNaywxln6DU5jZZM/wzeJjh+UH75d0I3NV2iwxBLRQNmE1/dIk6UyjyE2+G
YGd4qzcywXQsF8SiC8Z+2mCmNWxqLWezcOfW+8L+e9l8ZfJxGLi9TP3jqde1WzAqD6eKMiP0U74J
ztdgfnZflQ2/O/6w3FZFXvK1E1I7x5k8wQ4SVekGlrQx7qbhHHgK9fY5IJxx3W0cYecx2ZRINLyE
GzelGqLP8Vz0gvRSWOvseqsb4lwBX054FfRrPpb8lawbxF4ygKqreDiHUDbAfft1Hnn0W9MKnLV0
NH0zr542tL0l/Y6hyOIsuDzHkBO5Pdz1XnRLoHLU7r7AU2u7WpnGZO9V3cf+nhfgCt3xvYKIbFfA
aKPee4kcG26iN4nPT66sPsIb7ygOn8Lfb86+D5tLZK9QG0VGoMEZnQaN7KmRn7VixoXgdIb11oo6
JwOahQpTHwRdMPfUDuJJ9aIhGLPE0ZsZm7x8LCxBL9j70yulurB+HVtSeuYGDxLsANt4h/OL4+Vs
R8VEAlVYr14OljmJg4082VHNYzlGD8NeHvXwQV9UstoIvbImmKgm/mNlMXs5nkGxeMc7i1jqrU+Q
w/v3jtk7KIV2xpqwKXdXOWtYElHb84AEvdwD+JyFnTnVJHf9AstOfEhTgTsh99Fon8s6JjJEcgGA
U5L0jsx3XmyZeI277cPp8akZcpTZqxbNJvxHP7OTP1l/qD6DBzx6wJxn+AarL3pQ1X5u7ceZEv0K
4ipI6PLPTHQSBhX9/+zSqoOkarq8PNkW5nUN9bfdu+kf9WNkyQIvWkRbEPUVEAklQ0KvepaIYRkK
KOVmYjFTV2bkTd26MKe0YWDQseZgm5kVeC6ZKXRFB7BIpPXJMNu91/084BEHax+7XMKGC0HkhYba
mVSSUO+dmrmzeQDMau3tFNnkCYgaQyggE8ihwzvK9AyotMiqs+awc7LUBMOp1R1Evwxd+nh8kK3X
3lOWNACkLv1RqBDmuw6o59a58icJZEO4c/nWeAk9yNPzP+NwJSP/0p/oJsRCJtKt/wOWQnIsehph
aOP4aJcyUkOgclHMPlB9FvZYW7zNmXkOtFzzT3pgMej3HpUfIgR7bx/i/amgj5q89RZZFASATp1v
gzpkUmEkYzVnVLvJjK+MfB2wDQ0Hx6ZUe86i8dGPY/qvlK8DoaeWzXYM/IbSp/4ZMNO2AvaSFf5u
q9XAUx5GFmn+SaPGvLk8GbONpzawWeFjz++xu4JVqXhJHNaZMuz/2BGQmGR/1BnJPVlVDNE9ymwy
/MyPS+ZjcTrUvPzp8OkUA2QbS8qrPNg/syZTpVk3hVgWvlvgAIz4k6pqFDuZk/3OeA6pANZpClUa
hLJVeRzKox9tnrDknyCLQmSiZs+HeE9DsDDRHatQPHiXGdw+eafbVZbJt0SRlt9DXAT6zuTLvkq8
EfVmiqjPFOuUYaCybSt04htcEFEAEzT94jsm2kvgeheJRu8bybP1QSIich22SitMEMDFsE1KTUlT
KkK9hYH9olkx1AtnBWCZFSpx2iHKRyMqQ3z9/V+vdB4GMmv4Nd7Ivpr46Q1YQFK9Dt/jxuFOznDO
M1TGTSWWRntfCGyYQi7R/TZ392sGpb3EJN4skVActOWRj6Q2wk1xPyApBtvF/OF0VtL1eMqfeXcV
gHWyaxXp8tP8ditiR1HzW2B05U8YcTP3Isv72W/6o3AaRzWNvJM5Yx0LtG2FSL0COB2avAO5RoRN
DZLOsvXToUAHhtVbPj4uJGn/EQW1IK6+uLt+hdyzowzm+2lHOHoeuNyMeuwD/abQ1T5jPCMO/5hz
FFuJV3jQ9Gi8p2AAPdS2KFhUGRTaZ7noOXg5bzXtjnVDuBYB/QYZIrAS9zMznMN9NlO6LBNhSPsC
2EIwBbtFUvvYbgAjTZI7U12+a78sIkTrvz17M8hoXGLqaVO6wBW0wF9Pda6oR5uHYzjoOeMbeaOQ
aZYY7b1cWSwMPajq/LpOPAdCR0aq9vNTAOA3z1kdNOkFN+sLdT740FLJiiOT806mFw42y4dlMnsk
cSUalwUSohciPCiesZ6soJKQP4nfcTKChN1gX9S3pILR9pl3W+nxo2+ZSSWiIRi7K23rTU8R+xJx
GQaO2URWbu797sReHxtx9A80a1qTDJD9YkGxY8HjmAvpyD20YuPqs/zalvLafYwqB3IX3JMr5oeq
wqCroQUdEYTXQXDJsD1nCNmkcWa5M6ky7K1YpHHaJjeo0ZTaBVELyD9mEpjUZDAs49g/D5kq3/jW
Wb+0WTl5jiGeZI6O0u8RXMW+7yniaqTTTRaDLjTxcg1cfQuvqjPAqnMlTef7QNSdX43jKDsVCGXd
ZH8e7sz2frRBvqlxhZM+hFPLpWz1WoeTzxsVqcgqqM68fdWCNwNkkinJpJEyb7H4Ry9ITouCMifu
1grhbZdDYAySBt1N6IpSMK9Pfu67pzNYt4GOA6RkquWM7vJF89GRYtvOvX0ZosPmoC3J2xPOsGeP
Z7rZFubRDE5fZFzuxQTM2eVMCRPZumAHzboQEz79XXA5EXXIGBMTwU37LZogHcjBPdPosCUImg27
sTZmRXymrSBXAvaoodKeKgGTU3TVP9E9v/FWsli1AFrkrzIKsiStf+DuNeeFD8SMigUt0QZ2DAcj
HoUL/IAZQWaFs2JD2hcsc50KuJYJRCOEQdnqZA+CXxS8/CN5K9jjMa53CR03yfr1x2ElDryp1qIU
DnxVqBtsgsGNH4aO/BOO/O3BHvXrpADo8AUq4guIDaYx6pr7xhmRXAPkTNN5VQqPZPJmeeTq6Y/9
45xjMJort4A5HW25sdbFeapPQKUcg/mmT8XPCZhV0VKqEQbA5TdbTHkOqp1H9+0M5IW4k1G1csHi
/qmF7kMrEoPHXzaAhF5Hs5nY5vsSrjRGQBK1xVHgflX+9wlviIKanaEy2y1frKyUMgDgtPJNK1zx
24ez+8s7vFLcyHxSrc19zJd2zlMTamiLzQz1dxwnLZBAdGen3qnxbCroqlF5CHRUoCxC+w5x6ek5
D2vbjjg2AawW6icpalUVgTqH6gJlRMZlfm5o0JmGtuOhWdk/Q+ZJA6PqW3AmRLwoDMpdhB5sx9mH
ub0tthI+PGnfuU61Snh4/xm1e4EBc2/5VSrN30L7nlaSmTEjTiTblWdarXMT6oPBKmUVeQg8rKyv
6jVrb/keQ3NnjvVNbhEdi5VzfDqnsg5h/zIiA5TknBsHjFxIGEVVHXszyndQJJGhzSaBzu6gyjVD
hqB1KQsGBCsXxoQiswJoMFmWsz8ecAAfOOfwPtzI5KjWOVUdyIIAV29N3kD/rT9krVLns7LzrK1r
73apHHvzlAyYLz1maF/eBBEW3a+8AZ5X3wKngWMxa7CWgdxipswEVg+AilUUXPWuwwpKTNxpOiiD
VMqBJFiUbNsL+d+bGiridaLoycpA20d48kvyaSlIrcjhnb454Vm18ggliuh5Pp6aeZHhfQ3KLKFn
JsR6D/cPgdDn4Boq7V/eaXRIwWy+BSOCH7U5UAQ3Q4IPrnonU70XkCB5HMdY+W+11FV11LLqt02y
umCke6e8qGV9cFZtcsK55uiP2KgRmt2ESxtzGjYibvWbkOrfpds48sSkLq42WwXo6U1phNW1YWVi
2axVoVGbVKFhcPKhgMDDZZd8W8FNbgUySSgepWjGPKkeGSWpSsYPPgacnGEWh5oXuL3AUKHHwgli
KIIHaVsIbfRVFms6N31DR729hStwgP6qP8ZP5cLidupoSJpM2YIRvjfrFIyfjrUf6W4qqHVA5npw
H1bXTpOOy58Fl/16FHI6muSiCHP/N+O13fHh2GqQBLTgSuGOb6iziKCBnaKX2AfEnJO/Xc/Ely4R
O8igPgis8tTw2yb/wqjGT7+VjBeZzQ3ZcgN8Ty7h5Pr4XbUBklXxPZ1oTNaS2h2mnWVUzbRoHOUt
+c06SzasjTHjKu/sfPNtygM6xjozCICJG0mAldYyaHabeN8rX0l0o/s5RRN5xOTvQH6AsnzmQpTk
Qf5tkQ/qy5WBRE+Tct4NhLw15L1O8XfuXWnrqFZaykNWc2PHIFzgOMYTTAODMo//kQIS9dAJJq24
TWXl6TjiWAcBxvDvc7L9vRsx28EObRJdZ/KlEqJk5EgV6gtpHRhd72ekNo3B3/kSxknFBpTWBhoU
FDG2vISxrkIJf+pCehqTskSXolbHQcl+zk7Su132gMRkzUuzsFtwqB6Uw+Zy5O/7mMqdjzxBy1Sk
Kir1OJtNUYr/vALO/+fdYyUiMH8eaiZOtToDvXrPSnhJ41VSQbtUMvvGE/z/qg1IIQ7oVMnzc3kc
n16FHNdoHS2xd/VpK/u6/KnCaKHAtiIFgSUB2ze6mVwViPh7HyM1dPvHokhkAnYzuw1j2RpfZ3KF
Sh/1EFpqbNWriinghQuUhGglCvHdjI26f3P89+B8oath0ZgwoeVyaQJqA8eJITW4NPHtN5joCo7u
QDOuNLmFr8y8l4albhHbWDjkiu6Lk34a5vDIIqD4KiGZoTofdj8AaqcWBRXeewmj4Ep5mYyF8TBN
zaPImKCY+gf3LEbClCGUKDJ7ZTnhlJ5V+u6EM187BSU0wkzV+1me+ZKlshj1Zn7uenygArUBVHd9
5MKW3c/slceK1QzblHRVg9OQdl535+dXEPlPSyG5BncJdk7LybO0EZO2NJDmPwiofBdh9T3YKoLB
RVejMjUu54bN09K+01WVL2szZQH93xlV8KboPsKyztD3752y8uZT/Ds7Vg4vtbGjL5533Hwrmkkn
TSdii4OoIXFQP/pl8IZyFE9jF9AcIfxPn0MAkllylTyKZbJLrh222UbkWaKaEXz28DBoe4X+ayAF
IaoV/dMJx3u8QUA8pCcmpAvll+hARj21oiL38j6JHW3OADGm1j99tpsk9tqII6Qy56rd4JeIE2Dj
9I9Qwmm6vq+biFvfQJnzCrDhljA3By4TLkkzCkxetEQHYAejXKtF7/5yRPu+PnAbPdfKLMxjNfjp
yMG9JnjeBgftSaK+15xX/3+8unUvInotW1laVYorloe+ywpO3sTE0sTOK2rOtv0j0eAIGP1fkr8t
Vp2/QB+C33FhsogkCYjdJxJn1RHuMabOLUpp1t7ADnZE6LQ9ujsUqxxLna/dJ8HRyPzAlhJY07J1
meyrf6AOF32OV17Sl4BlWH/YFUIvgaVzFCNvWO6FwARIZisURa3MhOV0IGXq76ua0P6K7uL6+IRR
FzMf7rWnsyc+qa+UnqOfNb5xU0vISbRl6v2TBQyjAt+nXRH3eN6E1qnoAnDG47ZHnz5lWmUqTY0a
oFBiUdY5jOhKBry8WXAhHU7vUK4gQjiACxb+H2lasLdWil1e5VyeMtCIykjE+AS1QuGcR+kTVnJv
QxD/BnzUZykQ6ac5ADqP0iISq7AVCAZ8UsjCMi+0S74teHWqxkoQGUlUwZcREiaoyG8eiJvxHh9b
zJb88zrw5O6nVCAKW/oQfmk04NAMdUyHW0tI8O1/Oux++NVxGOKDnl1mfqdUrvzRQjO+geONxdau
aBquDbpLXDqzbzoUQ8HU+NRn+OkpjHcDlFvDij63rl22zuxdLOxfxPquMGB1waWx69OUCvhfnrCT
eDSWMj4dF0BlPwLw8MZcExvUNQWH4HsAT1DZUAX6xqpzrU3/xh6ucO1at0lRWxKeSkaO61KsPqet
eIDSEeL6B7bqmUJy0BLQ95OMIcHpxrsHmRH2vk0DrKePDf82QkhdpMZBwgaZQGzNf2QNSlwz4Cnb
V3z9Pmfo0Q96u2h/xvyTBI/jbe7h6Ar2zQkIe1CAP2nY6ChkF9/ctr3gNDtw07Xt/c/6EYFvK/PU
SJdfxPoQtVFIJo6o2CuqCciw1m4aJuAUwIATrRZTTu30q6twR3+MK2TXN+u4YqSmwmxg3PHrzNxN
vBpplAqwsq5e8k5+84kpj5zFyawMLdLDwCE93z8o0excafh0a5Bgt0QBn3cZgebWf7l11RgvwJEp
zTlRXIgDDHEYDtrgyi8Fmp2Jg95cDwsf4IrSkkdA1095rRwzp0JsFVOHxdesdQOf9VCy4blYeKXq
6Xu6gU9UENVh9MuwLNwtuvuTcQGV26uZl8W68bCN5mQg8BcuImknyXji5gbly4wcG6OnOSo5IQ1P
zaS4+JDDcE1pMEcPk5dS6dqK8P6YXf52A8PctQmqJ/VKFMayhBK/CglignsjmSzgl4q4xU3NkX+3
v+XVmnyL5QSc8vOaubl/AouwEt6kkZWQp6/S9jALQsg7PweuKPHHqD9WjdJ7xc/Bi+wk76i2nwDZ
8+Btqf/iadwuXXJGhrAP7wovAvmGL58gEtOU0cDz75TwsQOICJq1WbzyW/bSeWFXFapYFXd2XUl0
fvppvicZWX6zgcQmxSJpiHkzpgOvEfimFl0TuILk/vYuIuzKwJD10L/woD85OknqAmOT5d9hvPFE
VzmgLsM/kNkKOAcaRR87DZ4Jo2ZA1OxdjnlxxYt5CcF2yf6ACS5fk0lHdUFiQH3Kayjm2WVboIgi
n3faZvbKH42dIZEWNffZfHQcrjxeGcplScyFhIKrUDNL2FVyhjDO55Rq7vzcYrfrdivKxyQDgy04
SUhiQk6GCeobqVohre0bnU0Ge4tQOy+0BCaEw5BkzLHMkx2vC9f1zDTYV4rA+Fv8A3iZ2T0541Uo
9UGtWwMbE+FAAH155szl6EkDmYcjSYI6ll44H8Lo1mi1e5F/lTNwgXIoYzjWoM7b/vhbz3b9RQE7
0q2YTYFh4kpkJBNRhAJ8AN2pbiC7Fb9aPS1gCRPDhFBK08N6OfMiI6MfxouGVzqJEwGscgChtA6z
XvaxDgKuhXmJJOToNgRFU4r9jnZWQHbUZzglkwlKx7oYdNLPccIJng4yAgUn550ZCGycY9A7ov6C
4vepkgW3+QKihrzY2RFotgbuz3PlgwMvR5ZZ4OdxtRsrLnTc/fD2Z9uhM5yzlMbCsRKZ3EPZmodb
thGlpYT6Ql0czwoBIjriMPIjfrZv/djacxjLPFBs1473+Nrd2oi3b4LeEm3doCfRVq+WhOxfgL/U
ZFQ+h4FUuBbv31F2CeYoBf5+lRzLiSpKdh9V5D8zVvO5mn7KB36QANehzyCgqx0PNOmF/DZphPhK
TZkmpiVcGQEpT1ZLiHePPJ4oXbgeLmedyp0Tyd2j7mP60WhfR7RyHxxIuoDMbAdF52/mvE+elNT3
OAyVih6ntK14iesZIjO4qdGPP5EHxJboe0aJQadMmEE2elpNqXZVAlOqhuzixT7LctyMXWrH7aOJ
zVKEYG/D6Jm27RkXtZZIH+k0NDJ6IjCfVT5j3qSNBwKl43jrsk2dzrNiJjqGLkawlWCIXztlCqDp
8EUIVDWLuinkgna3ijF87rWXo/UCX2FZHRp6lmqwVF71Fk9QyElibhbBPhUlNk2ydXxyvQOCI/Z4
bNMnFb0c90u9/+vmb24L0NgoY+Chn6Wz6boDaLp3NHux4aQLmEVLiQenpkKy+TvuZ9t6mjvJKQ9J
ehT09Hq5mQAkUMlRhT24COCHeJ04EuwIqP/cv+wn6Yk0TlHZ41cAGcNQCtCHJxDDlJjFParPMmX8
drR1OYYKiLVamHm8JJAjTvldhpbwaG9c/ugMLtCyEnb8OBdLKOA6UHak2STP0U8n+DBgiVUJOb6A
eV1/62fBkjaNRUjqBp8dcy7BeT8TTWIhVQB5jxxgXKkELfyX65x/aj9pP4YYw20xEc6OCYXS9aKt
8IUcb86LpedoNlo8Ru7WrfUs6SodJTB1FbuN/n2QpliUZs1ZMXa9RbkIohUCTpc3mTl4OqWxfJtX
rawqAjAhkTRF6tjuoIzfBvOfTKyTKoJmD6JqGuThBas/Qen2zskBvqU5HWW3YPit7XHH7UZEsVRS
UPcIv0Gv24WHrFhGfd0eo7Sh5x0jX3tCZfpO2klQNZiLD7x1w7wXxOPbNKyVZmZpF/pDUIGlDj2g
W9Myzhj9dC8hZKJFrVw1++yc5k8n0YaYIqijrrb5StYIhgHFod9VxM6z53kA3QGgL3iF49j4SPDl
uatJWPAPF0ADMMN8lGHxhkzttfS4jmtTLguuNzDvd5QxUNgHWXklEJ5TsMp7QKydmbXZyNOWiyXE
+fm5MwKxwVjFly1EF6DK0HX4Fu1P2BDrcSGCloYlm+m2c+X2o8iCo9vDuLIaMPhXFWL7WVEfIBcq
V44LqRsyv5XZLV0Ziyf4BIcfwY0QP+/KoTBd3qvcbC+oUAra+SwhKxtlUv0dw5QS5/7rEw++S5eT
hUg5l40L2r/HEdnMvgY3Y0xL4IetJB2C2Ra5AcTIM254sTAhiOLymCX3rZ0e/QgG+mQoJHJu4XJb
RGgZGukLPH9U+LpaA4qyyJE7CkxYG3uc037qD7zvZ/22m8u7A9kM41WEQALQ6CPfUA31hzmUnt0D
C54hSiCHJzS3F185ZmeLzo854EOfoWxJdLa4UzFOWRwOzBHlAxCSIGLK5wi4cLAb24tWHYyUcl3x
iBlmpgllNitSTgpahXsSHyHPNzV0I/pJOUWFota48bnL8BmB0zPnjRzme19vGWIlaNF3wXVUQezc
v2sSjrNwoS4lCnNJZWREGjZlzEmk4UykyC4rdabCtIdKpmZRov4vyjZxz/ykt8afG8qEVnEN5s7m
G8nQ/cmkPIY3wP0PvSrIzs/VQrPXaiLpx3mlTxqWfRW0lpSraxWjlGGEv1ojcyqtF3aGfOYn5vWX
c52SyVzQitjIfve1oDt/5vt0D+NdOjX3OodV4cJyf0RJOYDOBaomkag1SErtGFWPFibZ8QPpJ6Y/
yMWzLSBof47W5WjowZo33600xkpacdgaBuWclfRduipd+sPhBS2TIPveItumy4uOFZNCUjRW0kMM
Ew5UGRWX/0J3aedGYSN9fJbqrX/hKT5JWKlkF3oT4nxjuPA+Pu/vrwjBx+VadcBUvFtegJS4qQoC
DNcHodB+TrvXCO4LtUJH4yTEQOpU6dMGLHMBZ6kfRp4P2GOgPky+kOsuB2sXoUYhwm+jnugL9ViA
5E7hDau8pVpnbLu8g7ALeu1WiIC6tTcul/neEf92Cfsd8DksxePg5BmFnHCXQK05BYjQqu0khi1e
xfwqYQlS8qW9dGs7IFkUT6UfsCbiII3dy/PlSy/BxQFJnMLHQpIFc+0YYsGaN/KP/4VsIBY8xn4X
sv/83FY7dvy+3920DVutfMhYP8g37e5lR/SfR1eZuBACWCNMZNLa2bt+qh/uIeV97LGx90XxlbCD
XLeJMOpEtnCebeRTZLIKolbepy/yXwjKiOCmsdu9VT5H2Y45Zex8y8rW3cdvpc7rRHB1z55DsKD2
4IcUHk7DTrT+MqxNTuOOePwxC6sclId9PqllcbVI/tt0LVqzB1nTO2thQh0XLPBDu/PHkrk4uXfg
jnkrSiBOP7ru5l+QzlZlLP1flhQQKNIKfpE27oUyG7jLFm1rI4R52lkrYa0MpFwd9rmhPlOXBnlR
fOJOLvqWWovVv1Nu3g8ViNAmfifepJI19Tejk+OCgwmYBWoDut7hyoeGLQA6ioHI3QIOS4DIxBhN
QwplwR4XE2fSSB4+0I3pu/nMMmoaGQlIk4nG/ysEeqvuP/SI1z5585vw6qlfRl1BoagOYGwDg2l1
HuUR/qzQD5e2pjxf7oQD5yoojbjinyRjBQqxwVrVI90CM+ZmVYxqLS8gqI7IbFHelyc2k8NtANSF
onNmf0ttySv4jz4qrxC3gGHuc0Lnsv6Py3fAqV5JuaPNhyvxnKeTe9HnvG6wiv8cGFMeQhTWTJse
khZMxBN19C4S24PLtQlNpPDjD0uW9gZxReZ16roxQLT/Yxv89DTbNzmw9AdF1hluW9JhXYUycvOp
IW35fuoivauo4A2tZSc2NG9akfui74/JFl1juzOKpTJCR9dLlcPkOCcfKUIVNkLm+ZmALFlO3rqS
8qwjffF455eJNWY3C4RMD8ko3wljbNa/KYBXiWUBQb5P8HR+ubmJB7XV+n/5dlK+BjSMno6okNJt
1EY3fLMm2zcUUGUjwvkJP7ncD92DWOSvVVDMm6L8DrxMJ3mFvyAzMsN9zX23qi9odJi/VFjXdhey
85Fg2V46Gzy+DrfLK6PX4HGxHvgtAiH57bT29VRddH+/d+nN6tlWGDAZqXvvO2W25IwqhEUMHrNV
lM1PDZoaVqlQRw8WIlBfMT06qV2J6rRHxtl7FZjfa0Zz6WBtjMsHO7W35/R+mn3xP8e++CKB8YT+
rBqcp/1srkVYpJbV9+XJuiZfcLW9ofOw0hGtM8SZit39wXX2gtELlvLR/ysiuf1j7FMR7m+1SGgs
+C8V1D0WCBe1TPnxAWNRgBhvKKAUKHa9Gey9bO1bqiKgfqoDsCdWq9atPXnMlsnJNKT2cCR3Tqp/
9v469pDH3I6xSZ9jMykDOkPGKO3UIcY7VY+ZDy0jQ0qfGQ25GyTL7EjWh38huRTcRE0TIf87fbif
4+SB0/M4xLaxyOG/YeKBfMbPgNJ51Ppr9sJhNi2tJy47JX4zhV3Ym4X8D4EjxMnSanXsTCWdP0+V
yT6FTD/DN8rli1S3CrL/B9Bndfsj+lgTA4Ebw+gCD/DB6L6kO4wQr2Y9jrAFSGsPL2OJmI8wy8pU
JktMJ/0hM2AH7HxW98BMRicDbk6YPq8Y5BBQ+YKmGHpD1XF1L32A4tx7vzaGHal4FPLw9Mmq/WfC
wf/5E3mCAtN68WohyNFumhqyXr2kpOvZGU7F6AdPsyGXTDxwHMTLJh5qgMrP/aXUPAhIDBn4g0kG
PsmbPJaKU9DSQhXfqIyeIZv/Zxsp8o8cNOaHNPofEy8hQOadMyKTs7IvRZ9XqH00YDzo2AbkeCSN
lKhMMb+6zfaqcZ3sQZeJEJCHzwXSl4Fwz09UradQS0Ni6A2y7KW++/1/atszXoCrabgBq+wydXFJ
4hqTOqG9Ymm6RWKzYuE6s4+pgsyhtSYYCdSYoD/O4u9xhsbs/wrl6RyNUEmvbKT+wITXIUWpXtTm
eeZkg76q6nn5kHALHVzTaNKj25KTTJ6PU9kCCy5mBQkCu/T9PezU3WtoAa/hvq8pSv0RWIP589Xg
fKaTibBtDkVn2FQUEMwjrhDEOTmeMnvSDmF/uVE/C5Mvfg5f5B4pluH05ZLiNXm8dEiMBdl5Bu/6
v8/c4JkI0Oqu52k76kOwe8xerbz5CuMonAXJVraRSjn45eRkR22G+nnYivTkiRovAEBoRrWce62Q
BiCJWAz9r64jIg+IiaHBIpCeTln8YJjzl7vo0K+hDTMgjWQeb9a39fw0I0zOA3Lb2fJTDN3TVUz7
NTAiPQ/aNmpsaruWFde9IkTlV8ff/5LGpHbq4OYqffaGyAuWDa6jiHM1rQb30SHEY26/mO9aajFA
44Q84rnfaaOxi3FIv3OPeUrhtxtmXxzp6LGXduzqwom5Z5uChVbSSAzcXBeG+mpflu9+WE+TbFzK
NQFPVTAWoRKJ69vWZuz5gJ3OBbQD9LUwuzrxUXPUiLqIT/iWyeuiEwfvveCJi+Z/pI7qXvGKZea0
urUSXmUiMmywzlAcVb/U0A/9Mj/vyYSKxWC+PdRFgQgLky1r5zLUXoXuRyALO4emuWWDh8MUOMvS
FUudIlLr2QHhvQA+K5Gl/BwaVugGPQU1b8b4d0emU7/HjiBjzQiTE98j12qVdNC9QDUbKCi4vVNe
EVI7OuachyD6ZlskvDJWn5pnNDEFGy0t7yGr3eSOsL19ISysd4YIyun8av4hppxs1b2P+AlFKQ+U
irQUiMrFoIn4WPu+ldhxu4aLHSJKy+x9LFwRL1QkWkxhdNuvh1JN4jw/GC2Sm9qR5sue1sQJ4VRR
cw2gWrPf6Wc8pXAlpuZKBc/luZUfAxnRvcx+nn8Y4Uco39JpxoMF8nt6ty31OB0cGaPrDaXHvuSO
7O7eX7u4iow17WPTv31YWVI8gART6968DcBwpgqiIQG+QwxmRFqWzhkPWM3ifN+G5NnYOX/HHmK1
WEQeqXKK2GY6tATYNpaM3kPrsHUuMNcr92kr5U/Xb6V7+bdgDsipEijZeHOj6sx+ohk4938wLzFk
YTP37AzngWdS60qZR3xjhHsNupxF4E3A0NqaVDXKv5eNSZxCwePH2kOq/EV+ZWPwAE2tN/NqJwEH
tRTIVk/GC1xQ3w43xWHWdkgmKcVkx0/rR5IahLPv9OgWy1GqtIZntb9t8Clss/tC2lcefaZ3BJmw
WvHJyT3lPr/JoIoGUNhnAGtuAgD7wlJTdpG90b62dGzyIJEvpSkZFvfMWpa7wFMgULAzRy/pSBK8
Ctyzr8shBGoMdq0eQraW1xLcy8mlqkORmzi03lEGNPnOQAPGfnHFrLJ1dfPbH9FeAgwzxmXgbl6V
E/ZomLlObQylTeeflRfXuIb6WGkPwZsxeo+W6Lxhd7xRQGaXs5MEqIOnfrJNg/hYHAsFhzyhnYS5
GNt9kH9AxnYiRvNnY091FdAeuxRYokMH/kC9UuX3/IKf0hLrDVGii6omKIoRb+GtyXd3GFYtBos2
DnUGPKB7A14rbMzZkQxxLBIFGvDLRruJP9Wf4Y1aJy+NMiHYZS0VXpgJlQ5/A1bUQiSadU36QBbW
oa/FgxnH7P1lXEWng+L6oaFdpMVkCFRLbdpnsHop2bMdXiDd5e7Fo9j9sGzJ5U7C1pU6AAoG1El9
5cpbOM17MathDgDVOaofQwQp3jX6GewCAihPmpSKHygV2XNgHKHU82WxWBy4VPMgnUXzLlScbyPc
HwXgI8fsDiYbT+YRSSFgN5PWEsmnFxlyiiTGu+ofkAyws1kNlyesvQ73aFWetKlWjeQVoDVYDjY3
2MjUUorIBaW/OyoIDxAb4GASIlY0jvyTkhqOmBU9/vxw6cRUsDG1NZ3u9g7w7QGKgv++NHdDFH6Z
g1fKq7TDvIVBka1dYZipf8xIdgiAYEEJNhnAfrz8/ArlY2NPoJNa853GjcIuwkA/qDa/vRy8O1QZ
OhxmmT2+4rLKgApkF0J7JQzHlddBGpEfYvT2dCp+eQo3LFkK1+3a19HGo+qCTDsOPDKm6mh54+Hl
4WEUywKtT8NEAiyppldVTLlXSRKb4UGv5xONBprxs/x9ajmCOmMHXvz1eSCtDxRLlc64FPN1APhv
U9by5/7sKBc1mKPa6wwo7wr7q2DtqXGaw9Q3udztBQjiq3InWwcTs75MkqKON28UOe59XqXXjxza
I2ruTSrtoXivzxhABgHvJA8PkVzYzU5olymQ1lLA4aSOWt4vEiLjJdpOj39CBxbqutGjR5cUVhqi
wtxne/8e097+D6uOH4n2QIRYABXsjX6eheJ+JRZBacjNqSFyLWFvWLWfCEHCxhXcjH2DjXqVrNli
eMzVNpRDbFFztKzIwbOX8/wRqLcdiKLdumdoOvcIhgqn5VAFSVMVubeINVA8zgJ+stcl9RG6LTEX
/Pf9pedVVVrbwd9OvvbaLaOtKixsoVvOak1KgyFwJ2byN5hZTpeJ8OUwuIMqke5uWNFN2efyt7El
uj3HWO1xAGkoY9VlDXU2/FM31v37N3tOxTyWmCms4HPuFJCwOwuWBPOk9iBDpzA1UkRVc667+duP
9dmJe3JzDqCV6gL9au2g+9sHKs52jozQVnjyg+jpB+aWXZT6ruG1OUk29Zj0OW+yJ/45ys8djgcV
MeTJNKPjTw2A7fouuIh6gVi61bnjPdlu/YyUU/sdc1g1NJ5uvB6z1/O415J7/JTNY/hcJEqukyAx
eWJi2YaIw2B/ZVQcvEMMsZfrF+Z2aAneFWQCX1TzfeAUno3dPrMztOtvqOQaIMkm4yura0yduNL5
lhKZ+BLOaMfdLTS/yyh44ZJm6kIaSTSTwlz9Tx9wvHx1fNBBRPSMPPbJzkXzXCtXWH6fcTbpyFYX
BHZBiksNJw3EUpRfiTDqUKi5WMxZ2Dmh24UVN/vBuJZe20MgBppI+QI2Z7ZrmuNGI50Lt+nhBJmt
2yRh0vIzzCaftAwy1BKgOKkylKPd0zxVHwL0Ly3hcsSJvw/ad5lKVI10SjF8aqWA9SnIo+jhqTw2
Xg4UkmRYx42gMYaj2WxhPeP4JNtD+rxQqJvKRJXE+pm42WPmjRyXtvSpJG+WlmyB6bhrPFCP+cLF
X/kr3JF/shhg4nzSEt0pzvH7zeCOg7Vj/1VGql1UjABHmItIG/a/is+knOpcRe9KHVFmzUc9L8xD
rBN80g+TFSDc5VtumZ/X2oZFSnNBm/uixg+Tv2TJoFc2I1B/dhPUVenrt/cvdSZAZDSkgczgh7fz
08LmAqbQhAFmocqCRmqotRPrzMyXaT/bvuAJlfyXlcNknoAXsV+Kp7vaHfAsfv9MCl2WsqrT8dDt
WEuX2oeCB5j6korGGZmOdTeHTghon2CTaWSpk29XOkjfsb43DeVgeDFXSnr0bdXgyZ/zYKhUd6bS
ogDuG2EKJirXwUs/m8exVUPRFwgqgEULvfDJJ6IldZxAAtHWylyQSphLN9w0dlXnqOghk27/Cy7w
50lCayRpwl5HEfKM3U+F8GMLBRtBjecwRZy7Vf4KGOsgrex0V1QObOlxplHSwYEGrOJM+uCiPlLj
oLemraqT0YLczNtPLCNx2iMs4S2Dl2IuLBAfEtyUlP+NmJMQ3iGJTJO6sP97Op5Pke8Uy6vsp3Rc
f2P81bu45coRpY9OoDUbXq4JpOETXSBll3/+t/ibATtDTduzefE7s3C/YGXBp8rNA5A3Z2tBa3Oq
qTKpG/ZbDKkyYxuRWtrtNwWUByFp9n/X+NKmMGhVo4iCGRtc4wD8VZpPQtTdmiIsn7Lyj4o6CQAU
NdwhPTVvC3FkGq62Oy99mwE/5Ur/JDqi0ngFUDhQroDG+wUI5glwy3yWFJGWvwVDqBclQ/Wg/JX0
nW1GHRsu0zpBjRVOaEljnBl4LuUbpwAiiAUJF73kYTSaIIy+ml/ZOEjlUwm4yLQGpj8FOUcoq+rj
Avx8AvUU3EEhRHBidOn9uofSfloFO9nqsyeoXc+CG0q42xpdOgNg7K0hwB7EaLmxy9QaTkkkr0UY
RCfdv5BRtLMhkOXqBSJQXpbZOwwkvf9eITYy9xkiTHpEFgGczUFpZ0pt20GBotA1YFXAEXSOpZY2
YjA294XuI9XCXe1KZD0lKcbUklbmxsFIwbp4w+DuQ2K8eq9txxwCmSnUYbhNW9buSQVe0KB6nnup
/PDb7e3tczRI5FFGCWIh4xpR+hKnfUvHPojeSosX/OyfYm7un9FVS+IRap6N4bAaKAtMTC1MAW75
1EA4XXUNKt0w+Y9IwrxJ2tYSZgMmd6sJ/Y7o/n2fhJoSzkYnqx5278ZdzOBeEL1HU91OGvMhJ37X
2d9zTRXWBuYr9k8Ckm+/MKKMKDtroXrzbtW1bMDLgWdOQxb5p9Xd34Qgcj1o4MpDlEl3CiPvtzdr
gSabvO6z5Yg1gVGD+Ghq86c4rfgbtdGfvxfgSslpTCp9ZCTvnCZF17Lw7oaesnFlY4XpjAiprfYo
fRgspzRP3bJBrfKu3eOm31aJ8Qr38T26fNGWwdWNkjWnrCH4aodnjM9mDFMqlYoNcZ0sxW2Eh8Yt
I93VrLP8jxKEEQJOHOxQsRx8ZOk2VVONfeIIhcV3k9YUqpg2Wk2onNt5lguGxK21KleRUNXUg84z
UFd1FtDjjtCzV5GveBg0gZ2fBVrMbAkN9XGAdfMzS3O2wWaNxWvpUqogn6BL3fLHKn/qL5kaRHn6
aBGTelJyOxFJwu4bOWuNwEZZROkd1nElvCH+QT6jGdFI7q+njkgeTADy0uL4+kIECyz7ElnfTHzn
eVdxxvZPhY6tXiaWKq+NN4ALpJbAhmTPXvP/yRMTR92ihCsSgQdSIeGanJCcQRrxAM7RH3tN9Uda
Ewo9cgXj27D9ppEzqEp7Cza+VnmS6HCVK0NB6nedr9fflcymAtvjEQX59JN2tRETFDTopqD9NuQy
r2bhY3pCV1HEnzY3jBbn+6P2TfPsM1EopBWL+fvc2HcHw6eDn5yMFi5jHkFW8N9aDcIsSt70Gjf+
keEjARrWQAFjRbhTF8HKUb2/xiBRNKHOsG1EL4wP++uwSc/cnZ8KdTIyuS8twEpwC4c9iT7JOS50
MxgJMx3p2qmIoZHhEUwciE3oMFzbglPO7FBKdHx49U2875//ZxEsJUIeZnZTIqxzgxzP0Vqun0px
QZvGAx9htMGMS8jFWN83ToJ5IFonvyr1OuDwxlffZXd7RTSZzOqp/7yhPH1/bfUGQGr25ex1FV09
ISO5WHG94c0BDcpJ5dJT4j8QxhWnSaM6jgUViR3nbx3ciEp5QYeNMhtXe1rdLfmBPmGIfQEHzMCc
6aG/nxkoh4E0nbSo/oiVEwdXJZtruVDGgDy/VX+D0/LYdPdQp6tDy9ijdktbCxzYnLXcRtlUWnLr
FjGgu88OuEioLUjba94P0t7snA9U+f404/JksdkDlIJJHVbDbsV6PNybAXT8SHiaFbLVsxYRBq6X
AUz7jG/IHnC3zAaqFJ+z53sb+fkH9YIHxIyzi7Se68fhJUPePTI2TFYDPgdMxJWvVdqDpa+X3lH+
aYIiTraumB57rWwRxP5DhellH2afw01H072qvVI7Yn58fqewjc2dxlB9cmpiwiVZazmLOP6M2115
E/p8pFLAPvVY+syYFtbNrmWlVYNiaeqaiot9nYRBr5/w3HNsvExYurXA+o58dqctA8uRiE9Af2CD
4rNoN3KRcPuMiSJKRqIzf/yPqJk1L85JNJJ3l6gIu8HeO9cb7JkDJJZt0s0gaqJ6fzLdu0m4ItdY
2bkgEJby+YwMRoOOFMyKk+6fhRdPwHCoYq/cIt5bnPycv1aLwJyODgl5+Qi/LMpqfZaAill7Lsvp
kkGbYmIbbOTS+B8JRp3+9baOVIs0D21jKQt0Uz3NJTM7BF/r3Z/raefs80oGAiortg8mQp2T7tqq
Pnbs6vBh7cGtqCpA1AA3XJ+2i4J0ZhT/9XXJDwe6I+SFef8TOiJkT2qbOrSD0Mu6X5B1mo9Q2bIY
RHtMe+rbvlvWIkGkYr6Iw/3mvFuEXAB4ObsJgOXymU+fXO7tGv5JBRtEnGzbocpzH6fBxJLHjo8D
yAO/X36bVtVczNudjv4hwE/g/IG7oUXQJyz+hvibs1wTcllCffHFH7RJh0aTjBfxAyU3ieq1D9Y0
yq2fG6/Rq0HMoo2mPJGbta88D6uiecr8467zEdXIlLoXNzj01zxeBmFBs7gLNOkl99bDHp0kQRCP
Ektp98XEYzo5lSpaZzVQTrGq40qbd3+RWP0WFcTEt+V5TTt3+FE6QbWK0BY5zv95lbA7KBaM1mDq
DtVplE1Z8K9TB2YCvl+Jt8BY6BjFM16dt9YCMqI0q4REcMNHf6qBOowXlWcpsie4vGkyc8Qn4Lok
U0KGy5bSKkG59XX/llhRn/LV7qUXD/kxQLA9MJPV6XHXt8G0qfPBw343jG26msTcoNEaGPZn4yu+
95L/8NkJs55wb9dQn8858B74EQEUfkDGtR1lWhMQn4IMetT+Lxt40pUGySsCj6yhOjfLPA9NEypm
DCwISqCflXNx4IBam3Q8GiNwydmEEgy3kPvJKMIiuYxrm1hpizFj3pJF3M9MkUDYF1lPLfieS8y7
fvnM0J+pjOidSQbZf7jGjdqepqfmfrcrD90jJChhoo//9bfkXMHHq81htKjOC5aBrPg1ta8l2YnT
HOpykyr+815EXdEWqMTeBUXb72hIOiQuTWSYXB9dtxACgJvM9QUDakBMccFDjSmmsWD6ye6Gu7hA
gLbV92z1f2QhdaYU72u1Ps/hyvm94QqAB66+oV4QTEjaAXFTI3rfWBKtzS0HQ76RtYwnXZIlHZnS
U4asfcXIPuusdgn9lfiovDW6TRABLc4fyVxmLl9dvtQoWlFE5g0c/A8BWXd/o40DpoqM4C6CChnk
Bfs7SYCuleMsnsFXRyXRaaA7l31kIkF+jzqgQW/hKiHW7Xv5bkqQv4BfTAYytvEVpqhoou78pSNJ
tA6iNmHNbJwENqNDgyQ6rhuaP0h6HRAsD4A+Fag4HFGEXvo3cvV7ydNj6VF4V0JxIPlcVlkeYFcW
QSEkhifUOaPqgmYRMe4mEavbY11G2nVWLgZcm8uOtG81RpG/XA6FRMUcOw3gTwGFElZGSO2neYvP
IjMMocv7Lz+NO23myAc9kV1Lad6MQO+GlKUoxZBgo0RIQPchhiihpEyh3QQTxdt12RocReJk0mqH
IeQK3gssjVxA2UW0Geg7Y37wqtjPPOI9YQ7kT9Ipo7iaPpqwjig32/GqnOTJlIg8X/T17C5Y3D5R
Aaqe1sj/Ay7WSZd2aTmU1IEN1PKHHN2wL3G4VV5vUWbIEjH32tFDXm76/1C4NbsGbOjVmjb+9Ez8
h0ZXy3+bSzGCddtVthGa982yV5Y/gSMUq99Mme2mMAHZl/fR5bGxzJGb4dn/FYU6MN3LFzgfVpNx
scS4lrLB+iQE/J54FgRMBHPSlFFFvm/Xm+6vaOmmepDyzi5RYGKq2rtGDGwZprVEfd2mJVpK7mrX
wIB7TiRsBh5+hGTwM6BvxnSpdWMJnjf45f47Aofq8p9zCwAttaqWWQAp79GoO7zT7TnexCgdg/qO
xwZqNZXwn8kJvvglMKd13XIZTeE0z8a51Jplg3TZG62pf6OBJm1IOCowi9XkcX/7O4R0upgfbyZd
yqi0mG7IDu+dE9I3B49oKoDAMD2zvmaMRe5ro00G/INXJuRif50bvO5Kc7ub4XSc1vj3O3M7jBDq
q/EiTtZxPYYQitgNnNjXVpfqRxlzU26Q5rSVpWyJ1oHwQS9Wym7vfKvmlMvg02QPl2a5Q5hEbfjJ
RCWlxrcRn6r3LCmbDXlRybF5F2GPRtQNOLco5SGyFkjVwWy+KFj2OQrc92d/YUhnyxVwCihe191B
yy8ukyVRVgeBQmggiR9J+dIAaqTdM0bx5lJNKWiA+DN/ngqtq6pRHhSsVShlQtIiLT3lCkQzjpJc
MxxRMP1zHmPC26Ic7yGA2Kjybx95qYzRbFsWUUESgu2EdcLAQxq3lLkOiDp+42gkV1/8kypLmNt0
K8XQF70WZxYvqLzs265eXcnoP8SF+0vlmS3eP4bhk0z7jj3RvE7k2nI6JorE64iKBS7e9wIjYD6/
96mUCHUlnM2Q5VakebAtnWkOG+3bNAIrNlV04I5cIrWIca+IvC0alx5oMjHmFwUg44hdJSoqrSn/
nC1OT5NPNR1h/I44bPm3HivsicyBRSU+u47ZXEtyZryrn4zhdS07ZEOl9cbKHNqc5nsLWQm1ZexC
aOhpuqYeMcOmPfuRGqHjiHiEv4yD11wE7v41huSvQDx6cehT8Ah8mw+mGvcOblyfWq0TcxELI44x
00P57QlI4h/DlD7RvS6/giPfF9+eqXzNzAZOVSDvlzm20n5JDU0Vyi6nG8Bd3Y2tpi4drZN0BrvQ
4vn5F6sYEmGhk8VNDZJkZY0tztDCMsYFla75jXZJ8Ol59ccMWZUIGl17hMOir9WAuzb+l1hm1xEN
Ya/jbvihxhdN+uD0KBLxkwBl4DYciLFa1iJnlx97zzIdoQOlbv0ES7PblrmksctUFaeoBZ87Emf8
Cetl3E3SaEBQhcKlMBUqLCKU40pPSZEwhTST1JeOzlofBhgXzFHvNPhspkznzlnFww4jkVlM4RQu
EipIDuhNBpptcZbd8/2eVHw8YZl1/X6pEv+bR6iv6T0NX/dt0Iqa/nsTS9PWjY0QyqCUmPobTPZr
MZWuDKxe5wB1yHKgdkW4RMiWsw0rH7c2b7VF3JMQebfSgzxy7VIex1oJNAN43OHEYaEl7G0TeC3p
JNF1d7vUoowKG6sqf49bJJbADAy/Y75zXzORteP9qrExIPLjtvsCtV5avgMZ1JUt265Y1EY//gKT
jDGg3Iy/IPRua8cp10C2vZW99sGO4NaaL8VRAv3JwdWk0bo39Vag8F/cOfgD85+EQaTvtmeNY23W
Vy8tp7SR//xZDLU2FZaUo1eQ09NlzRm7O73MArFfXfeDcqYXWZtebWoP0yT4lZmgtBEw6yAHm6Am
6xHn3vHze/bL97+KAFikxhXvNpS6giA5tyU8LhW7h+2ToFORW08wcajwuZbgsNFrP6G6pZiRy34H
5lmnTkvWL251Chv9a4qWeZgPHv/AjA2NxTnGB5zQA63rj3TUsde8LSxPY0HsMPo/eB4mg+etyOnK
wFlTtekQdlP/SJ96AMNcz+JWhXv69BCGLJEZMJH/A9Di/WKPUPJjvB95NJPlQ6lblqiUjcj/L7c1
BDKUw1z5FBa0MQzBIkpRJHRnVxOu/8e0M2FLuSwA8AYx6OS5kmNcNN9dLCyprnLRCJMxGYPAfG/s
0XUdJaoJkvVcgIvK2k0KmSquxeRI9F7M01UEeYDQyMgZW4b2/dlS426U4Z8LvjV2oQ376atuLpRz
D7ViwBTAUkZQCmIL5hRyWR3jF7GiFQ36h3nJhqm1mitYqinXMcJ3QP+PoVIuP8BCZCMXP74Ujol2
mj9G2eZ3eHwthQIDfba1fb2wtpKuudsjkRHuLY6TrjOtBpyoao0qf4lazoWBa1xkh2ZWbX3ir6ag
LdeCK7pSPwIIEk2hg3DT1L7TnAUh+X50+D7egU1YJOLs3YzWCmBO8+4Wv+e9wy7/mydA1Vi+TpMD
apRVI8dK6VYuI1OCBl2TJQOGN/47j007jv9ucQNkA+qmuxjpZeavOW4sNq1HXG32TuBVwDj/I70e
p13NCnyj6HnNOFApCjpMJUY9XQMjZ9WihggBV3ObZXpvRYwFCQgfsYqsyLeZ6S+ZRn75uPTFJJYT
/RW9nvOZBxHzBdK0Z6zpJizdq8ntkxQM/Xj9p0gbYelnwdjvi7VjLsUzZua+Ay2ZA9U8i1xPcwEo
DxYBXxf4JqN9dTMB2fITgxnqnYZzLdUU9nPCqrkOXJpRkAesm0CpvwNB+uPd/riu39sMymFqtetW
E98BwWSP5VmzO/kdKVMLEjaR+jhB/pGNq8vAa+Jng2nSZc2/DXZB7m7w1ikoUL/XkWsG5ZhT1IHU
uMgPoAd3qskB5fVC+Q5TVOC0V+K9KeK6Z3Xd9Rj29egX4DG6AR7D7um4GYJnBCurYnuoVnqtIf+k
+YALf8rEIsHAx4L4qVQdZZpJu/jyIWeowWA1Es2Jsm14Zb07SLxj3HwS7BvRrF7QgykJrWJme25h
rOPr6gA+Shzj07xlAmhr7hb0KA7fBMNoWcCHxIlLSospkme8Qzf+7brOfijmPjH8LMJvct3efvrR
SccjttVThLuwPDWG/jB7XyzD3DRTWY7ZaNSMM+1OzKH0HQTq5nYBfCvGGfHEc8K8cEs2StaIiV+s
d08TDTWo+YWWJKhcW6qVk1fn73bdAlMNcE/Ki+WazhbO17IPdNWqhyW81tiQ/SL/k8jVRRlEGmLJ
ABFAm3C6EwuMlQ9r4HXg9XYfO2Ivj5hNFhKz6AgTWSMTHn6qVePbB2pD1Y6CG83EuoHWsFbL+P2d
WcE5WKye0M7DvtpLj8npKCbTKt8p7U0QV7cwhrdr9hXwNib9binb7JMET1scNxTD6xg/QeA3SplU
QvYlfvXEha77igMOzbHnpA6Fv4bX59q/HL69CO9Wuf5SeKxJF6mY/f1kz962UqEKFiVq+Ryl2Doi
za7i6TMp2nlvR9g7NJ8YEuwHRMmukz7xwq7c+TWhw7/sU8Ui1C5nccgG/Gm2u6/NsxM6aknWRcoB
VVodHb5iFNbvgD/yBGOsTDTAAhvfG3nYk6qQiqBUTzci2xZQhBgPCadES/NVlnwlbQsX1rH9u8XT
DzL2E++uAZU/8922dgEhupDcFEhQueGlwIWO2SzAm2F9ertofwvleG5hvORwJd18cMTU55ea4bWa
TYmN2chnbYP128VXE8kjsWLHjGrGGigOTvD97zqGxAWaOmcQmSL5nztoHzqkLAfktSJZpP1ipfO+
nYWNQwCWQ1Bu8IrsiSfv7oEGUPusrJtAwoLC6MjsLMRHtiRH5IbbVA1qLh+f/nzuRkivAfgCxUjW
3Hq/BodkYkPpFwF8/jJioDn5+88QmWnEJ9GiPNW6fRjYIGQmn+ysHaU7tZEc1AOlXymIah+1KBYX
n3IiUAT19OB0T56uwXcvcUonYwVJHgDPbKHiGKhosvd3LVT28GN7vm0YZVLKr2SAF+mSfugfhM4V
8Li6nJSQAvJKpQdoxarLGbtJLSzVn8rRZZivOiWVBZrue6TOUZIUog70F2X6ypChvJD9c9pN3++A
dNSjd4+WhY5dnB0Or1YoI2HF/bs9LNL6xlNruB0lY96gN9JdZ1Gx1SvAA2o6sBeArtF+vkOpZOEw
oYoC2sXre+8e1TnL7WBRea9JtBCvb8Vqy3VDD+KLQyyNETPFqHx+Y79mi5LveQkjrHYP3mO9n0lN
QWIO4ILQp5xWzgZmad+Xmf9PLWAqNPti6D/YI0BXuG4FYwGrgGWvQvGVJ0lUtu8qaJfMSFaxipIj
6TbGcN0JoBWQZS9hQ/cn+PjI6JqJO//5d2axVV5kIwEWkaNbsocGHVnxJNmnWEZiebZoXq48uVKU
XV8IgkvaQdrC9AVyKd3WMgB0AuNYIINHUcvDP3IHVkEZVXriEMtGBxRY+9RRdjnSSMLEfkNJNiRM
3ZNN/XgDZNeHKlGR+tFwMBWQbISQoSHw8i3Xd36E4K+D7r5GDUwoWhzrdQXjxtVDtwB36rWe5M6A
zhjRATLCft0FEDQbepnmNjmgW6Wbh2kdeCZV1AeZDjs7WVswcyffFE8rXlL7YR7rEfyZyhSEHoxG
IX829U77Biona1Hy8Yby0qSKYl6I1v/TYlS7JvzWOUD0FwzAj9Hcq5Mse7yQ3+uQl7cXYS2lpeV9
MfYVgJKeqeNcQLvVUSWujAgLrKwixBnLvMsS6h9eUomKg2OrfMUOgIooYV/2soBhG91LwBbwSIYy
oP5Ioab6+EhxzBaSYKfxd79/t286UKZv/30hBmeaR+MABIZRRuOpVXewyIZUprqUXBNciMKxpRRS
4oxORf4AmD5C9tCAA+Nda0AaOn3ZGsFK/MwzK0xQU02fztma5x2uRs57vexyVP/RWzG8MG2106CX
3nXP0NwAJzJeXDowQWmx3lRr9D548uKtdi+vPleL/hV6cqAfcFMtyMUCZE2dkJU2l3BAicyjsTSh
f0hHAfdfXXG+qxKyG9OaiLmRRMjrZ/4+l+qz/wVZqGLUUJtnuP5XfDskuSapKXAEIdX7tsHNwZyi
fwNZqPtPJFi0MtW+tVPUQRcq98KaSgMTFuIaSdMa8kaL0TzDcqFQRriCAnXHW3u00YiSdCuqDIoV
4DN+OYJLMyqon+ftptwjZ4dbdbrpwtG4hyELmrodQXAr5sB5fFhhRen3nigLXsbE7UlouZScxe/v
tT7ahKDGjxn532mZf1039UOEFWj3hoVVVGy2G3KCPjrdlwBrolQYXjE6pxqAuqoXbMSKggqHV+DI
wgEbljv5DdH0/iZT34kJrOzQ8w3h7/G1AVSkytxOm4bP9dR8rqfmKBuymDO8BLgi05OaoNyZYlv/
saujgVL1YLi0ShP3cav5zQNV3Ls1ytLk6L73NVCAw/tk81l0KIG8rPZTo4Es5PjCTmiXmX/YKezz
tZzNPKOLg1jsq/55iWZO7unkTe9wnxUe0xFhP4qHA6z3v0+hk5W7w3e1u6U8m15cGUc3/heAI+2O
Fj8xDilxib6ORhIwdyU8tx2g9pZcBzZcmIRg3bljbVvBKUgt3LkdzGYhd8lmJ4DaiNmWQ4yGWOJh
cFDQYV9dSietRbpLSnDi4GdqGhomcuFH78Xq3GdWiHdt+gp27LFiIL+j5VrlCqUFekE9KhNmHf07
goUE0Fcj22yqqIs38ZSqBDawQvvmJTN0rmNU+b/DHgsPsU1VZjlZSq5Laup3ud0d7sqIcrMcpT7a
FyP5iI0P5VURro1h9hGSafovtHwSS9I2g5o2oBnCRRWyLL/2Gc6uFYwW8TwUJCDKq75teoA0pHVY
kQWqOn4wgJZsjJ+J/ZGFhfieVNI4HHsBuWtDYfamadT8xojcZGPSeAeDgN02uKGOoKg9iyjgzgkU
3ASUYEnc1/CXiteV9UTuygo4Q5Suj9WusUroRfx+H4fAN6nOPPObAHi/e2sdMtOKycGQRjxQwcWh
TDtRyeE5krP56PzjgBFFO3sbIF5kKksKqTBWmblYbXq0oUqzY4ovcna7tW3GCe3xXDxSXY6OkuPp
C/Wr6OZbFVz5j7Ah0lxC9/jmKomCDrlB8ab9xXmIOI6Dj875UOZwz516vUYxWXlTJMjiAyVC7vsE
yE+LM3ex99fyWvFAngSwq/4RmeadgDYI99E921TdRjOG/gxUKkzi01fExaGvOhs99y7M6YviPAee
8XSmzlzhdQ+7pkAPIHwq94UF8p1Vm7j5b2NaGjhCwW5JXNmQS757qljZhP9mgvZqUeh981OwiuGM
TTeNbnJpk+gt0dfh7dSEzp+Qr2mnD4zGxppyUiiRNmAJH47xKXHvVCYn8BHDOtwpJLjfapqn/9YV
y4q2G9HHjr4HFNyJvA78PJO8rOtuv83dsd0J5c8S/jzNTZGj4SjfpiFw2o1K0tYa9m/Atmx2RPP4
NAajrC1tI43cssxGqzcg13boj+qDB2r7CFmqIcUcoesh9LJtKmHps+7VXXzrowJNAxQHtoJ3yBCW
XgKL9yqdtBEHdEpckUmoh/IqdlRhbckW8jqTQ6URa530880lYlbbCXLgxB1XIffTrdRcMRVpUcpN
T+7aAaxD7gioNnu71iLjW3hW/jTgsCOXTvu8F3rFQn7Wh1X7BlAGurh/68BeGbtbg7xQ+Rb+kaYl
Sam7zAUAdlEKIVYB2bWzKwcX69aT6hTiO1Wlq9Wa7U+IO9EQ38qbFen6Q3Kr/zx5y7B4uA/hbdM4
lxl+OG0wL0eVOX4lmla3/6hpialjzp8hgn7JU9iB9oV94z7S+ORGXMvlVzWwAxa3Tlw4fAl2rCJp
8CRtsoIEihdtMreFNg1RlU2JPkIg7osQ8rc6+Zg0t1sAWJeG+1/IqoA2u5wiRhTp48+NQl85Q+MV
pnjqS3icAGOu/utNvswwnCeGxfRBKExIVrAcMRQH36Kp+YZ12x1ms21sFmNMqAoP/3qN9/0mKs8/
8I3J1RWwzPN9zIpjrd5KldrUeNeMGgcmNRGt0rAGML3vY+aHm+Y9bL9LUJbv43ypI1xuZHn7Mtgg
hp3E3kj1yj1Sg9iV4tNnnErs/7bH5tWk4sorOCkGP8UIZFR+eearZbAQElrG10djNW1fET2iD5fy
DXFpogh3a3PFH8/5d2i6zZw+aR8NQfwWD2ZFKmH2Ua64jzAMkENROc7d6TOCD5GEADPe5D98qUoU
+wBiU8Mtpnu7YRpGwlkmTB7DMxTL4azySwbyyUpVwvRHzcXLJuwrnmPa+bwLBB0lz7SgosfsGIE0
lDtYgjxTdazhytArB6v6YVfn74PzkYN94vHKP16lgZNbWqh8o+GzwK0TDGJ0/YIV/TwMeWmhwDvm
4VKBektBdG7v59oTaoY+Sqh0dZF9Hl/5tZJR2CRVeVfDQACUjba7IBDbxMRodsqsDSmDnbZJHs3x
R6ZpNDw6lpx5T76Jpyx+lokhdMafd4LjhdiM/pQU2sWesxWSVmvKM/B/4ys/UwxH3DnoEuiPIaOP
t++feQJeNjIh7+UOrXjstqfaI+c/9e+/KPQsHBGlYbhk/k3TzvmO4iVHe4cHEN39IXKYBZXWkAn5
DkN6LtvUygUAdN108LpRCedtcAI+yt/gBzyIYmvXyesYa50QF7RLXtxIujPcdnaYLifQQ1CEx9DN
zN3A1/L6l8BLFAQ1Ki1V8sp6rcwiBJ+Eob18tgMmUpFA+657FgVLaxBuFnjBG+12LoWS5Ws9coBl
kMem/sGqxDDQOWkrE6RDckYuWl2k5Sn6tf7NSXY55cS1mZt1BrVuFZCftGeVZ3QGdTEOpR/oDOhg
G6crsq7JNPhkM/+7MOnBKZjrSEMyctA7+g/lu8AZ1ckfELkN8W29VKuuk1NG5b5ZEp3jioYnKqXt
XcwI4bd9Pi+POOSmCCSW6RvoVY0fp0CBhBu8PCmfo9FmRHUxbEH2cx9JaNzoethVnk5C1bLy8SyZ
SIDtB/Dy4G2pDo9FniooSGbFNsbIh3O6uiDL3N53jIxxSKqn8+PFLDanxzynCjgj14aJXskMeQsl
yGCwUlZzqzyA4VaL0ViRnnHK8ZgRX8adhzvy2tMaJ968+J6t0IlO6DH+bM5GaLTtI6F3DhQ2K6ge
bcmNx9D16z6OPSMv3xmy5TvV++afuAUzpduXX8pnli04Bq0saMCMY1JM9TZky/O9fWWU/uiVJRf4
wwBkP744wV2qSlgkBabgstNLj3FdbHxBflo1A+A2BNl5G4gyljInP5bMH/p59lM4FAgR1lek3yUq
B6WtfX4G8C1LdTn8NdFB7ORM2ISqP/bMc/ecO4B9EFZMCTj4TU/nhHOaCVU8Fy9nFvpj119XnZiv
AKSYUdYH4vtG4FL7xyPJ7mekL8vyVSmvJ4xseh04YIKX/2fxf+BhvdlVaBB5YrrKXNYFqiTBdHg4
oltwcNX29TwQXUtQqA24NZfQAzWahUTgGBV5oPU8TQt4+NgtHVRWF5V6tEFugf/9EUsZwk2xYps/
uP95IUJmOlEVkBfHhHktmW3AlO7hb75gexbY2wiFDcjEIuY2JBn3IN5yhwdl2LaaMZ89E/cRwt/h
JYAjAx/Nx+PUvwVbASak+Ya+4+exzsn5a5bY+/oQhcRKDjPbkAeH4K6fwyIkTp+55nV0xVuCP38G
Csmm7ifCOHUMe+7wWA+xr2djduJJr/KmK/G9/Qf3k3K+rIlHz4CoaJTkAhhUZZwU8z5wvjXpHME2
EOYl6DcxGrrMUhRFnkW9qe0qjrvpqOFWOC916mHNu7DN0T8dayGrHEBtiG/R+Dlnh5k+Tcw8cUBI
gb3PG/2B1LCqjflkZt27kICGDPkhVP1Qf2KxPquu5jC1jkzrp/auYGm6ex2/+uPIuX/WgxAkDzOa
No/2sR5y5n2JkRoEBCpUpL0ka72bTTTdTPpOi7qk/qAr/z7lRhITo53cLhG5Uj++Bj6JvU0zqUTi
4PNx71wvnNQ3lFNx4BfYgu5X4GbBH4/J4tliHhL38r38hxPNxUHp51GX/YdkZRaHcFFJBjTe/cqZ
4Szbay1EYCbwuArKtKMZUP/Uxu72jfQj71DG0n/0EegIbmZQSgIlImoHpw2m98shkogBxYU2HnOY
MDHdjMIQ+LOEuH4nOV5v8u7IC+SPnm6hJ7S7JnD9AothzA4TNxJ6r2v/O8oEfCkPCYWhZdcssXQC
V3t/Z93q0nRzT9wIS048/UW9/DQYi0vAgbZjYbRCXfdE6vb0A8R/PKr3Wf6dWIqkVaRPcYkR7H58
YfuShuGKEsMwLoD4lL2Qf3pf4oQPLEvFll18U9MRpCESGsoTH8bwe+++SJ3qcaZce8QQPzJ465MQ
dlffsoBGDNZwnY8gxw5Ju77Zk3C6Q6EpWagYJKG6U9qrIuMWccynnnl0LNMyBNxjTPl5b5RWx1p7
yUPozIpID4HSqFCmzziEsRcgrd53G2FmPyNYqJYy/9eNIUggR3TSHQEugHS1EWZh8O4ZEXtDda2U
FGkn5j/OASZbku2y3YpzCHcD6v/jUEvAl0wJrD7xIAylt6TLKRinTh2dd27j7iZzpcq2gh0uySAQ
WxESHFTUj1Y6JnXCkaS9vjwtnSowA3UHQhv3Q3+40oIOquUjY7FAN3QKjDXOEOjquaWcAYjWMs2W
Xd5e1IFX+5WjEl2IBf/FbRFyxLb5mSPtZhFo5wZdxkLRfS0hFY/bbte2RhWO6abIsMMArGo+EBqs
mSMSMNqAKvXT2rEh+szK30ZWplITsupckjgYQXrbrn4jbSI1LmvwgV9XeH7qERpFBUgbkIwHo/bo
oNMUHVDCMEKfcih9RcoGwuHWFE0xlMdLEiFdJTt/RTCbbF7GJMUc9SuLW8NgFQkfxiCSCX6tto5X
2n6EwVB4ykGLwcAX19oeyMhSHFgX9iBYLuNmXV5I50MiBaA18t5yRAnbTTIwJRZBdXC2T2CO1H5A
c0vTEN3KkX+xYwxGSKSzeIMHlyAo1YMe/XBanmR3WMwopMZaSYXfJ+eOUQbcjn1Q2s++TNT5B6aq
ObmByipDsKFtvfFJsRkgmsOlOV4RPP9NgKtdfCSU62goTM4zj/pLDzfJPo2xQuDGhhD7iVt9IzTr
791dpT6K7oghS7ncCIUl4FV3mYTkFwFSy/qpijBvui47giUwf1SDlu/liiI9sIFh251W1PVwEqr5
gx5cCaPARbDy9QAVE12G1R+K59JRPIkklNyeaT/J8TmL+aU4w4vlqeT7xDWsq6EP7Zo5vXd3Kflf
5UMqWoiX0wwkiul4dcJ24jCaXJ+R3yu6STHc3HAHdj/pLgb6HK77qoGYxkIO9zbFc0m9xSLsxcyJ
l+WeScNwNHs9kiloqCUw7QcNV9kgCmK5Cfk8Z6EMGwoaGMWajEDt97sUcRw0InUbPdWn+9I6tKyI
8lny9OehUGe0m4MpAjR4Tp2v08cxD4bGIWZ1eFMZN9mnPnjo4I/oR1znQ9fuyif21S7yDxOKgb7u
NP0hS/SEkQW0SOxj1qhirmIWlvX3VJ6qOD7jol2nEmL8XvB9CPzA8N1oQOkHBvBqM0P9h7F7N1Dq
Q0O2QZpmMO3NG8gwDSABKzBVbM39dwpQrv22/XmlX8ukCqxI1ONyZ5CF7nyv7toAzgwS0xpMGgEx
56TWd8iUy+vq08rGhwnyBw79xHxSn3zsTqfzQzF7PkL/yFP69iapp9L0mzFJrE/VPyHa1fiS/Num
pgzDd3Sldl0I6EBGxaudiL8WSjl9dJVyisT4b/WrndqZGzzuiA50q2VTTt1klr0dDwlJucjcvuXc
sLKJ+yIjRzq5fo2jgCfi7Ki6WjMHAK+wGH5YlxXDtqdrh926kMpe32w81px2Z6q5aUWHQiz7EKaF
hylld9m2BLu21mg0lRJbyFQKBQsspZtTf/rNMp2bQ0ipr6lZgsernQx64xtvmLEJwkiezFjV22ER
TYBoSK813CAmt/l/F1RrJVJYjx+ry9hhZTbRAbrEEuF1Te66gCJd698G5KEJKqpkYVe2Nnl5uFDg
KiiiBKjRhMeVTLLcSoSRxB/PASUDi+FInQ7UCZV41n2A8JUW4FVgdhPQynj1QCMvaXg5lhI2y2+2
bD5DQg7BDoJ5Pi5RMFr3ITxITDQSY89bC7u0a5IShE+Q3S1zJsbXEeCMcFvo3TzEU2tBij6DHl50
7qjybQe9NsLbYKETpW0KTQltO/1m2vo59EL86BjqohjNymVD/rXBHXYB8+D64BiE8tXyO++TA7DL
N34r99e7MncWLkYkl2IqlncTZ7uwrL2D/lC4u4bmXWGXQb2Hy43EZpm+xEkIsKiFWsUIJ25RVhIg
y8Hg40MzCLWd2DPhhdp7EamHu+a0ZSSA1R/0drX705BhCJLZ285JHaXjDdOdJo2QDl/XjNbMQR/l
o7Q4zqm2LkehcWspKDAcTq+Dj94c7ezr60sSnK3vDFMx9guFOCLeA700eNLeDaZ2MjdzwGyWEye+
U8GZxJc/S+sdvEUkJLhU1VB7R4yGPHklH3ETNQ31PjS1LZkKVCgyBHIz3nD7Ntolx7wpV/AtQRjh
3hqEOm67K4s1NSjlXCgDLBQxmzv4GAMUT8I9gn619xyyibSmtxJTgKnkPfBAmxTQIlWIrENLsBty
Fnp6F3R/JKGUapIHCXlK13B9jLkCC8UqyIcmP3mI7org6DeMb0ZxDHFp31hl0xXLaqJK6whNcp5h
Kve9Yz2yjdB2UCGfKbKn5YAZAmKdgDtaGEPEUWCBbFBzi/ZzHqfGBQN3tc2AUlPdYEgU/cCC068l
gfDYKawSps5upRxeldegwj6DxRTelmmNUuJmijUmBC1TDaPhpyp/UHuSPX/DQMIJgfibNI/snJT7
iniB2M/xYusfjt8tWoFAAW6RCKIsmaYQAr5vbNBdFenf31+hIEW7+KHQVM7Z94MJrzDWrlnEWqg0
MA9WVIU7v5H4aXeL9tax9VxfkjNNUn+rAQU8qAJiNHWANUvW6EaAyBe3fOKk36EXL5dGYT5Qhry8
SUea3tBsF2a8Oz2OHLbAjlMsNZp+4L/Qtj3W4jcI18wm0ySMV5knEM661r2yL/aOS+DMvgen1Xbn
YpFHmvnzdzicWT7MFlFCWl3UoLplfuWCAIe7k+vxqpPcVWvW62X+PvEnbMYPrtCP3eCqg1MJ+fFM
en5y1WQUm27O3xEljHLn8t2TcOi+RIXtkHyyUsgsVga7M434qhJjlE66zjCl2TC0Zc2hiiSKJE4P
YRJI0FzMSSIJSX25S+Bwp03AHqay5STl6pB7NEY1rqpVPvSqX4soQd7BO4iEByTvObMzbN/vdeaW
b/EmlaFnAbZ5ETooqFacBL5BzSkmcs82T981Mh0OwC3YNNuYOK+urZlhMz156e6/LmDVgvz/mcjr
ix94OxwMlIxWJ+t4rT0RSRAX94okUtPOHXbW7XWiQj+QMPINLDaC8LR/ALwGV3T1JBUjuN/oL3Ko
VYwWxvfpJlUAuc8FvEj61Wawm4eZFnAwDxDL/kiBVyx+fQBxZ7Zn2hYlQHJ1Gs2cmPnV7JjJjITZ
ekN5gjZrC+Yybe6/Vp1nCOpV7feaX51+JNcHu2wVUn5on7uAiOEdLqFX/eUAp1k94FoWWFjh2mpf
JpyXmxAKLzB+nI4T1PN9tugwS2sZYDt6D0w8/U4Wc/VBZS0PeiDduRK61RfOxsL+8ujW40U0lsSx
t4Y8o9elDeO8Ogkn4PTXqGFLV2HVvwlJKsGxW5e7rt+mfeVFtNhes1/K7QXguXn7zIxJ9D6ncm7E
XbrVbtYdIQUpjrlptE4mYPgHtSEb1xT96RuLxRJiUAMRZw/ZC6ziOlsCkEcTmRNvrr2g1SwoZ6qe
Ssq/eX0vqPG7rXpoA3nEW2n5RETzVMX08Dfs5H/p3qWs4+irVUrEmd3OIC6vXMa0oQDRGSTR98Wy
usF391PC0qQv/c32tJZpPreieij6Yr52qjCtGAdVaSyiAOMni5wmPhhsGb/TzzNZQHO1mZ6tvvzV
D5bq+GvOZ/N0RToRbJp8V3pmZxOeaWE1g02mkkYlSURNMQxgPq7XW20Au5waSLZ0SfkqC10rXpaH
f+dY0xWQqIPW2rPPo1DDQ3ML5OtHt/48ByYD/3waxxuZghWsxoFhT9v5D49yp5uRjdweR+pe2DUb
fwvmTDmPhWwaAYljdBId1tGPeFkewCRZTsIX6sx6UbuENBQaR4TD08iYzGzf7h0ESIsKIyzjYkwT
k3cKDVOl7bxLz0FIfWpX2xD/CefVtU0mX37HHvu3xlWTfBs4FsoS24dzl60g6FasqBCeElkyWzaE
oaDl88xdXFZJtYpLcDDWH9ZaO5RvHJczA85vvxRidP1ynoE+kAvMDqAqBy/+x+eicCYK/JKVP9k0
X7erD66hIkMpzBAsRZb12wFQlFtjpsc3hUVbOP/FEy5tEZm/lmwG+Oaypdnc9ElTVhai8DKZVtOZ
3SAspi3LW+82fWdChhW6N3nHcouFGuOx789ymefExYzUcaMAqCuz866EUHya5YRZBnfANEYF5aCd
ff7aJ873o6Okor/kOZYFoSxI3sTTnyHrQKbAEE+e8q3Nb3n94VwuS7Sch4PA/h1jeI03VQV5PHao
/RTjrHJYbRe7tD4pSzw3cyEHQT/aXx8wEimnPFBbKsLtDAVkSGO9SEuRwsEf8ggheIP+B02dh2Jd
vPBPXJM3goR8ARoLYTWinVsIU7BMAuAAlB9ColvdUJtXKUrHKc9aVnK1gG6Jd7ZawaqJOthWkNr/
BF6rndKtkYyjTnMsyRgDj9llAzctOOcGdCf8iRC2Coq6gu1PQv9YqgRY8be6TRQXXcKDVCTblMzE
/Wf5S3MQTWTtojQAKJJ4/CmnkFXfMrH1iQadjebVYxuGjgJks7ELZKyvqBod0jgE9/62sOHC460u
QpDgaWUlNuGIJstf+YfAk7N1kA5rJ8CFJjxYU2pRz1bMenIp3cJtF1r2VWIDQti2WzOOpsu0DUav
nsF1EPFSHCyItBL6ae0oZ6Z3Nu/GR5ZBy1n47gcMMqvlgNfc+AuCYWkd9RBJIO4v5HhGaQjEt5fG
yoCqOmcismUUFuG+TlI23uGokyRMbUZJSBDZhv5fzYkRfo5uUR01Yd5vtgy0Nbisu4LTSZ4DPRvq
VHZjeOPPyf/tuwqFXUr1VERbt2oF6bjNdXqRns2yZUHpNSixOc0V7gqwXGAV1GSpmr4UtajPIPMs
XHlLePnxHPk8d7uftVmqnCOoNchvRQo2OCYFAc8xnb2Sa++6cpk6A/1EoSRojF+e6sZIkSJDKyvJ
1nCLdaPyQqF/J+8Kf34jrfD8ljd1AJjonrR/KAXGQBNS1BFJeYS+TGNZ4Bb5Dxo5hXtLrKN+NahK
rzPeDIa2auz5V12brfhWBtCJEXqOzx/ChnlGe+ccwlVq4yGMjbXuzlDqdc2JIZENYysNI5oLcEn0
N1iZ8FOJmIBlgJ1JM7EN9VaYZFU3Cr3oCm8ghMoQR21BpnCy7hMKvSJ5ZQA8/wlnmhqK72NjZjbV
rmlUOmc6RlrqQMinli8m1t3yxCaEkjGSWPfy/wEwni0xYEZpsWoA85eydoQw3H4+VbjT8QlFbqQz
+RnhBs/GjN8RPbK9xW/wetOE3krh3DGlSU7SvXBd7TD5j/0wNA4kblzFAb81EVxW9Kfd0DK0YukN
wsCGvzhTVz72ZUnV+yHwfvtzhQBb/C1Vs0qkH1LIo8lGabx5I1xnH88Iq4g+snWHN9JBhcPi5Pyd
gj4FYZDXDXIdGefxwqToZplPQCUi2dj1wiRqgPQ3389pgrFj09VzyO2487CuHRagOLIE7YcklMPj
JNjjNJTUz/EXqpfFR1VVF9ylih1PIn9Vdp9ZqjKOQ7o22Q3NUfLVlW5M9Wt0khZ0a/RexVBdrp8x
rMjA3Z9KmDPipz1fW54GOLdanBxcERD6BHEqu5FvD+Pep+qsUar7t+HhL1Z8lGGcxIEPzUiKvC/z
yX9pHuQKaeu5sLPkqmyBpBhS6JDbijG+izC2G8N2Bj6LhIl0FQiAijp2WjF+6eETKtPwk/xSZp8V
n/9QjF0xopCbbO1M+V/3FocvfXriDKvz95ZzbvaZrCPQQhRSU5M0EW4QzYxwrxsdSIuVMobSV3qV
y3QaU2qn2z4WXG/j0xjMQNWGUP96m3R/FY3ksBqO6e47ZjdqmOnlyM2Bd37aDEiLkX1G7iIfC4cc
Oz7Rr8W7OaT7zfwfO/DNg89Qsqh/SoX0Bb9XQ/oJ/6dw/Wydhm2I8Q/fBC+L7NhJ+c1PFy3T+Ojd
fq3u7BNtzFGw0Ow26II+eZ15N0CD9+un72RuWmhpFYgXoEQjeQ8RriEyUWkpFkFRX2Q2JZeqAwV6
t/i81qYNGdhf+YFdyXp0v2gdO4kqOfjHVKWEkFI8gmSOr6+Lcj2Oz3XPyae7EDsZZiwoRE4bIgQG
lZVUoX0dm51KYy55dw3iQcR5VZxqhZw9OPSUheh9iBV+ph1u/ws8UVmzvSgvneZGSWHnKue2H6wQ
2XJD0maJ1qe26adNLk2HmmWQnLMl2dUwLn+Gl+OMQUJgc0Bc2aQO6nQpjo8r9pCmWudKKOm4O7by
DiF5MvmFqaIRLaxmWLuUB9loNolNflUGUNIBGzXYs2eCPlcBpZJhJiVs8a72et1A+PM9y8Pm9sLE
TxfDEHvDoWy3EjyYkuB2LqLt3ZufniSV1HhMDhDhmL5v0OKxOBJ46tYusQCVYBdqRsgSuF8ctHqH
iz3nu6t8NLiFkOiRxJcjJ0szcfsqLqrgJnsdk4jP4HqtJiWLi/erZCaT9UKoiCUZl6hweXLIx7W0
A/uGw8aQyttMdhzqfiKnad+TjIi0lM2Ek0OgB1WSdpvR/bsh66ZHpXkk5ufPH+Kv7RBsMHxmMkov
6zdg2UxQLszqHk6f0z7wKMM1/M+RCU4BEEAPZ76N1B90tdOm63Rjp112eusLvcaW/FZge0Ew9pVk
aCsULHrPNemRr86Wq0tHM5168aXBE/tVwdZf/hpAHaqpIZRh7YcZezYtn4Fq/u6yJ6XHuN3pFhtm
yEoz6VlWX3SXDNp8k5htUQumQq8F1ahwoTVS+1AJ+7jJYbCryC8yCiy8lr4UCW5yW0R4sREUDQEq
oBA83KK/aDAyWbaa0o9Jv0G2Qk4dwpL6q/y9BntbO/Vkl/rLw+nn2fvGyR2XXMRpBQNvj3WeHZ8m
yJBR17ujPiAVHTQZtNQh0q4LFdWyVgSHKK3Y0QJzu1EYyvUI678YZL7IAbtxyaj/aJQa2SkZBxeG
n0Roy+UxcnAf3Kr0TWUUEu+gEdXfd1+s++NDXYtmKgrcBIHb/5WBCXYXmV6KxUGM/kxxtBcmVrJJ
Sgz8aJeOSzTYU+5SgVff5ecMsfQIiiQNjWjSc/r3RWZXPpnBGGAH+uFbxYngu1BMuseKQ8+2poWJ
jtK9EApRWyn/EL4A/DVfN+5bTKwRahnPuYuyFYGPFbG9BpEG6wsz650BNffhUpgy66xrMSKkz0d0
dv/CbNcOEtdQtP4BoozQQVvi5ilQndu4JH+SehLViDHhBk0T2FYFPbqfe1Sfd7Irgpv6I1blAxO7
F3GBhGqmNAexl6WYHBCa4kb2BLJVzPI6uS3UE2gVXcVyUbuMRaFzdsWWMIgE6e0jlEiPRhjJJBgQ
BWYzTl4XkZngF9oyvA7edujJttl1MLR9cEUfKBHe53ZyTX/G7+7JMBJygSRlHDb6x7x3u9Afhnep
44zUHsR8zMcBpDeios5aItmgip2lE/1gjbwAAv1Dm3/RCeuTXMSuaminy/S+NGTL1Rmd6AIgqP4Z
zEW09yXZdmC8i/MwNC3IHnibfmRM4ppWqhgbMZ/90wgMxmfVYqLD5hxMfBlEuZAC0DLRPRHoiniu
9evVT6NE1aX7vD/oFYzHoYNXIMlniUrTqoL5FCAMX/MWnK18/SDS6Q5YlUpIMd7pi2Vkcb/uX3VW
dsqUPW8R7xx0da9tqUTS5s1bt8BneQwE0XFV9BDuF4l0XrEqU+3cK/Wku7Vz8n3jpX87RNsPHW44
Ei3zGsSNuVM/oOUYZrMPT8APk+Z3ahKUpWT5MnlB7GBQRdKSNXxdDfU9ik1d8ZpckK/Ct+H5GLPp
U8LSMmOkr4MinTjcpy6h2RekFJukhz6gRKtsM7kXbfzM9dxcArBVvRZJUt7DronzYxteebuaYhEX
9kdDKadqHp3tQz3rFZemxoWeGUaajwsD+us5zY11ZaZ4rxy10XBVBC+pMG9PADMn05zkwIMwJRSV
ZmV5teA7YbkKiiK8Ue6yj0izx2vz1TEd2Nvdk/RJzh2IewAZoe/iRmaz//w03s2v/qWzm6dlVCPT
GvwH58bn6ehhZ7iHvwgIVpWPnnIfa8ETcexR4nSG+9rfNSghNgyzm3CGt8mtL80tI1t6WaUJ6iJe
VF/o7hJ/ejxrTGzt+81qRrN7nhWkMl4rdyCUN6sySgHFA8K5sq7uTE+krvUrm8+NKdkQJV9kSgiP
mY1fgufBoIopsLrpxH/WkLXe62hQkLhnppN1W4N7CxTczG9COsDU2EcxxZj3vZI19mF6+3xrWwES
HFdh/FOuk9JSd0zbk9QFQh1FCMretccQTiIDr3tWRQG2ZdGdqInI9kvNHdqcfy2q2ay574ttXaBQ
R/ObLTfDPoN0S75NK793Ms4JFgwAUlj3bh6rAalpkIUsVcsAZClopr2cg9PNqP327Yk/kZ3S73DJ
GIbxP8HCvumoDcJINv5EBBoa2xkYzYoB3hjzBk/dqB3brM8CQMeic9hz49PVT7aMeqPDQI4IlVFv
7I1fIMNROxM86ze6VV1Ok/QgIje68kZHTZ3t3jU4llFnktxthkDusWSaaXkahwNX5NDQ5c7MScyc
5rjptGPODF9G21pzxt3rY5UKcWRws3X3u3hjC6jdjf7EjPSqOSPuH6EvKUI79AFOhVwxjr/aWSyJ
OLK/L/oQdGjDv569zA6cBITIcs8N/iT5AhIWk0Rv/T1Us5vGFr/akFasDUfNUzQKb3ok8M88VbbE
SHI2R7ARJtxZHEoK8TpBqZmjBdC582HftMtEOvEfrDDVzwU3Tq7lKWf1i5WKa6K8CppUwdLNwp8/
JBgvaEhZCgo/F0bLxAU+q6nOHHqD222OIA2Qh+H7//Up5Qw3eskyfczgA4W+cGCqkfMp09pDIHd6
XLmdk0FXEehHK0+UTC4FHMNtXaSWuK1LjbT0APuIH4ssq5nUmfrOYvq2u/L+UKGS8kDFWeFgU/uD
7KY2NcYrU0OuLgpSZHPTHNlfmGb1tiWfAqoEixy0PMkc0yl4NKbUnEUno/maAvRdVY6YJDanaa2/
vYSJ2EFBeZXqhdwHfb5yft8WORHJY0unA6j5W9Mkl4C8rPteK48bjSHQDMB3D5eXbFW4oGzc7XIv
GmnwbdT/MMX1rx+pZ0/9W2lVkqm4K31P7YzDSnbJSRD5vvz57IFs18W1ZP9sLCSLnuiaAc/v3tJS
+OspGi/nRyPbhdeWpM9v9BPzGon9qjLkGgUJveIiObMIrTqdxGttV6K3yZ+I+5MgPGyrlOP/uFHW
Vkmc3u62UXfb5ha3QdTynJ3Gc9IHqGNW2Bq6CLUAyALc+zVTVvgUa8Zlow==
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
