`timescale 1ns / 1ps

module carry_save_adder(
    input wire [WIDTH - 1 : 0] num0,
    input wire [WIDTH - 1 : 0] num1,
    input wire [WIDTH - 1 : 0] num2,
    output wire [WIDTH - 1 : 0] partial_sum,
    output wire [WIDTH - 1 : 0] saved_carrys
    );

    parameter WIDTH = 32;

    genvar fa;

    for (fa = 0; fa < WIDTH; fa = fa + 1) begin : fa_inst
        full_adder fa (
            .a(num0[fa]),
            .b(num1[fa]),
            .c_in(num2[fa]),
            .s(partial_sum[fa]),
            .c_out(saved_carrys[fa])
        );
    end

endmodule
