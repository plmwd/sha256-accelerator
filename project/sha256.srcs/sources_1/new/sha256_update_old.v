`timescale 1ns / 1ps

`include "sha256types.vh"

// TODO: fix msg_addr width, should be 16 words, 64 bytes
// TODO: rename to "sha256_transform"
// TODO: (?) add signal indicating currently requesting data (reading) from msg block buffer 
module sha256_update(
    output `WORD hash0,
    output `WORD hash1,
    output `WORD hash2,
    output `WORD hash3,
    output `WORD hash4,
    output `WORD hash5,
    output `WORD hash6,
    output `WORD hash7,
    output [5:0] msg_addr, /* padded message word addr (64 words) */
    output reg done,
    
    input clk,
    input `WORD w,
    input update,
    input en,
    input first_block,
    input reset
    );

    // one-hot encoding
    localparam  STATE_INIT0 = 8'd1,
                STATE_INIT1 = 8'd2,
                STATE_LOAD_SCH = 8'd4,
                STATE_ROUND_CALC = 8'd8,
                STATE_FIN_ROUNDS = 8'd16,
                STATE_COMP_IMD_HASH = 8'd32,
                STATE_IDLE = 8'd64,
                STATE_DONE = 8'd128;

    reg [7:0] state, next_state;

    // round counter
    reg [5:0] round_counter;
    reg en_round_counter;
    reg round_counter_reset;
    wire [5:0] kval_addr_delay;

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

    // k constants
    // reg `WORD kvals [63:0];
    // always @(*) begin
    //     k = kvals[round_counter];
    // end

    // initial begin
    //     $readmemh("kvals.mem", kvals);
    // end

    
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
    assign msg_addr = round_counter;


    reg_delay #(
        .WIDTH(6),
        .NUM_DELAYS(1)
        )
        kval_addr_delay_inst (
        .out(kval_addr_delay),
        .clk(clk),
        .in(round_counter)
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
        .en(en_comp),
        .init(init_comp)
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
        .wen(hash_wen),
        .init(init_hash)
    );

    // round counter logic
    always @(posedge clk) begin
        if (round_counter_reset) 
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

            STATE_INIT0: begin
                next_state = STATE_INIT1;
            end

            STATE_INIT1: begin
                next_state = STATE_LOAD_SCH;
            end

            STATE_LOAD_SCH: begin
                // state doesnt change if <15
                if (round_counter >= 15)
                    next_state = STATE_ROUND_CALC;
            end

            STATE_ROUND_CALC: begin
                if (round_counter == 63)
                    next_state = STATE_FIN_ROUNDS;
            end

            STATE_FIN_ROUNDS: begin
                next_state = STATE_COMP_IMD_HASH;
            end

            STATE_COMP_IMD_HASH: begin
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
        round_counter_reset = 0;
        hash_wen = 0;
        init_hash = 0;
        en_sch = 0;
        load_sch = 0;
        init_comp = 0;
        en_comp = 0;
        done = 0;

        case (state)
            STATE_IDLE: begin
                round_counter_reset = 1;
            end

            STATE_INIT0: begin
                round_counter_reset = 1;
                init_hash = 1;
                
                if (first_block)
                    hash_wen = 1;
            end

            STATE_INIT1: begin
                en_sch = 1;
                load_sch = 1;
                init_comp = 1;
                en_comp = 1;
                en_round_counter = 1;
            end

            STATE_LOAD_SCH: begin
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

            STATE_FIN_ROUNDS: begin
                en_comp = 1;
                en_round_counter = 1;
            end

            STATE_COMP_IMD_HASH: begin
                hash_wen = 1;
            end

            STATE_DONE: begin
                done = 1;
            end
        endcase
    end

endmodule
