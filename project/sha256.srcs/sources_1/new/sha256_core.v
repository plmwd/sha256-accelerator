`timescale 1ns / 1ps

`include "sha256types.vh"

// TODO: implement GEN_PADDER
// TODO: implement MSG_BUFFER_SIZE
// TODO: implement LIMIT_MAX_MSG_SIZE
// TODO: implement MANUAL_UPDATE
module sha256_core #( 
    parameter   GEN_PADDER = 1, 
                MSG_BUFFER_SIZE = 64,
                LIMIT_MAX_MSG_SIZE = 0,
                MANUAL_UPDATE = 0
    ) (
    output `WORD hash0,
    output `WORD hash1, 
    output `WORD hash2, 
    output `WORD hash3, 
    output `WORD hash4, 
    output `WORD hash5, 
    output `WORD hash6, 
    output `WORD hash7, 
    output reg done,

    input msg_buffer_wen,
    input [$clog2(MSG_BUFFER_SIZE) - 1 : 0] write_addr,
    input `WORD write_word,
    input `LONG msg_size,
    input start,
    input reset,
    input en,
    input update,
    input clk
    );

    reg `LONG msg_size_reg;

    // core FSM
    reg [3:0] state, next_state;
    localparam  STATE_IDLE = 4'd1,
                STATE_CALC_HASH = 4'd2,
                STATE_UPDATE = 4'd4,
                STATE_DONE = 4'd8;

    // wires
    wire `WORD msg_buffer_out;
    wire [56:0] sha256_addr;
    reg sha256_update;
    wire sha256_done;
    wire reset_sha256;
    wire en_sha256;
    wire [3:0] sha256_block_offset;
    wire [52:0] sha256_cur_block;

    wire hash_done;

    assign hash_done = (sha256_addr >= msg_size_reg[56:2]);
    assign sha256_addr = {sha256_cur_block, sha256_block_offset};

    ram #(
        .WORD_WIDTH(32),
        .NUM_WORDS(MSG_BUFFER_SIZE)
        )
        msg_buffer_inst (
        .rdata(msg_buffer_out),
        .raddr(sha256_addr[$clog2(MSG_BUFFER_SIZE) - 1 : 0]),
        .waddr(write_addr),
        .wdata(write_word),
        .wen(msg_buffer_wen),
        .clk(clk)
        );


    sha256_update update_inst (
        .hash0(hash0),
        .hash1(hash1),
        .hash2(hash2),
        .hash3(hash3),
        .hash4(hash4),
        .hash5(hash5),
        .hash6(hash6),
        .hash7(hash7),
        .block_offset(sha256_block_offset),
        .cur_block(sha256_cur_block),
        .done(sha256_done),

        .w(msg_buffer_out),
        .update(sha256_update),
        .en(en),
        .reset(reset),
        .msg_size(msg_size_reg),
        .clk(clk)
        );

    always @(posedge clk) begin
        if (en && start)
            msg_size_reg <= msg_size; 
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= STATE_IDLE;
        end
        else begin
            if (en)
                state <= next_state; 
        end
    end

    // output function
    always @(*) begin
        done = 0;
        sha256_update = 0;

        case(state)
            STATE_IDLE: begin end

            STATE_CALC_HASH: begin end

            STATE_UPDATE:
                sha256_update = 1;

            STATE_DONE: 
                done = 1;
        endcase
    end

    // next state function
    always @(*) begin
        next_state = state;

        case(state)
            STATE_IDLE: begin
                if (start)
                    next_state = STATE_UPDATE;
            end

            STATE_CALC_HASH: begin
                if (sha256_done) begin
                    if (hash_done)
                        next_state = STATE_DONE;
                    else
                        next_state = STATE_UPDATE;
                end
            end

            STATE_UPDATE:
                next_state = STATE_CALC_HASH;

            STATE_DONE:
                next_state = STATE_IDLE;
        endcase
    end

endmodule
    