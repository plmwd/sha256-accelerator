`timescale 1ns / 1ps

// module test(
//     output [31:0] out,
//     input [31:0] in
//     );

//     `define ROTR32(n, sh) {n[sh - 1 : 0], n[31 : sh]}

//     function [31:0] sigma0;
//     input [31 : 0] w;

//     begin
//         sigma0 = (`ROTR32(w, 1)) ^ (`ROTR32(w, 8)) ^ (w >> 7);
//     end
//     endfunction

//     assign out = sigma0(in);

// endmodule

module test #(parameter LIMIT_ADDR_WIDTH = 0, NUM_ELEMENTS = 32) (
    output reg [31:0] out,
    input [2:0] in,
    input clk
    );

    reg [31:0] ram [7:0];

    always @(posedge clk) begin
        out <= ram[in];
    end

endmodule