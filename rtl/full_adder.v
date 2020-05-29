`timescale 1ns / 1ps

module full_adder(
    input wire a,
    input wire b,
    input wire c_in,
    output wire s,
    output wire c_out
    );

    wire partial_sum;
    wire partial_carry1, partial_carry2;

    assign c_out = partial_carry1 | partial_carry2;

    half_adder HA0 (
        .a(a),
        .b(b),
        .c(partial_carry1),
        .s(partial_sum)
    );

    half_adder HA1 (
        .a(partial_sum),
        .b(c_in),
        .c(partial_carry2),
        .s(s)
    );
endmodule
