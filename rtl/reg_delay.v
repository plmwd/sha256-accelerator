`timescale 1ns / 1ps

module reg_delay #(parameter WIDTH = 32, NUM_DELAYS = 4) (
    output [WIDTH - 1 : 0] out,
    input clk,
    input [WIDTH - 1 : 0] in
    );

    reg [WIDTH - 1 : 0] delay [NUM_DELAYS - 1 : 0];

    assign out = delay[NUM_DELAYS - 1];

    integer i;
    always @(posedge clk) begin
        delay[0] <= in;

        for (i = 0; i < NUM_DELAYS - 1; i = i + 1) begin
            delay[i + 1] <= delay[i];
        end
    end

endmodule