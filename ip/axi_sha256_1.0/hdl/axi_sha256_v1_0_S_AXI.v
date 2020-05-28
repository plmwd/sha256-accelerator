
`timescale 1 ns / 1 ps

	module axi_sha256_v1_0_S_AXI #
	(
		// Users to add parameters here
		// 0: little endian, 1: big endian
		parameter C_S_SHA256_BIG_ENDIAN = 0,
		parameter C_S_SHA256_BIG_ENDIAN_HASH = 1,
		parameter C_S_SHA256_GEN_PADDER = 1,
		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here
		output wire S_SHA256_IRQ,
		output wire S_SHA256_ERROR_IRQ,

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// Add user signals here
	localparam 	SHA256_EN_BIT = 0,
				SHA256_UPDATE_BIT = 1,
				SHA256_BUSY_BIT = 2,
				SHA256_ERROR_BIT = 3,
				SHA256_BLOCK_DONE_BIT = 4,
				SHA256_HASH_DONE_BIT = 5,
				SHA256_CONTR_BLANK_START_BIT = 6; 

	// hash output with the configured endianness
	wire [31 : 0] 	sha256_hash0,
					sha256_hash1,
					sha256_hash2,
					sha256_hash3,
					sha256_hash4,
					sha256_hash5,
					sha256_hash6,
					sha256_hash7;

	// direct hash output from sha256_update module
	wire [31 : 0] 	sha256_hash0_o,
					sha256_hash1_o,
					sha256_hash2_o,
					sha256_hash3_o,
					sha256_hash4_o,
					sha256_hash5_o,
					sha256_hash6_o,
					sha256_hash7_o;

	wire [3 : 0] sha256_block_offset;
	wire [54 : 0] sha256_cur_block;
	wire [54 : 0] sha256_cur_block_o;
	wire sha256_block_done;
	wire sha256_hash_done;
	reg [31 : 0] sha256_w;
	wire sha256_update;
	wire sha256_en;
	wire sha256_reset;
	wire [63 : 0] sha256_msg_size;
	wire [58 : 0] sha256_addr;
	wire sha256_error;

	// used to reset the sha256 module after a hash completion acknowledgement
	reg issue_ack_reset;

	wire sha256_allow_update_req;

	// User signals ends

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 4;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 30
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg7;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg8;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg9;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg10;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg11;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg12;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg13;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg14;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg15;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg16;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg17;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg18;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg19;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg20;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg21;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg22;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg23;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg24;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg25;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg26;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg27;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg28;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg29;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	reg	 aw_en;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      aw_en <= 1'b1;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (S_AXI_BREADY && axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	      slv_reg4 <= 0;
	      slv_reg5 <= 0;
	      slv_reg6 <= 0;
	      slv_reg7 <= 0;
	      slv_reg8 <= 0;
	      slv_reg9 <= 0;
	      slv_reg10 <= 0;
	      slv_reg11 <= 0;
	      slv_reg12 <= 0;
	      slv_reg13 <= 0;
	      slv_reg14 <= 0;
	      slv_reg15 <= 0;
	      slv_reg16 <= 0;
	      slv_reg17 <= 0;
	      slv_reg18 <= 0;
	      slv_reg19 <= 0;
	      slv_reg20 <= 0;
	      slv_reg21 <= 0;
	      slv_reg22 <= 0;
	      slv_reg23 <= 0;
	      slv_reg24 <= 0;
	      slv_reg25 <= 0;
	      slv_reg26 <= 0;
	      slv_reg27 <= 0;
	      slv_reg28 <= 0;
	      slv_reg29 <= 0;
	    end 
	  else begin
	  	// assign values of read-only registers - not writeable otherwise

		// only allow sha256_hash_done to SET register value
		if ( slv_reg0[SHA256_HASH_DONE_BIT] == 1'b0 )
			slv_reg0[SHA256_HASH_DONE_BIT] <= sha256_hash_done;

		// only allow sha256_block_done to SET register value
		if ( slv_reg0[SHA256_BLOCK_DONE_BIT] == 1'b0)
			slv_reg0[SHA256_BLOCK_DONE_BIT] <= sha256_block_done; 

		// clear issue_ack_reset if set to finish issueing the reset
		if ( issue_ack_reset == 1'b1 )
			issue_ack_reset <= 1'b0;

		// write error startus bit - device must be reset (error bit ack)
		if (slv_reg0[SHA256_ERROR_BIT] == 1'b0)
			slv_reg0[SHA256_ERROR_BIT] <= sha256_error;

		// fill in the unimplemented space with zeros
	  	slv_reg0[31 : SHA256_CONTR_BLANK_START_BIT] <= 0;

		slv_reg3 <= sha256_cur_block[31 : 0];
		slv_reg4 <= {11'd0, sha256_cur_block[52 : 32]};
		slv_reg21 <= sha256_hash0;
		slv_reg22 <= sha256_hash1;
		slv_reg23 <= sha256_hash2;
		slv_reg24 <= sha256_hash3;
		slv_reg25 <= sha256_hash4;
		slv_reg26 <= sha256_hash5;
		slv_reg27 <= sha256_hash6;
		slv_reg28 <= sha256_hash7;

		// if the update bit is high, then clear it to avoid unintentional updates
		// default logic and the case statement overrides this if slv_reg0 is being written to
		if (slv_reg0[SHA256_UPDATE_BIT] == 1'b1)
			slv_reg0[SHA256_UPDATE_BIT] <= 1'b0;

		// if update request is allowed and a request comes in, set device to 'busy'
		// Check slv_reg not WDATA to allow sha256_update signal to be '1' for one clock
		// Also is the cycle that the module actually starts the update
		if (slv_reg0[SHA256_UPDATE_BIT] && sha256_allow_update_req)
			slv_reg0[SHA256_BUSY_BIT] <= 1'b1;

		// Set device to 'not busy' when module completes
		if ( sha256_block_done )
			slv_reg0[SHA256_BUSY_BIT] <= 1'b0;

	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          5'h00: begin
				// lower 3 bits are R/W (update, big_endian_msg, en), the rest of the word are done bits or blank 
				slv_reg0[SHA256_UPDATE_BIT] <= S_AXI_WDATA[SHA256_UPDATE_BIT];
				slv_reg0[SHA256_EN_BIT] <= S_AXI_WDATA[SHA256_EN_BIT];

				// check for block_done acknowledgement
				// check both WDATA and slv_reg0 to ensure no contention
				if ( (S_AXI_WDATA[SHA256_BLOCK_DONE_BIT] == 1'b0) && (slv_reg0[SHA256_BLOCK_DONE_BIT] == 1'b1) ) begin
					slv_reg0[SHA256_BLOCK_DONE_BIT] <= 1'b0;
				end

				if (C_S_SHA256_GEN_PADDER === 1'b1) begin
					// check for hash_done acknowledgement and issue reset
					if ( (S_AXI_WDATA[SHA256_HASH_DONE_BIT] == 1'b0) && (slv_reg0[SHA256_HASH_DONE_BIT] == 1'b1) ) begin
						slv_reg0[SHA256_HASH_DONE_BIT] <= 1'b0;
						slv_reg0[SHA256_BLOCK_DONE_BIT] <= 1'b0;
						issue_ack_reset <= 1'b1;
					end
				end

				// check for error acknowledgement and issue reset
				if ( (S_AXI_WDATA[SHA256_ERROR_BIT == 1'b0]) && (slv_reg0[SHA256_ERROR_BIT] == 1'b1) ) begin
					slv_reg0[SHA256_ERROR_BIT] <= 1'b0;
					slv_reg0[SHA256_BLOCK_DONE_BIT] <= 1'b0;
					slv_reg0[SHA256_BUSY_BIT] <= 1'b0;
					issue_ack_reset <= 1'b1;

					if (C_S_SHA256_GEN_PADDER === 1'b1) begin
						slv_reg0[SHA256_HASH_DONE_BIT] <= 1'b0;
					end
				end
			  end
	          5'h01:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h02:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h05:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 5
	                slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h06:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 6
	                slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h07:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 7
	                slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h08:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 8
	                slv_reg8[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h09:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 9
	                slv_reg9[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 10
	                slv_reg10[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0B:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 11
	                slv_reg11[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 12
	                slv_reg12[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 13
	                slv_reg13[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0E:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 14
	                slv_reg14[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0F:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg15[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h10:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 16
	                slv_reg16[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h11:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 17
	                slv_reg17[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h12:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 18
	                slv_reg18[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h13:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 19
	                slv_reg19[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h14:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 20
	                slv_reg20[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                      slv_reg2 <= slv_reg2;
	                      slv_reg3 <= slv_reg3;
	                      slv_reg4 <= slv_reg4;
	                      slv_reg5 <= slv_reg5;
	                      slv_reg6 <= slv_reg6;
	                      slv_reg7 <= slv_reg7;
	                      slv_reg8 <= slv_reg8;
	                      slv_reg9 <= slv_reg9;
	                      slv_reg10 <= slv_reg10;
	                      slv_reg11 <= slv_reg11;
	                      slv_reg12 <= slv_reg12;
	                      slv_reg13 <= slv_reg13;
	                      slv_reg14 <= slv_reg14;
	                      slv_reg15 <= slv_reg15;
	                      slv_reg16 <= slv_reg16;
	                      slv_reg17 <= slv_reg17;
	                      slv_reg18 <= slv_reg18;
	                      slv_reg19 <= slv_reg19;
	                      slv_reg20 <= slv_reg20;
	                      slv_reg21 <= slv_reg21;
	                      slv_reg22 <= slv_reg22;
	                      slv_reg23 <= slv_reg23;
	                      slv_reg24 <= slv_reg24;
	                      slv_reg25 <= slv_reg25;
	                      slv_reg26 <= slv_reg26;
	                      slv_reg27 <= slv_reg27;
	                      slv_reg28 <= slv_reg28;
	                      slv_reg29 <= slv_reg29;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        5'h00   : reg_data_out <= slv_reg0;
	        5'h01   : reg_data_out <= slv_reg1;
	        5'h02   : reg_data_out <= slv_reg2;
	        5'h03   : reg_data_out <= slv_reg3;
	        5'h04   : reg_data_out <= slv_reg4;
	        5'h05   : reg_data_out <= slv_reg5;
	        5'h06   : reg_data_out <= slv_reg6;
	        5'h07   : reg_data_out <= slv_reg7;
	        5'h08   : reg_data_out <= slv_reg8;
	        5'h09   : reg_data_out <= slv_reg9;
	        5'h0A   : reg_data_out <= slv_reg10;
	        5'h0B   : reg_data_out <= slv_reg11;
	        5'h0C   : reg_data_out <= slv_reg12;
	        5'h0D   : reg_data_out <= slv_reg13;
	        5'h0E   : reg_data_out <= slv_reg14;
	        5'h0F   : reg_data_out <= slv_reg15;
	        5'h10   : reg_data_out <= slv_reg16;
	        5'h11   : reg_data_out <= slv_reg17;
	        5'h12   : reg_data_out <= slv_reg18;
	        5'h13   : reg_data_out <= slv_reg19;
	        5'h14   : reg_data_out <= slv_reg20;
	        5'h15   : reg_data_out <= slv_reg21;
	        5'h16   : reg_data_out <= slv_reg22;
	        5'h17   : reg_data_out <= slv_reg23;
	        5'h18   : reg_data_out <= slv_reg24;
	        5'h19   : reg_data_out <= slv_reg25;
	        5'h1A   : reg_data_out <= slv_reg26;
	        5'h1B   : reg_data_out <= slv_reg27;
	        5'h1C   : reg_data_out <= slv_reg28;
	        5'h1D   : reg_data_out <= slv_reg29;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

	// Add user logic here
	// IRQ signal generation
	// only block_done since hash_done depends on block_done 
	// IRQ uses both signals to remove 1 cycle delay
	assign S_SHA256_IRQ = slv_reg0[SHA256_BLOCK_DONE_BIT] | sha256_block_done;	
	assign S_SHA256_ERROR_IRQ = slv_reg0[SHA256_ERROR_BIT];

	// Adjusted slv_reg write logic to make some regs read-only. See memory map for which ones.
	// The sha256_addr is a word address (no byte resolution).
	// The offset is which word in the 16-word message block and the cur_block indicates the current state
	// of the hash.
	assign sha256_addr = {sha256_cur_block_o, sha256_block_offset};

	assign sha256_en = slv_reg0[SHA256_EN_BIT];
	assign sha256_reset = ~slv_reg0[SHA256_EN_BIT] | issue_ack_reset;

	// Only allow update if the intermediate hash has been acknowledged and the device has been reset 
	// after acknowledging the hash completion.
	assign sha256_allow_update_req = ~slv_reg0[SHA256_HASH_DONE_BIT] & ~slv_reg0[SHA256_BLOCK_DONE_BIT] & ~slv_reg0[SHA256_BUSY_BIT];
	assign sha256_update = slv_reg0[SHA256_UPDATE_BIT] & sha256_allow_update_req;

	

generate 
if (C_S_SHA256_BIG_ENDIAN === 1'b1) begin

	// convert from big endian (reg) to little endian for sha256_update
	assign sha256_msg_size[31:0] = {slv_reg1[7 : 0], slv_reg1[15 : 8], slv_reg1[23 : 16], slv_reg1[31:24]};
	assign sha256_msg_size[63:32] = {slv_reg2[7 : 0], slv_reg2[15 : 8], slv_reg2[23 : 16], slv_reg2[31:24]};

	// convert from big endian (reg) to little endian for sha256_update
	assign sha256_cur_block = {sha256_cur_block_o[7 : 0], sha256_cur_block_o[15 : 8], sha256_cur_block_o[23 : 16], sha256_cur_block_o[31:24]};

	// get word from message block buffer (slv_regs 5-20) and use converted little to big endian slv_regs if in little-endian mode
	always @(*) begin
		case(sha256_block_offset) 
			4'd0:
				sha256_w = slv_reg5;
			4'd1:
				sha256_w = slv_reg6;
			4'd2:
				sha256_w = slv_reg7;
			4'd3:
				sha256_w = slv_reg8;
			4'd4:
				sha256_w = slv_reg9;
			4'd5:
				sha256_w = slv_reg10;
			4'd6:
				sha256_w = slv_reg11;
			4'd7:
				sha256_w = slv_reg12;
			4'd8:
				sha256_w = slv_reg13;
			4'd9:
				sha256_w = slv_reg14;
			4'd10:
				sha256_w = slv_reg15;
			4'd11:
				sha256_w = slv_reg16;
			4'd12:
				sha256_w = slv_reg17;
			4'd13:
				sha256_w = slv_reg18;
			4'd14:
				sha256_w = slv_reg19;
			4'd15:
				sha256_w = slv_reg20;
			default:
				sha256_w = 32'd0;
		endcase
	end
end
else begin
	assign sha256_msg_size = {slv_reg2, slv_reg1};

	assign sha256_cur_block = sha256_cur_block_o;

	// If messgae buffer is in little-endian mode, then convert to big endian to load into the sha256_update module
	always @(*) begin
		case(sha256_block_offset) 
			4'd0:
				sha256_w = {slv_reg5[7 : 0], slv_reg5[15 : 8], slv_reg5[23 : 16], slv_reg5[31:24]};
			4'd1:
				sha256_w = {slv_reg6[7 : 0], slv_reg6[15 : 8], slv_reg6[23 : 16], slv_reg6[31:24]};
			4'd2:
				sha256_w = {slv_reg7[7 : 0], slv_reg7[15 : 8], slv_reg7[23 : 16], slv_reg7[31:24]};
			4'd3:
				sha256_w = {slv_reg8[7 : 0], slv_reg8[15 : 8], slv_reg8[23 : 16], slv_reg8[31:24]};
			4'd4:
				sha256_w = {slv_reg9[7 : 0], slv_reg9[15 : 8], slv_reg9[23 : 16], slv_reg9[31:24]};
			4'd5:
				sha256_w = {slv_reg10[7 : 0], slv_reg10[15 : 8], slv_reg10[23 : 16], slv_reg10[31:24]};
			4'd6:
				sha256_w = {slv_reg11[7 : 0], slv_reg11[15 : 8], slv_reg11[23 : 16], slv_reg11[31:24]};
			4'd7:
				sha256_w = {slv_reg12[7 : 0], slv_reg12[15 : 8], slv_reg12[23 : 16], slv_reg12[31:24]};
			4'd8:
				sha256_w = {slv_reg13[7 : 0], slv_reg13[15 : 8], slv_reg13[23 : 16], slv_reg13[31:24]};
			4'd9:
				sha256_w = {slv_reg14[7 : 0], slv_reg14[15 : 8], slv_reg14[23 : 16], slv_reg14[31:24]};
			4'd10:
				sha256_w = {slv_reg15[7 : 0], slv_reg15[15 : 8], slv_reg15[23 : 16], slv_reg15[31:24]};
			4'd11:
				sha256_w = {slv_reg16[7 : 0], slv_reg16[15 : 8], slv_reg16[23 : 16], slv_reg16[31:24]};
			4'd12:
				sha256_w = {slv_reg17[7 : 0], slv_reg17[15 : 8], slv_reg17[23 : 16], slv_reg17[31:24]};
			4'd13:
				sha256_w = {slv_reg18[7 : 0], slv_reg18[15 : 8], slv_reg18[23 : 16], slv_reg18[31:24]};
			4'd14:
				sha256_w = {slv_reg19[7 : 0], slv_reg19[15 : 8], slv_reg19[23 : 16], slv_reg19[31:24]};
			4'd15:
				sha256_w = {slv_reg20[7 : 0], slv_reg20[15 : 8], slv_reg20[23 : 16], slv_reg20[31:24]};
			default:
				sha256_w = 32'd0;
		endcase
	end
end

if ( C_S_SHA256_BIG_ENDIAN_HASH === 1'b1) begin
	assign sha256_hash0 = sha256_hash0_o;
	assign sha256_hash1 = sha256_hash1_o;
	assign sha256_hash2 = sha256_hash2_o;
	assign sha256_hash3 = sha256_hash3_o;
	assign sha256_hash4 = sha256_hash4_o;
	assign sha256_hash5 = sha256_hash5_o;
	assign sha256_hash6 = sha256_hash6_o;
	assign sha256_hash7 = sha256_hash7_o;
end
else begin
	assign sha256_hash0 = {sha256_hash0_o[7 : 0], sha256_hash0_o[15 : 8], sha256_hash0_o[23 : 16], sha256_hash0_o[31:24]};
	assign sha256_hash1 = {sha256_hash1_o[7 : 0], sha256_hash1_o[15 : 8], sha256_hash1_o[23 : 16], sha256_hash1_o[31:24]};
	assign sha256_hash2 = {sha256_hash2_o[7 : 0], sha256_hash2_o[15 : 8], sha256_hash2_o[23 : 16], sha256_hash2_o[31:24]};
	assign sha256_hash3 = {sha256_hash3_o[7 : 0], sha256_hash3_o[15 : 8], sha256_hash3_o[23 : 16], sha256_hash3_o[31:24]};
	assign sha256_hash4 = {sha256_hash4_o[7 : 0], sha256_hash4_o[15 : 8], sha256_hash4_o[23 : 16], sha256_hash4_o[31:24]};
	assign sha256_hash5 = {sha256_hash5_o[7 : 0], sha256_hash5_o[15 : 8], sha256_hash5_o[23 : 16], sha256_hash5_o[31:24]};
	assign sha256_hash6 = {sha256_hash6_o[7 : 0], sha256_hash6_o[15 : 8], sha256_hash6_o[23 : 16], sha256_hash6_o[31:24]};
	assign sha256_hash7 = {sha256_hash7_o[7 : 0], sha256_hash7_o[15 : 8], sha256_hash7_o[23 : 16], sha256_hash7_o[31:24]};
end

if (C_S_SHA256_GEN_PADDER === 1'b0) begin 
	assign sha256_hash_done = 1'b0;

	sha256_update_no_padder axi_sha256_no_padder (
		.hash0(sha256_hash0_o),
		.hash1(sha256_hash1_o),
		.hash2(sha256_hash2_o),
		.hash3(sha256_hash3_o),
		.hash4(sha256_hash4_o),
		.hash5(sha256_hash5_o),
		.hash6(sha256_hash6_o),
		.hash7(sha256_hash7_o),	
		.block_offset(sha256_block_offset),
		.cur_block(sha256_cur_block_o),
		.done(sha256_block_done),
		.error(sha256_error),

		.clk(S_AXI_ACLK),
		.w(sha256_w),
		.update(sha256_update),
		.en(sha256_en),
		.reset(sha256_reset)
	);
end
else begin
	// Bit selection on sha256_msg_size to get the number of words in the message being hashed 
	// Does not account for the padding overflowing so hash_done needs to wait for the sha256_update
	// module to be done (includes padding), so it depends on block_done because the comparison will trigger before the block is done
	assign sha256_hash_done = (sha256_addr > sha256_msg_size[63:2]) & sha256_block_done;

	sha256_update axi_sha256 (
		.hash0(sha256_hash0_o),
		.hash1(sha256_hash1_o),
		.hash2(sha256_hash2_o),
		.hash3(sha256_hash3_o),
		.hash4(sha256_hash4_o),
		.hash5(sha256_hash5_o),
		.hash6(sha256_hash6_o),
		.hash7(sha256_hash7_o),	
		.block_offset(sha256_block_offset),
		.cur_block(sha256_cur_block_o),
		.done(sha256_block_done),
		.error(sha256_error),

		.clk(S_AXI_ACLK),
		.w(sha256_w),
		.update(sha256_update),
		.en(sha256_en),
		.reset(sha256_reset),
		.msg_size(sha256_msg_size)
	);
end
endgenerate

	// User logic ends
	endmodule
