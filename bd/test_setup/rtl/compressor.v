`timescale 1ns / 1ps
/**
* 
* Design Name: SHA256 Accelerator
* Module Name: compressor
* Project Name: sha256
* Target Devices: Basys3 (xc7a35tcpg236-1)
* Tool Versions: Vivado 2019.2
* Author: Paul Wood
* Description: The compressor sequentially calculates the 64 rounds in the SHA256 algorithm. It transforms 16 32-bit words into 8 words.
*   On each clock that the module in enabled, the compressor will take in the ith W and k value and perform the round calculation.
*   First, the compressor must be initialized with the initial hash values (previous hash or IV) from the hasher module. Next, on
*   the next cycle where init is not set, the compressor will be calculating the i = 0 round, the next cycle the i = 1 round, and so
*   on until i = 63. It is assumed that the correct ith value for W and k are inputted to the module for the corresponding cycle. This
*   is to simplify the control and management of the state of the intermediate hash computation- the state machine and counters are 
*   located in a central module encapsolating all modules to perform an intermediate hash (sha256_update).
* 
* Dependencies:
*   A encapsolating module with a controller (i.e. sha256_update) with...
*       > scheduler.v
*       > hasher.v
*       > ROM with k values
*       > counters indicating the state of the hash (which word is being fetched in the message block)
*   And, any other dependencies of the listed modules.
*
* Algorithm Documentation: https://csrc.nist.gov/publications/detail/fips/180/4/final
* Module Block Diagrams/Flowcharts: SHA256-HardwareImplementation.pdf 
* 
*/

`include "sha256types.vh"

module compressor (
    output reg `WORD A,
    output reg `WORD B,
    output reg `WORD C,
    output reg `WORD D,
    output reg `WORD E,
    output reg `WORD F,
    output reg `WORD G,
    output reg `WORD H,
    output reg done,

    input clk,
    input `WORD hash0,
    input `WORD hash1,
    input `WORD hash2,
    input `WORD hash3,
    input `WORD hash4,
    input `WORD hash5,
    input `WORD hash6,
    input `WORD hash7,
    input `WORD w,
    input [5 : 0] cur_round,
    input en,
    input init
    );

    `include "sha256.vh";

    /******************* REGISTERS *******************/
    reg `WORD pre_calc_ps;
    reg `WORD pre_calc_sc;
    reg `WORD pre_calc;

    /******************* SIGNALS *******************/
    wire `WORD k;
    wire `WORD temp1, temp2;
    wire `WORD csa_state_input;
    wire `WORD csa_ps;
    wire `WORD csa_sc;
    wire penultimate_comp_done;

    /******************* ASSIGNMENTS *******************/  
    assign penultimate_done = (cur_round == 63); 
    assign temp1 = (pre_calc + SIGMA1(E) + ch(E, F, G));
    // assign temp1 = (pre_calc_ps + pre_calc_sc) + (SIGMA1(E) + ch(E, F, G));
    assign temp2 = SIGMA0(A) + maj(A, B, C);
    assign csa_state_input = (init) ? hash7 : G;

    // carry_save_adder # (
    //     .WIDTH(32)
    // ) csa_inst (
    //     .num0(csa_state_input),
    //     .num1(k),
    //     .num2(w),
    //     .partial_sum(csa_ps),
    //     .saved_carrys(csa_sc)
    // );

    // k-values ROM
    rom #(
        .WORD_WIDTH(32),
        .NUM_WORDS(64),
        .FILE("kvals.mem")
    ) kvals (
        .out(k),
        .addr(cur_round)
    );

    always @(posedge clk) begin
        // pre_calc_ps <= csa_ps;
        // pre_calc_sc <= csa_sc;
        pre_calc <= csa_state_input + w + k;

        done <= penultimate_done;
    end

    // Compressor register logic
    // The algorithm requires that the state registers (A...H) be initialized with the initial vectors or the previous hash
    // values before the 64 rounds can commence. The hash values are stored (along with the inital vectors) in the hasher
    // module. The signal, init, acts as a reset to the module since the state registers never need to be cleared with a 
    always @(posedge clk) begin
        if (en) begin
            if(init) begin
                A <= hash0;
                B <= hash1;
                C <= hash2;
                D <= hash3;
                E <= hash4;
                F <= hash5;
                G <= hash6;
            end
            else begin
                A <= temp1 + temp2;
                B <= A;
                C <= B;
                D <= C;
                E <= D + temp1;
                F <= E;
                G <= F;
                H <= G;
            end
        end
    end
endmodule
