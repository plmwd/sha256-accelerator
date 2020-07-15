`timescale 1ns / 1ps

/**
* 
* Design Name: SHA256 Accelerator
* Module Name: sha256_update
* Project Name: sha256
* Target Devices: Basys3 (xc7a35tcpg236-1)
* Tool Versions: Vivado 2019.2
* Author: Paul Wood
* Description: The sha256_update module contains all of the logic to perform an intermediate hash. It contains the state of the hash - which
*   block and word in the block is being hashed. This module also contains logic to automicatically deal with padding overflow conditions and 
*   provides an easy to use interface. The module requests a word from a one-cycle-delay buffer through combination of the cur_block and block_offset
*   signals. Concatenated together in that order allows the formation of a word-address. Optionally, the cur_block signal can be ignored since the 
*   update signal only hashes a single block, therefore leaving time in between update issues to load a 16-word buffer and address using only the 
*   offset. The final hash registers are outputted and together concatenated in big-endian order forms the 256-bit hash. The reset signal will 
*   reset all states within the module and submodules besides the hash registers to allow for reading the values until the next update. The 
*   intermediate hash completion is indicated by the done signal, which is high only for one clock cycle (to be fixed). 
*
* Dependencies:
*   > padder.v
*   > compressor.v
*   > hasher.v
*   > scheduler.v
*   > rom.v
*   > reg_delay.v
*   > kvals.mem
*   > a buffer to message words
*   > the size of the message
*   
* Algorithm Documentation: https://csrc.nist.gov/publications/detail/fips/180/4/final
* Module Block Diagrams/Flowcharts: SHA256-HardwareImplementation.pdf 
*
*/

`include "sha256types.vh"

