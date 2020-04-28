`timescale 1ns / 1ps

// TODO: loop adding operations to only use 1 adder
//      will add control signals and clk

module imd_hash(
    output `WORD new_hash0,
    output `WORD new_hash1,
    output `WORD new_hash2,
    output `WORD new_hash3,
    output `WORD new_hash4,
    output `WORD new_hash5,
    output `WORD new_hash6,
    output `WORD new_hash7,
    
    input `WORD old_hash0,
    input `WORD old_hash1,
    input `WORD old_hash2,
    input `WORD old_hash3,
    input `WORD old_hash4,
    input `WORD old_hash5,
    input `WORD old_hash6,
    input `WORD old_hash7,
    input `WORD A, 
    input `WORD B, 
    input `WORD C, 
    input `WORD D, 
    input `WORD E, 
    input `WORD F, 
    input `WORD G, 
    input `WORD H
    );

    assign new_hash0 = old_hash0 + A;
    assign new_hash1 = old_hash1 + B;
    assign new_hash2 = old_hash2 + C;
    assign new_hash3 = old_hash3 + D;
    assign new_hash4 = old_hash4 + E;
    assign new_hash5 = old_hash5 + F;
    assign new_hash6 = old_hash6 + G;
    assign new_hash7 = old_hash7 + H;

endmodule
