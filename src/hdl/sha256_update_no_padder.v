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

module sha256_update_no_padder(
    output `WORD hash0,
    output `WORD hash1,
    output `WORD hash2,
    output `WORD hash3,
    output `WORD hash4,
    output `WORD hash5,
    output `WORD hash6,
    output `WORD hash7,
    output [3:0] block_offset, 
    output reg [54:0] cur_block,
    output done,
    output reg error,
    
    input clk,
    input `WORD w,
    input update,
    input en,
    input reset
    );

    // one-hot encoding
    localparam  STATE_IDLE = 9'd1,
                STATE_INIT0 = 9'd2,
                STATE_INIT1 = 9'd4,
                STATE_START = 9'd8,
                STATE_PREPROC_COMP = 9'd16,
                STATE_ROUND_CALC = 9'd32,
                STATE_COMP_IMD_HASH = 9'd64,
                STATE_DONE = 9'd128,
                STATE_ERROR = 9'd256;

    localparam  KVAL_ADDR_DELAY = 1,
                HASH_CONTROL_DELAY = 1,
                COMP_CONTROL_DELAY = 1,
                DONE_CONTROL_DELAY = 1;

    reg [8:0] state, next_state;

    // round counter
    reg [5:0] round_counter;
    reg en_round_counter;
    reg reset_round_counter;
    wire [5:0] kval_addr_delay;
    wire first_block;

    // current block counter
    reg en_cur_block_counter;

    // hasher wires
    reg hash_wen;
    reg init_hash;
    wire `WORD  hash0_to_comp, hash1_to_comp, hash2_to_comp, hash3_to_comp, 
                hash4_to_comp, hash5_to_comp, hash6_to_comp, hash7_to_comp;


    // scheduler wires
    wire `WORD scheduled_msg;   
    reg en_sch;
    reg load_sch;

    // compressor wires
    reg init_comp;
    reg en_comp;
    wire `WORD  k;
    wire `WORD  A_comp_to_hasher, 
                B_comp_to_hasher, 
                C_comp_to_hasher, 
                D_comp_to_hasher, 
                E_comp_to_hasher, 
                F_comp_to_hasher, 
                G_comp_to_hasher, 
                H_comp_to_hasher;

    // control signal delay wires
    wire en_comp_delayed;
    wire init_comp_delayed;
    wire done_delayed;

    reg done_control;

    // assign done output bit
    assign done = done_delayed;

    
    // output hash
    assign hash0 = hash0_to_comp;
    assign hash1 = hash1_to_comp;
    assign hash2 = hash2_to_comp;
    assign hash3 = hash3_to_comp;
    assign hash4 = hash4_to_comp;
    assign hash5 = hash5_to_comp;
    assign hash6 = hash6_to_comp;
    assign hash7 = hash7_to_comp;

    // output message word address 
    assign block_offset = round_counter;

    // assign first block control signal
    assign first_block = (cur_block == 0);


    reg_delay #(
        .WIDTH(6),
        .NUM_DELAYS(KVAL_ADDR_DELAY)
        )
        kval_addr_delay_inst (
        .out(kval_addr_delay),
        .clk(clk),
        .in(round_counter)
        );

    reg_delay #(
        .WIDTH(2),
        .NUM_DELAYS(HASH_CONTROL_DELAY)
        )
        hash_control_delays (
            .out({hash_wen_delayed, init_hash_delayed}),
            .in({hash_wen, init_hash}),
            .clk(clk)
        ); 

    reg_delay #(
        .WIDTH(1),
        .NUM_DELAYS(DONE_CONTROL_DELAY)
        )
        done_control_delay (
            .out(done_delayed),
            .in(done_control),
            .clk(clk)
        );

    reg_delay #(
        .WIDTH(2),
        .NUM_DELAYS(COMP_CONTROL_DELAY)
        )
        comp_control_delays (
            .out({en_comp_delayed, init_comp_delayed}),
            .in({en_comp, init_comp}),
            .clk(clk)
        );

    rom #(
        .WORD_WIDTH(32),
        .NUM_WORDS(64),
        .FILE("kvals.mem")
        ) 
        kvals (
        .out(k),
        .addr(kval_addr_delay)
        );

    scheduler sch_inst (
        .sch_msg(scheduled_msg),

        .clk(clk),
        .en(en_sch),
        .load(load_sch),
        .msg(w)
        );

    compressor comp_inst (
        .A(A_comp_to_hasher),
        .B(B_comp_to_hasher),
        .C(C_comp_to_hasher),
        .D(D_comp_to_hasher),
        .E(E_comp_to_hasher),
        .F(F_comp_to_hasher),
        .G(G_comp_to_hasher),
        .H(H_comp_to_hasher),

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
        .k(k),
        .en(en_comp_delayed),
        .init(init_comp_delayed)
        );

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
        .wen(hash_wen_delayed),
        .init(init_hash_delayed)
    );

    // current block update logic
    always @(posedge clk) begin
        if (reset)
            cur_block <= 0;
        else begin
            if (en_cur_block_counter)
                cur_block <= cur_block + 1;
        end
    end

    // round counter logic
    always @(posedge clk) begin
        if (reset_round_counter) 
            round_counter <= 0;
        else begin
            if (en_round_counter)
                round_counter <= round_counter + 1;
        end
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

    // next state function
    always @(*) begin
        next_state = state;

        case(state)
            STATE_IDLE: begin
                if (update)
                    next_state = STATE_INIT0;
            end

            STATE_INIT0:
                next_state = STATE_INIT1;

            STATE_INIT1:
                next_state = STATE_START;

            STATE_START:
                next_state = STATE_PREPROC_COMP;

            STATE_PREPROC_COMP: begin
                // state doesnt change if <15
                if (round_counter >= 15)
                    next_state = STATE_ROUND_CALC;
            end

            STATE_ROUND_CALC: begin
                if (round_counter == 63)
                    next_state = STATE_COMP_IMD_HASH;
            end

            STATE_COMP_IMD_HASH: 
                next_state = STATE_DONE;

            STATE_DONE: 
                next_state = STATE_IDLE;

            default:
                next_state = STATE_ERROR;       // requires reset
        endcase
    end

    // state output function
    always @(*) begin
        en_round_counter = 0;
        reset_round_counter = 0;
        hash_wen = 0;
        init_hash = 0;
        en_sch = 0;
        load_sch = 0;
        init_comp = 0;
        en_comp = 0;
        done_control = 0;
        en_cur_block_counter = 0;
        error = 0;

        case (state)
            STATE_IDLE: begin
                reset_round_counter = 1;
            end

            STATE_INIT0: begin
                // load inital hash values if the first block
                if(first_block) begin
                    hash_wen = 1;
                    init_hash = 1;
                end
            end

            STATE_INIT1: begin
                // load compressor with inital block hash values
                init_comp = 1;
                en_comp = 1;
            end

            STATE_START: begin
                en_sch = 1;
                load_sch = 1;
                en_comp = 1;
                en_round_counter = 1;
            end

            STATE_PREPROC_COMP: begin
                en_sch = 1;
                load_sch = 1;
                en_comp = 1;
                en_round_counter = 1;
            end

            STATE_ROUND_CALC: begin
                en_sch = 1;
                en_comp = 1;
                en_round_counter = 1;
            end

            STATE_COMP_IMD_HASH: begin
                hash_wen = 1;
                //en_cur_block_counter = 1;
            end

            STATE_DONE: begin
                done_control = 1;
                en_cur_block_counter = 1;
            end

            STATE_ERROR:
                error = 1;
            
            default:
                error = 1;
        endcase
    end

endmodule