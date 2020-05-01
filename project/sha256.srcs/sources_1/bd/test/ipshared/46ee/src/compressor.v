`timescale 1ns / 1ps

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
