
`timescale 1 ns / 1 ps

	module led_axi_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface LED_IO_AXI
		parameter integer C_LED_IO_AXI_DATA_WIDTH	= 32,
		parameter integer C_LED_IO_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

		output wire [15 : 0] led_io,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface LED_IO_AXI
		input wire  led_io_axi_aclk,
		input wire  led_io_axi_aresetn,
		input wire [C_LED_IO_AXI_ADDR_WIDTH-1 : 0] led_io_axi_awaddr,
		input wire [2 : 0] led_io_axi_awprot,
		input wire  led_io_axi_awvalid,
		output wire  led_io_axi_awready,
		input wire [C_LED_IO_AXI_DATA_WIDTH-1 : 0] led_io_axi_wdata,
		input wire [(C_LED_IO_AXI_DATA_WIDTH/8)-1 : 0] led_io_axi_wstrb,
		input wire  led_io_axi_wvalid,
		output wire  led_io_axi_wready,
		output wire [1 : 0] led_io_axi_bresp,
		output wire  led_io_axi_bvalid,
		input wire  led_io_axi_bready,
		input wire [C_LED_IO_AXI_ADDR_WIDTH-1 : 0] led_io_axi_araddr,
		input wire [2 : 0] led_io_axi_arprot,
		input wire  led_io_axi_arvalid,
		output wire  led_io_axi_arready,
		output wire [C_LED_IO_AXI_DATA_WIDTH-1 : 0] led_io_axi_rdata,
		output wire [1 : 0] led_io_axi_rresp,
		output wire  led_io_axi_rvalid,
		input wire  led_io_axi_rready
	);
// Instantiation of Axi Bus Interface LED_IO_AXI
	led_axi_v1_0_LED_IO_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_LED_IO_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_LED_IO_AXI_ADDR_WIDTH)
	) led_axi_v1_0_LED_IO_AXI_inst (
		.S_AXI_LEDS(led_io),
		.S_AXI_ACLK(led_io_axi_aclk),
		.S_AXI_ARESETN(led_io_axi_aresetn),
		.S_AXI_AWADDR(led_io_axi_awaddr),
		.S_AXI_AWPROT(led_io_axi_awprot),
		.S_AXI_AWVALID(led_io_axi_awvalid),
		.S_AXI_AWREADY(led_io_axi_awready),
		.S_AXI_WDATA(led_io_axi_wdata),
		.S_AXI_WSTRB(led_io_axi_wstrb),
		.S_AXI_WVALID(led_io_axi_wvalid),
		.S_AXI_WREADY(led_io_axi_wready),
		.S_AXI_BRESP(led_io_axi_bresp),
		.S_AXI_BVALID(led_io_axi_bvalid),
		.S_AXI_BREADY(led_io_axi_bready),
		.S_AXI_ARADDR(led_io_axi_araddr),
		.S_AXI_ARPROT(led_io_axi_arprot),
		.S_AXI_ARVALID(led_io_axi_arvalid),
		.S_AXI_ARREADY(led_io_axi_arready),
		.S_AXI_RDATA(led_io_axi_rdata),
		.S_AXI_RRESP(led_io_axi_rresp),
		.S_AXI_RVALID(led_io_axi_rvalid),
		.S_AXI_RREADY(led_io_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
