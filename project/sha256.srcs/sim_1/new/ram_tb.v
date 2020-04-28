`timescale 1ns / 1ps

module ram_tb();

localparam WIDTH = 32, SIZE = 32, PERIOD = 10;

/*************************************************************

                        SIGNALS

*************************************************************/
reg clk_t;
reg [$clog2(SIZE) - 1 : 0] raddr_t;
reg [$clog2(SIZE) - 1 : 0] waddr_t;
reg [WIDTH - 1 : 0] wdata_t;
reg wen_t, ren_t;

wire [WIDTH - 1 : 0] rdata_t;

/*************************************************************

                            TASKS

*************************************************************/
task sync_pos;
begin
    @(posedge clk_t);
end
endtask

task sync_neg;
begin
    @(negedge clk_t);
end
endtask

/*************************************************************

                          TESTCASES

*************************************************************/
task testcase1;
begin
    ren_t = 1;

    sync_pos();
    repeat(5) begin
        sync_neg();
        raddr_t = raddr_t + 1;
    end
end
endtask

task testcase2;
begin
    sync_pos();
    sync_neg();

    #1;

    ren_t = 1;
    wen_t = 1;

    raddr_t = 0;
    waddr_t = 0;

    wdata_t = 32'h69;
    sync_pos();
    sync_pos();
    sync_pos();

    $finish;
end
endtask

/*************************************************************

                        INITIALIZATION

*************************************************************/
initial begin
    raddr_t = 0;
    waddr_t = 0;
    wdata_t = 0;
    wen_t = 0;
    ren_t = 0;
end

/*************************************************************

                            DUT

*************************************************************/
ram #(
    .WORD_WIDTH(WIDTH), 
    .NUM_WORDS(SIZE),
    .INIT(1),
    .FILE("kvals.mem")
) DUT (
    rdata_t, 
    clk_t, 
    raddr_t, 
    waddr_t, 
    wdata_t, 
    wen_t
);

/*************************************************************

                            RUN TESTS

*************************************************************/
initial begin
    //testcase1();
    testcase2();
end

/*************************************************************

                           CLOCK

*************************************************************/
initial begin
    clk_t = 0;
    forever #(PERIOD / 2) clk_t = ~clk_t;
end
endmodule
