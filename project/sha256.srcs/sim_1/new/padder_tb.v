`timescale 1ns / 1ps

module padder_tb();

    `include "sha256types.vh";
    `include "testbench.vh";

    localparam PERIOD = 10;


    /*************************************************************

                            SIGNALS

    *************************************************************/
    localparam NUM_BLOCKS = 2;

    reg clk_t;
    wire `WORD w_in_t;
    wire `LONG msg_size_t;
    reg [3:0] offset_t;
    reg [52:0] cur_block_t;
    reg en_t;
    reg reset_t;
    reg start_t;

    wire `WORD w_out_t;
    wire pad_of_t;

    //reg `WORD read_input_vects [16:0];
    reg `WORD input_vects [63:0];
    reg `WORD output_vects [63:0];
    
    integer i, num_errors;


    // assign output 
    assign w_in_t = input_vects[i + 1];

    assign msg_size_t = input_vects[0];

    /*************************************************************

                            TASKS

    *************************************************************/
    task verify_output;
    begin
        if (w_out_t !== output_vects[i]) begin
            num_errors = num_errors + 1;
            $display("Vector %0d FAILED!", i);
            $display("\tExpected: %h\n\tgot: %h", output_vects[i], w_out_t);
        end
        else 
            $display("Vector %0d PASSED.", i);
    end
    endtask;

    /*************************************************************

                            TESTCASES

    *************************************************************/
    task testcase1;
    begin
        $display("\n\n----------------------------------------------------------------------\n");
        $display("PADDER TESTBENCH TESTCASE 1");
        $display("\n----------------------------------------------------------------------\n\n");

        // load input vects - should be 16 starting after the message size in bytes (hex format)
        $readmemh("padder_vect_input0.mem", input_vects);

        // load expected output vects - should be 16 starting on the first line
        $readmemh("padder_vect_output0.mem", output_vects);

        i = 0;
        num_errors = 0;

        en_t = 1;
        cur_block_t = 0;

        // reset padder to known state - IDLE
        reset_t = 1;
        sync_pos();
        sync_neg();
        reset_t = 0;
        
        // start padder
        start_t = 1;

        for (i = 0; i < 16; i = i + 1) begin
            sync_pos();

            // check output after the signal edge
            sync_neg();
            verify_output();
        end

        start_t = 0;

        $display("\n Finished with %0d errors.", num_errors);

        $display("\n----------------------------------------------------------------------\n\n");

        repeat(2) 
            sync_pos();
    end
    endtask

    task testcase2;
    begin
        $display("\n\n----------------------------------------------------------------------\n");
        $display("PADDER TESTBENCH TESTCASE 2");
        $display("\n----------------------------------------------------------------------\n\n");

        // load input vects - should be 16 starting after the message size in bytes (hex format)
        $readmemh("padder_vect_input1.mem", input_vects);

        // load expected output vects - should be 16 starting on the first line
        $readmemh("padder_vect_output1.mem", output_vects);

        i = 0;
        num_errors = 0;

        en_t = 1;
        cur_block_t = 0;

        // reset padder to known state - IDLE
        reset_t = 1;
        sync_pos();
        sync_neg();
        reset_t = 0;
        
        // start padder
        start_t = 1;

        $display("Padded message block 0");

        // input msg
        for (i = 0; i < 16; i = i + 1) begin
            sync_pos();

            // check output after the signal edge
            sync_neg();
            verify_output();
            start_t = 0;
        end

        en_t = 0;

        // test OF_PAD_IDLE state to see if it idles
        sync_pos();
        sync_pos();
        sync_neg();
        start_t = 1;
        en_t = 1;


        $display("\nPadded message block 1");
        cur_block_t = 1;

        // should output overflow padding in new message
        // iterate through i to make sure w_in_t doesnt go to output
        for (i = 16; i < 32; i = i + 1) begin
            sync_pos();

            // check output after the signal edge
            sync_neg();
            verify_output();
            start_t = 0;
        end

        $display("\n Finished with %0d errors.", num_errors);

        $display("\n----------------------------------------------------------------------\n\n");

        repeat(2) 
            sync_pos();
    end
    endtask

    /*************************************************************

                            DUT

    *************************************************************/
    padder #(
        .ADDR_WIDTH($clog2(NUM_BLOCKS) + 4)
    ) 
    DUT (
        .w_out(w_out_t),
        .pad_of(pad_of_t),
        
        .w_in(w_in_t),
        .msg_size(msg_size_t),
        .offset(i[3:0]),
        .cur_block(cur_block_t),
        .en(en_t),
        .reset(reset_t),
        .start(start_t),
        .clk(clk_t)
    );


    /*************************************************************

                            INITIALIZATION

    *************************************************************/
    initial begin
        en_t = 0;
        reset_t = 0;
        start_t = 0;
        offset_t = 0;
        cur_block_t = 0;

        i = 0;
        num_errors = 0;
    end

    /*************************************************************

                            RUN TESTS

    *************************************************************/
    initial begin
        testcase1();
        testcase2();

        $finish;
    end


    /*************************************************************

                            CLOCK

    *************************************************************/
    initial begin
        clk_t = 0;
        forever #(PERIOD / 2) clk_t = ~clk_t;
    end

endmodule
