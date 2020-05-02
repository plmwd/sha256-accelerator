`timescale 1ns / 1ps

/**
* 
* Design Name: SHA256 Accelerator
* Module Name: sha256_core
* Project Name: sha256
* Target Devices: Basys3 (xc7a35tcpg236-1)
* Tool Versions: Vivado 2019.2
* Author: Paul Wood
* Description: The sha256_core provides a standalone module to hash a message without a CPU. To use with a CPU, use/see the AXI sha256 implementation 
*   that uses the sha256_update module. It provides an interface to the internal buffer and sha256. The final hash registers are outputted and together 
*   concatenated in big-endian order forms the 256-bit hash. The reset signal will reset all states within the module and submodules besides the hash 
*   registers to allow for reading the values until the next hash. The intermediate hash completion is indicated by the done signal, which is high only 
*   for one clock cycle (to be fixed). 
*
* Configuration Parameter(s):
*   > MSG_BUFFER_SIZE is the size of the message buffer to be instantiation - adjusts various signal widths as well
*
* Dependencies:
*   > padder.v
*   > compressor.v
*   > hasher.v
*   > scheduler.v
*   > rom.v
*   > reg_delay.v
*   > sha256_update.v
*   > kvals.mem
*   > the size of the message
*   
* Algorithm Documentation: https://csrc.nist.gov/publications/detail/fips/180/4/final
* Module Block Diagrams/Flowcharts: SHA256-HardwareImplementation.pdf 
*
*/

`include "sha256types.vh"

module sha256_core #( 
    parameter   MSG_BUFFER_SIZE = 64
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
    input clk
    );

    // Core FSM
    reg [3:0] state, next_state;
    localparam  STATE_IDLE = 4'd1,
                STATE_CALC_HASH = 4'd2,
                STATE_UPDATE = 4'd4,
                STATE_DONE = 4'd8;

    // Registered input
    reg `LONG msg_size_reg;

    // Signals
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

    // Message buffer instaniation
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

    // sha256_update instantiation
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

    // Registering msg_size to keep constant over a clock cycle - ideally would be the entire hash but whatever
    always @(posedge clk) begin
        if (en && start)
            msg_size_reg <= msg_size; 
    end

    // Set state
    always @(posedge clk) begin
        if (reset) begin
            state <= STATE_IDLE;
        end
        else begin
            if (en)
                state <= next_state; 
        end
    end

    // State machine logic - see diagrams/flowcharts for description
    // Output function
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

    // Next state function
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
    