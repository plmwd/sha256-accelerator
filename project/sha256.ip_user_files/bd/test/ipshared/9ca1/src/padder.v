`timescale 1ns / 1ps

`include "sha256types.vh"

module padder (
    output reg `WORD w_out,
    output pad_of,

    input `WORD w_in,
    input `LONG msg_size,
    input [3:0] offset,
    input [54:0] cur_block,
    input en,
    input reset,
    input start,
    input clk
    );

    localparam  STATE_IDLE = 8'd1,
                STATE_PASSTHROUGH = 8'd2,
                STATE_START_PAD0 = 8'd4,
                STATE_START_PAD1 = 8'd8,
                STATE_PAD_ZEROS = 8'd16,
                STATE_OF_PAD_IDLE = 8'd32,
                STATE_FIN_PAD0 = 8'd64,
                STATE_FIN_PAD1 = 8'd128;

    localparam  FIN_PAD0_OFFSET_THRESH = 4'd13,
                OF_PAD_IDLE_OFFSET_THRESH = 4'd15;

    reg [7:0] state = STATE_IDLE, next_state;
    reg [3:0] offset_reg;
    reg [54:0] cur_block_reg;
    reg `WORD w_in_reg;
    
    wire [54:0] num_blocks_minus1; 
    wire pad_will_of; 
    
    assign num_blocks_minus1 = msg_size[63:6];
    assign pad_will_of = msg_size[5:0] > 55;
    assign pad_of = (cur_block_reg == num_blocks_minus1) && pad_will_of;

    

    wire pad_start;
    reg extra;
    wire [63:0] msg_size_minus1;
    wire [63:0] msg_size_bits;

    assign msg_size_minus1 = msg_size - 1;

    // addr will be zero extended to match width of msg_size_minus1
    assign pad_start = ({cur_block, offset} == msg_size_minus1[63:2]);

    assign msg_size_bits =  msg_size << 3;

    always @(posedge clk) begin
        offset_reg <= offset;
        cur_block_reg <= cur_block;
    end

    // register input word
    always @(posedge clk) begin
        if (en) begin
            w_in_reg <= w_in; 
        end
    end

    // state assignment
    always @(posedge clk) begin
        if (reset) 
            state <= STATE_IDLE;
        else begin
            if (en)
                state <= next_state; 
        end
    end

    // next state function
    always @(*) begin
        next_state = state;

        case (state) 
            STATE_IDLE: begin
                if (start) begin
                    if (msg_size <= 64'd4)
                        next_state = STATE_START_PAD0;
                    else
                        next_state = STATE_PASSTHROUGH;
                end
            end

            STATE_OF_PAD_IDLE: begin
                if (start)
                    next_state = STATE_PAD_ZEROS;
            end

            STATE_PASSTHROUGH: begin
                if (pad_start)
                    next_state = STATE_START_PAD0;
            end

            STATE_START_PAD0: begin
                if (extra) 
                    next_state = STATE_START_PAD1;
                else begin
                    if (offset_reg == FIN_PAD0_OFFSET_THRESH)
                        next_state = STATE_FIN_PAD0;
                    else 
                        next_state = STATE_PAD_ZEROS;
                end
            end

            STATE_START_PAD1: begin
                if (offset_reg == FIN_PAD0_OFFSET_THRESH)
                    next_state = STATE_FIN_PAD0;
                else 
                    next_state = STATE_PAD_ZEROS;
            end


            STATE_PAD_ZEROS: begin
                if (offset_reg == FIN_PAD0_OFFSET_THRESH)
                    next_state = STATE_FIN_PAD0;
                
                if (offset_reg == OF_PAD_IDLE_OFFSET_THRESH)
                    next_state = STATE_OF_PAD_IDLE;
            end

            STATE_FIN_PAD0:
                next_state = STATE_FIN_PAD1;

            STATE_FIN_PAD1:
                next_state = STATE_IDLE;
        endcase

        if (pad_of && (offset_reg == 15))
            next_state = STATE_OF_PAD_IDLE;
    end 

    // output fuction
    always @(*) begin
        w_out = 0;
        extra = 0;
        //pad_of = 0;

        case (state) 
            STATE_IDLE: begin end // nothing

            STATE_OF_PAD_IDLE: begin end

            STATE_PASSTHROUGH:
                w_out = w_in_reg;

            STATE_START_PAD0: begin
                case( msg_size_minus1[1:0] )
                    2'b00:
                        w_out = {w_in_reg[31:24], 8'h80, 16'd0};

                    2'b01:
                        w_out = {w_in_reg[31:16], 8'h80, 8'd0};

                    2'b10:
                        w_out = {w_in_reg[31:8], 8'h80};

                    2'b11: begin
                        w_out = w_in_reg;
                        extra = 1;
                    end
                endcase
            end

            STATE_START_PAD1:
                w_out = 32'h80000000;

            STATE_PAD_ZEROS:
                w_out = 0;

            STATE_FIN_PAD0:
                w_out = msg_size_bits[63:32];

            STATE_FIN_PAD1:
                w_out = msg_size_bits[31:0];
        endcase
        
    end

endmodule
