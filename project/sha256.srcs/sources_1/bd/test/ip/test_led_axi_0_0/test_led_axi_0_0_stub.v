// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Apr 29 19:38:35 2020
// Host        : DESKTOP-E4CP06Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/904pa/Documents/Git/sha256/project/sha256.srcs/sources_1/bd/test/ip/test_led_axi_0_0/test_led_axi_0_0_stub.v
// Design      : test_led_axi_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "led_axi_v1_0,Vivado 2019.2" *)
module test_led_axi_0_0(led_io, led_io_axi_aclk, led_io_axi_aresetn, 
  led_io_axi_awaddr, led_io_axi_awprot, led_io_axi_awvalid, led_io_axi_awready, 
  led_io_axi_wdata, led_io_axi_wstrb, led_io_axi_wvalid, led_io_axi_wready, 
  led_io_axi_bresp, led_io_axi_bvalid, led_io_axi_bready, led_io_axi_araddr, 
  led_io_axi_arprot, led_io_axi_arvalid, led_io_axi_arready, led_io_axi_rdata, 
  led_io_axi_rresp, led_io_axi_rvalid, led_io_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="led_io[15:0],led_io_axi_aclk,led_io_axi_aresetn,led_io_axi_awaddr[3:0],led_io_axi_awprot[2:0],led_io_axi_awvalid,led_io_axi_awready,led_io_axi_wdata[31:0],led_io_axi_wstrb[3:0],led_io_axi_wvalid,led_io_axi_wready,led_io_axi_bresp[1:0],led_io_axi_bvalid,led_io_axi_bready,led_io_axi_araddr[3:0],led_io_axi_arprot[2:0],led_io_axi_arvalid,led_io_axi_arready,led_io_axi_rdata[31:0],led_io_axi_rresp[1:0],led_io_axi_rvalid,led_io_axi_rready" */;
  output [15:0]led_io;
  input led_io_axi_aclk;
  input led_io_axi_aresetn;
  input [3:0]led_io_axi_awaddr;
  input [2:0]led_io_axi_awprot;
  input led_io_axi_awvalid;
  output led_io_axi_awready;
  input [31:0]led_io_axi_wdata;
  input [3:0]led_io_axi_wstrb;
  input led_io_axi_wvalid;
  output led_io_axi_wready;
  output [1:0]led_io_axi_bresp;
  output led_io_axi_bvalid;
  input led_io_axi_bready;
  input [3:0]led_io_axi_araddr;
  input [2:0]led_io_axi_arprot;
  input led_io_axi_arvalid;
  output led_io_axi_arready;
  output [31:0]led_io_axi_rdata;
  output [1:0]led_io_axi_rresp;
  output led_io_axi_rvalid;
  input led_io_axi_rready;
endmodule
