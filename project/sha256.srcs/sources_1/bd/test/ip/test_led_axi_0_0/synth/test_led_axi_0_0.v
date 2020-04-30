// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:led_axi:1.0
// IP Revision: 8

(* X_CORE_INFO = "led_axi_v1_0,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "test_led_axi_0_0,led_axi_v1_0,{}" *)
(* CORE_GENERATION_INFO = "test_led_axi_0_0,led_axi_v1_0,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=led_axi,x_ipVersion=1.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_LED_IO_AXI_DATA_WIDTH=32,C_LED_IO_AXI_ADDR_WIDTH=4}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module test_led_axi_0_0 (
  led_io,
  led_io_axi_aclk,
  led_io_axi_aresetn,
  led_io_axi_awaddr,
  led_io_axi_awprot,
  led_io_axi_awvalid,
  led_io_axi_awready,
  led_io_axi_wdata,
  led_io_axi_wstrb,
  led_io_axi_wvalid,
  led_io_axi_wready,
  led_io_axi_bresp,
  led_io_axi_bvalid,
  led_io_axi_bready,
  led_io_axi_araddr,
  led_io_axi_arprot,
  led_io_axi_arvalid,
  led_io_axi_arready,
  led_io_axi_rdata,
  led_io_axi_rresp,
  led_io_axi_rvalid,
  led_io_axi_rready
);

output wire [15 : 0] led_io;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LED_IO_AXI_CLK, ASSOCIATED_BUSIF LED_IO_AXI, ASSOCIATED_RESET led_io_axi_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 LED_IO_AXI_CLK CLK" *)
input wire led_io_axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LED_IO_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 LED_IO_AXI_RST RST" *)
input wire led_io_axi_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI AWADDR" *)
input wire [3 : 0] led_io_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI AWPROT" *)
input wire [2 : 0] led_io_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI AWVALID" *)
input wire led_io_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI AWREADY" *)
output wire led_io_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI WDATA" *)
input wire [31 : 0] led_io_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI WSTRB" *)
input wire [3 : 0] led_io_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI WVALID" *)
input wire led_io_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI WREADY" *)
output wire led_io_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI BRESP" *)
output wire [1 : 0] led_io_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI BVALID" *)
output wire led_io_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI BREADY" *)
input wire led_io_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI ARADDR" *)
input wire [3 : 0] led_io_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI ARPROT" *)
input wire [2 : 0] led_io_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI ARVALID" *)
input wire led_io_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI ARREADY" *)
output wire led_io_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI RDATA" *)
output wire [31 : 0] led_io_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI RRESP" *)
output wire [1 : 0] led_io_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI RVALID" *)
output wire led_io_axi_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LED_IO_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, N\
UM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LED_IO_AXI RREADY" *)
input wire led_io_axi_rready;

  led_axi_v1_0 #(
    .C_LED_IO_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_LED_IO_AXI_ADDR_WIDTH(4)  // Width of S_AXI address bus
  ) inst (
    .led_io(led_io),
    .led_io_axi_aclk(led_io_axi_aclk),
    .led_io_axi_aresetn(led_io_axi_aresetn),
    .led_io_axi_awaddr(led_io_axi_awaddr),
    .led_io_axi_awprot(led_io_axi_awprot),
    .led_io_axi_awvalid(led_io_axi_awvalid),
    .led_io_axi_awready(led_io_axi_awready),
    .led_io_axi_wdata(led_io_axi_wdata),
    .led_io_axi_wstrb(led_io_axi_wstrb),
    .led_io_axi_wvalid(led_io_axi_wvalid),
    .led_io_axi_wready(led_io_axi_wready),
    .led_io_axi_bresp(led_io_axi_bresp),
    .led_io_axi_bvalid(led_io_axi_bvalid),
    .led_io_axi_bready(led_io_axi_bready),
    .led_io_axi_araddr(led_io_axi_araddr),
    .led_io_axi_arprot(led_io_axi_arprot),
    .led_io_axi_arvalid(led_io_axi_arvalid),
    .led_io_axi_arready(led_io_axi_arready),
    .led_io_axi_rdata(led_io_axi_rdata),
    .led_io_axi_rresp(led_io_axi_rresp),
    .led_io_axi_rvalid(led_io_axi_rvalid),
    .led_io_axi_rready(led_io_axi_rready)
  );
endmodule
