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

/*************************************************************

                           PARAM

*************************************************************/
localparam NUM_REGS = MSG_BLOCK_SIZE / WORD_WIDTH;


/*************************************************************

                        REGS AND WIRES

*************************************************************/
// index 0 is most recent while index NUM_REGS - 1 is the oldest
// before next clock cycle w(t-16) is cir_buf[15]
reg [WORD_WIDTH - 1 : 0] cir_buf [NUM_REGS - 1 : 0];

wire `WORD sch_calc;


/*************************************************************

                            OUTPUT

*************************************************************/
assign sch_msg = cir_buf[0];


/*************************************************************

                COMPUTE SCHEDULE CALCULATION

*************************************************************/
assign sch_calc = sigma0(cir_buf[15 - 1]) + sigma1(cir_buf[2 - 1]) + cir_buf[7 - 1] + cir_buf[16 - 1];


/*************************************************************

                     LOAD OR CIRCULATE

*************************************************************/
always @(posedge clk) begin
    if (en) begin
        cir_buf[0] <= (load) ? msg : sch_calc;
    end
end


/*************************************************************

                        CIRCULAR BUFFER

*************************************************************/
integer i;
always @(posedge clk) begin
    if (en) begin
        for (i = 0; i < NUM_REGS - 1; i = i + 1) begin
            cir_buf[i + 1] <= cir_buf[i];
        end
    end
end

endmodule