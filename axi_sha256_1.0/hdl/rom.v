`timescale 1ns / 1ps

`include "sha256types.vh"

module rom #(parameter WORD_WIDTH = 32, NUM_WORDS = 4, FILE = "default.mem") (
    output reg [WORD_WIDTH - 1 : 0] out,
    input [$clog2(NUM_WORDS) - 1 : 0] addr
    );

    reg [WORD_WIDTH - 1 : 0] rom [NUM_WORDS - 1 : 0];

    initial begin
        $readmemh(FILE, rom);
    end

    always @(*) begin
        out = rom[addr];
    end

endmodule
