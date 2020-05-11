module ram #(parameter WORD_WIDTH = 32, NUM_WORDS = 32, INIT = 0, FILE = 0) (
    output [WORD_WIDTH - 1 : 0] rdata,
    input clk,
    input [$clog2(NUM_WORDS) - 1 : 0] raddr,
    input [$clog2(NUM_WORDS) - 1 : 0] waddr,
    input [WORD_WIDTH - 1 : 0] wdata,
    input wen
);

reg [WORD_WIDTH - 1 : 0] ram [NUM_WORDS - 1 : 0];

assign rdata = ram[raddr];

// always @(posedge rclk) begin
//     if (read_en) begin
//         rdata <=ram[raddr];
//     end
// end

always @(negedge clk) begin
    if (wen) begin
        ram[waddr] <= wdata;
    end
end

initial begin
    if (INIT == 1) begin
        $readmemh(FILE, ram, 0, NUM_WORDS - 1);
    end
end

endmodule