(* use_dsp = "yes" *) module sha256_update(
    output `WORD hash0,
    output `WORD hash1,
    output `WORD hash2,
    output `WORD hash3,
    output `WORD hash4,
    output `WORD hash5,
    output `WORD hash6,
    output `WORD hash7,
    output [3:0] block_offset, /* padded message word addr (16 words) */
    output [54:0] cur_block,
    output reg done,
    output reg error,
    
    input clk,
    input `WORD w,
    input update,
    input en,
    input reset,
    input `LONG msg_size
    );

    // one-hot encoding
    localparam  STATE_IDLE = 5'd1,
                STATE_INIT = 5'd2,
                STATE_ROUND_CALC = 5'd4,
                STATE_COMP_IMD_HASH = 5'd8,
                STATE_DONE = 5'd16;

    /******************* REGISTERS *******************/
    // State register
    reg [4 : 0] state, next_state;

    // Round counter and pipeline stage registers
    reg [5 : 0] round_counter;
    // Used to count once per block hash (counts to 63, then holds at 0)
    reg finished_rounds;
    // (R)ound (c)ounter stage (n) (rcn)
    // rc1: between padder and scheduler
    // rc2: between scheduler and pre-calc stage of compressor
    // rc3: between pre-calc stage and done stage
    reg [5 : 0] rc1, rc2, rc3;   

    reg [54 : 0] block_counter;

    /******************* SIGNALS *******************/
    // Round counter 
    wire [5 : 0] rc0;       // (R)ound (c)ounter stage (n) (rcn)
    reg en_round_counter;
    reg reset_round_counter;
    // Round counter overflow - used to count once per block hash
    wire rc_of;

    // Block counter 
    reg en_block_counter;
    wire reset_block_counter;

    // State machine 
    wire first_block;

    // Hasher 
    reg hash_wen;
    reg init_hash;
    wire `WORD  hash0_to_comp, 
                hash1_to_comp, 
                hash2_to_comp, 
                hash3_to_comp, 
                hash4_to_comp, 
                hash5_to_comp, 
                hash6_to_comp, 
                hash7_to_comp;

    // Scheduler 
    wire `WORD scheduled_msg;   
    wire en_sch;
    wire load_sch;

    // Compressor 
    wire init_comp;
    reg en_comp;
    wire comp_done;
    wire `WORD  A_comp_to_hasher, 
                B_comp_to_hasher, 
                C_comp_to_hasher, 
                D_comp_to_hasher, 
                E_comp_to_hasher, 
                F_comp_to_hasher, 
                G_comp_to_hasher, 
                H_comp_to_hasher;

    // Padder 
    reg start_pad;
    wire en_pad;
    wire reset_pad;
    wire `WORD pad_w;
    wire pad_of;

    /******************* ASSIGNMENTS *******************/    
    // Round counter
    assign rc0 = round_counter;
    assign rc_of = (rc1 == 63) && (rc0 == 0);

    // Block counter
    assign cur_block = block_counter;
    assign reset_block_counter = reset;

    // Padder
    assign en_pad = 1;
    assign reset_pad = reset;

    // Scheduler
    assign en_sch = 1;
    assign load_sch = (rc1 <= 15);

    // Compressor
    assign init_comp = (rc2 == 0) && (rc3 == 0);
    assign penultimate_comp_done = (rc2 == 63);
    
    // output hash
    assign hash0 = hash0_to_comp;
    assign hash1 = hash1_to_comp;
    assign hash2 = hash2_to_comp;
    assign hash3 = hash3_to_comp;
    assign hash4 = hash4_to_comp;
    assign hash5 = hash5_to_comp;
    assign hash6 = hash6_to_comp;
    assign hash7 = hash7_to_comp;

    // output message word address - needs to fetch word for compressor pre-calculation
    assign block_offset = rc0;

    // assign first block control signal
    assign first_block = (cur_block == 0);

    // Padder instantiation
    padder pad_inst (
        .w_out(pad_w),
        .pad_of(pad_of),
        .w_in(w),
        .msg_size(msg_size),
        .offset(block_offset),
        .cur_block(cur_block),
        .en(en_pad),
        .reset(reset_pad),
        .start(start_pad),
        .clk(clk)
    );

    // Scheduler instantiation
    scheduler sch_inst (
        .sch_msg(scheduled_msg),
        .clk(clk),
        .en(en_sch),
        .load(load_sch),
        .msg(pad_w)
    );

    // Compressor instantiation
    compressor comp_inst (
        .A(A_comp_to_hasher),
        .B(B_comp_to_hasher),
        .C(C_comp_to_hasher),
        .D(D_comp_to_hasher),
        .E(E_comp_to_hasher),
        .F(F_comp_to_hasher),
        .G(G_comp_to_hasher),
        .H(H_comp_to_hasher),
        .done(comp_done),
        .clk(clk),
        .hash0(hash0_to_comp),
        .hash1(hash1_to_comp),
        .hash2(hash2_to_comp),
        .hash3(hash3_to_comp),
        .hash4(hash4_to_comp),
        .hash5(hash5_to_comp),
        .hash6(hash6_to_comp),
        .hash7(hash7_to_comp),
        .w(scheduled_msg),
        .cur_round(rc2),
        .en(en_comp),
        .init(init_comp)
    );

    // Hasher instantiation
    hasher hasher_inst (
        .hash0(hash0_to_comp),
        .hash1(hash1_to_comp),
        .hash2(hash2_to_comp),
        .hash3(hash3_to_comp),
        .hash4(hash4_to_comp),
        .hash5(hash5_to_comp),
        .hash6(hash6_to_comp),
        .hash7(hash7_to_comp),
        .clk(clk),
        .A(A_comp_to_hasher),
        .B(B_comp_to_hasher),
        .C(C_comp_to_hasher),
        .D(D_comp_to_hasher),
        .E(E_comp_to_hasher),
        .F(F_comp_to_hasher),
        .G(G_comp_to_hasher),
        .H(H_comp_to_hasher),
        .wen(hash_wen),
        .init(init_hash)
    );

    // current block update logic
    always @(posedge clk) begin
        if (reset_block_counter)
            block_counter <= 0;
        else begin
            if (en_block_counter)
                block_counter <= block_counter + 1;
        end
    end

    // Round counter logic
    always @(posedge clk) begin
        if (reset_round_counter) begin
            round_counter <= 0;
            finished_rounds <= 0;
        end
        else begin
            if (en_round_counter)
                round_counter <= round_counter + 1;
            
            if (rc_of)
                finished_rounds <= 1;
        end
    end

    // Round counter pipeline registers
    always @(posedge clk) begin
        rc1 <= rc0;
        rc2 <= rc1;
        rc3 <= rc2;
    end

    // state register update
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
    // next state function
    always @(*) begin
        next_state = state;

        case(state)
            STATE_IDLE: begin
                if (update)
                    next_state = STATE_INIT;
            end

            STATE_INIT:
                next_state = STATE_ROUND_CALC;

            STATE_ROUND_CALC: begin
                if (comp_done)
                    next_state = STATE_COMP_IMD_HASH;
            end

            STATE_COMP_IMD_HASH: begin
                if (pad_of)
                    next_state = STATE_INIT;
                else
                    next_state = STATE_DONE;
            end

            STATE_DONE: begin
                next_state = STATE_IDLE;
            end
        endcase
    end

    // state output function
    always @(*) begin
        en_round_counter = 0;
        reset_round_counter = 1;
        hash_wen = 0;
        init_hash = 0;
        en_comp = 0;
        start_pad = 0;
        en_block_counter = 0;
        done = 0;
        error = 0;

        case (state)
            STATE_IDLE: begin
                
            end

            STATE_INIT: begin
                // Round counter is reset
                // Load hasher with initial values if the first block
                if (first_block) begin
                    init_hash = 1;
                    hash_wen = 1;
                end
            end

            STATE_ROUND_CALC: begin
                reset_round_counter = 0;
                en_comp = 1;

                if (rc0 == 0)
                    start_pad = 1;

                if (!finished_rounds && !rc_of)
                    en_round_counter = 1;
            end

            STATE_COMP_IMD_HASH: begin
                hash_wen = 1;
                en_block_counter = 1;
            end

            STATE_DONE: begin
                done = 1;
            end

            default:
                error = 1;
        endcase
    end
endmodule