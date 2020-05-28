`timescale 1ns / 1ps

/**
* 
* Design Name: SHA256 Accelerator
* Module Name: hasher
* Project Name: sha256
* Target Devices: Basys3 (xc7a35tcpg236-1)
* Tool Versions: Vivado 2019.2
* Author: Paul Wood
* Description: The hasher houses the intermediate hash results and has circuitry for calculating the
*   new values.
* 
* Dependencies:
*   A encapsolating module with a controller (i.e. sha256_update) with...
*       > compressor.v
*   And, any other dependencies of the listed modules.
*
* Algorithm Documentation: https://csrc.nist.gov/publications/detail/fips/180/4/final
* Module Block Diagrams/Flowcharts: SHA256-HardwareImplementation.pdf 
* 
*/


`include "sha256types.vh"

module hasher(
    output reg `WORD hash0,
    output reg `WORD hash1,
    output reg `WORD hash2,
    output reg `WORD hash3,
    output reg `WORD hash4,
    output reg `WORD hash5,
    output reg `WORD hash6,
    output reg `WORD hash7,

    input clk,
    input `WORD A,
    input `WORD B,
    input `WORD C,
    input `WORD D,
    input `WORD E,
    input `WORD F,
    input `WORD G,
    input `WORD H,
    input wen,
    input init
    );

    wire `WORD  new_hash0, new_hash1, new_hash2, new_hash3, 
                new_hash4, new_hash5, new_hash6, new_hash7;

    // Calculation of new hash values using state registers from the compressor.
    assign new_hash0 = hash0 + A;
    assign new_hash1 = hash1 + B;
    assign new_hash2 = hash2 + C;
    assign new_hash3 = hash3 + D;
    assign new_hash4 = hash4 + E;
    assign new_hash5 = hash5 + F;
    assign new_hash6 = hash6 + G;
    assign new_hash7 = hash7 + H;


    // Since the new_hash signals will always be updating with values, the wen signal allows for controlling when to write to 
    // hash registers. The init signal allows the hash registers to be initialized with the initialization vectors defined in 
    // the algorithm documentation.
    always @(posedge clk) begin
        if (wen) begin
            if (init) begin
                hash0 <= 32'h6a09e667;
                hash1 <= 32'hbb67ae85;
                hash2 <= 32'h3c6ef372;
                hash3 <= 32'ha54ff53a;
                hash4 <= 32'h510e527f;
                hash5 <= 32'h9b05688c;
                hash6 <= 32'h1f83d9ab;
                hash7 <= 32'h5be0cd19;
            end
            else begin
                hash0 <= new_hash0;
                hash1 <= new_hash1;
                hash2 <= new_hash2;
                hash3 <= new_hash3;
                hash4 <= new_hash4;
                hash5 <= new_hash5;
                hash6 <= new_hash6;
                hash7 <= new_hash7;
            end
        end
    end
endmodule
