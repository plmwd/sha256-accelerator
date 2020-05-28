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
    input `WORD k,
    input en,
    input init
    );

    `include "sha256.vh";

    wire `WORD temp1, temp2;

    assign temp1 = H + k + w + SIGMA1(E) + ch(E, F, G);
    assign temp2 = SIGMA0(A) + maj(A, B, C);

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
                H <= hash7;
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
