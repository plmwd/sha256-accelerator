`timescale 1ns / 1ps

module scheduler_tb();

`include "sha256.vh";
`include "testbench.vh";

localparam PERIOD = 10;

/*************************************************************

                        SIGNALS

*************************************************************/
reg clk_t;
reg en_t;
reg load_t;
reg `WORD msgs [15:0];
reg [5:0] i;
reg `WORD expected_out [63:0]; 

wire `WORD sch_msg_t;
wire `WORD msg;

integer num_errors, vect_pass;

assign msg = msgs[i];


/*************************************************************

                        TASKS/FUNCTIONS

*************************************************************/


/*************************************************************

                          TESTCASES

*************************************************************/
task testcase1;
begin
    num_errors = 0;
    vect_pass = 1;
    i = 0;
    en_t = 1;
    load_t = 1;

    $display("\n\n----------------------------------------------------\n");
    $display("SCHEDULER TESTBENCH");
    $display("\n----------------------------------------------------\n");


    // load input vectors
    $readmemh("scheduler_vect_input.mem", msgs);

    // load expected output
    $readmemh("scheduler_vect_output.mem", expected_out);

    // load first 16 (see SHA256 doc)
    // input next msg and 
    for(i = 0; i < 16; i = i + 1) begin
        sync_pos();

        // wait 1 to do error checking not on the signal edge
        #1;
        if ((sch_msg_t !== expected_out[i]) || (^sch_msg_t === 1'bx)) begin
            num_errors = num_errors + 1;
            $display("Vector %d failed!", i);
            $display("Expected: %h, got: %h", expected_out[i], sch_msg_t);
        end 
    end

    load_t = 0;

    repeat(48) begin
        sync_pos();

        // wait 1 to do error checking not on the signal edge
        #1;

        //$display("in: %h, out: %h, exp: %h", msg, sch_msg_t, expected_out[i]);
        //$display("%h", ^sch_msg_t);

        if ((sch_msg_t !== expected_out[i]) || (^sch_msg_t === 1'bx)) begin
            num_errors = num_errors + 1;
            $display("Vector %d failed!", i);
            $display("Expected: %h, got: %h", expected_out[i], sch_msg_t);
        end

        i = i + 1;
    end

    sync_pos();

    $display("Finished with %d errors.", num_errors);
    $display("\n----------------------------------------------------\n");

    $finish;
end
endtask


/*************************************************************

                        INITIALIZATION

*************************************************************/
initial begin
    en_t = 0;
    load_t = 0;
    i = 0;
    num_errors = 0;
    vect_pass = 1;
end

/*************************************************************

                            DUT

*************************************************************/
scheduler DUT (
    .sch_msg(sch_msg_t),
    .clk(clk_t),
    .en(en_t),
    .load(load_t),
    .msg(msg)
);

/*************************************************************

                            RUN TESTS

*************************************************************/
initial begin
    testcase1();
    //testcase2();
end

/*************************************************************

                           CLOCK

*************************************************************/
initial begin
    clk_t = 0;
    forever #(PERIOD / 2) clk_t = ~clk_t;
end

endmodule
