/**
* 
* Design Name: SHA256 Accelerator
* Module Name: scheduler
* Project Name: sha256
* Target Devices: Basys3 (xc7a35tcpg236-1)
* Tool Versions: Vivado 2019.2
* Author: Paul Wood
* Description: The scheduler does the message scheduling of the SHA256 algorithm (transform the 16 message words
*   into 64 words). Since the scheduling algorithm only needs to reference i - 16th word in the schedule, a circular
*   buffer is used. The circular buffer is 16 32-bit register deep and the registers are initialized by setting the
*   "load" signal and sequentially inputting preprocessed message block words starting with i = 0 to i = 15. Next,
*   to finish the scheduling computation, the "load" signal should be cleared leaving the scheduler in an enabled
*   state. On each clock cycle, the scheduler will perform the computations and it is up to the top controller
*   to finish at i = 63.
*
* Dependencies:
*   A encapsolating module with a controller (i.e. sha256_update) with...
*       > scheduler.v
*       > compressor.v
*       > padder.v
*   And, any other dependencies of the listed modules.
*   
* 
* Algorithm Documentation: https://csrc.nist.gov/publications/detail/fips/180/4/final
* Module Block Diagrams/Flowcharts: SHA256-HardwareImplementation.pdf 
*
*/

`include "sha256types.vh"

module scheduler (
    output `WORD sch_msg,
    input clk,
    input en,
    input load,
    input `WORD msg
);
`include "sha256.vh";

//TODO: pipeline critical path (3 series additions)

// Parameters
localparam NUM_REGS = MSG_BLOCK_SIZE / WORD_WIDTH;


// Signals
// index 0 is most recent while index NUM_REGS - 1 is the oldest
// before next clock cycle w(t-16) is cir_buf[15]
reg [WORD_WIDTH - 1 : 0] cir_buf [NUM_REGS - 1 : 0];
wire `WORD sch_calc;

// Scheduled message output
assign sch_msg = cir_buf[0];

// Scheduled message calculation
assign sch_calc = sigma0(cir_buf[15 - 1]) + sigma1(cir_buf[2 - 1]) + cir_buf[7 - 1] + cir_buf[16 - 1];


// Load first register in circular buffer with an input word or calculated word
always @(posedge clk) begin
    if (en) begin
        cir_buf[0] <= (load) ? msg : sch_calc;
    end
end

// Circulate the registers
integer i;
always @(posedge clk) begin
    if (en) begin
        for (i = 0; i < NUM_REGS - 1; i = i + 1) begin
            cir_buf[i + 1] <= cir_buf[i];
        end
    end
end

endmodule