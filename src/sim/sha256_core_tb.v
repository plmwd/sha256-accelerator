`timescale 1ns / 1ps

module sha256_core_tb();

    `include "sha256types.vh";
    `include "testbench.vh";

    localparam  PERIOD = 10,
                TIMEOUT = 100000;


    localparam MSG_BUFFER_SIZE = 64;

    /*************************************************************

                            SIGNALS

    *************************************************************/
    wire `LONG msg_size_t;
    reg [$clog2(MSG_BUFFER_SIZE) - 1 : 0] write_addr_t;
    reg `WORD write_word_t;
    reg msg_buffer_wen_t;
    reg start_t;
    reg reset_t;
    reg en_t;
    reg clk_t;

    wire `WORD hash_t [7:0];
    wire done_t;

    reg `WORD input_vects [MSG_BUFFER_SIZE : 0];
    reg `WORD output_vects [MSG_BUFFER_SIZE - 1 : 0];

    integer i, hashes_match;

    assign msg_size_t = input_vects[0];


    /*************************************************************

                            TASKS

    *************************************************************/
    task load_buffer;
    begin
        msg_buffer_wen_t = 1;

        for (i = 1; i < MSG_BUFFER_SIZE; i = i + 1) begin
            write_word_t = input_vects[i];
            write_addr_t = i - 1;

            sync_pos();
        end

        msg_buffer_wen_t = 0;
    end
    endtask


    task reset_core;
    begin
        reset_t = 1;
        sync_pos();
        #1 reset_t = 0;
    end
    endtask;


    task compute_hash;
    begin
        start_t = 1;
        sync_pos();
        #1 start_t = 0;

        wait(done_t == 1'b1);
    end
    endtask

    
    task compare_hashes;
    begin
        hashes_match = 1;

        for (i = 0; i < 8; i = i + 1) begin
            if (hash_t[i] !== output_vects[i])
                hashes_match = 0;
        end

        if (hashes_match)
            $display("Hash computation: SUCCESS.");
        else
            $display("Hash computation: FAIL!");
    end
    endtask


    task display_hashes;
    begin

        $display("Expected:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", output_vects[i]);
        end
        $display();

        $display("Got:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", hash_t[i]);
        end
        $display();
    end
    endtask

    /*************************************************************

                                DUT

    *************************************************************/
    sha256_core #(
        .MSG_BUFFER_SIZE(MSG_BUFFER_SIZE)
        )
        DUT (
        .hash0(hash_t[0]),
        .hash1(hash_t[1]),
        .hash2(hash_t[2]),
        .hash3(hash_t[3]),
        .hash4(hash_t[4]),
        .hash5(hash_t[5]),
        .hash6(hash_t[6]),
        .hash7(hash_t[7]),
        .done(done_t),

        .msg_buffer_wen(msg_buffer_wen_t),
        .write_addr(write_addr_t),
        .write_word(write_word_t),
        .msg_size(msg_size_t),
        .start(start_t),
        .reset(reset_t),
        .en(en_t),
        .update(),
        .clk(clk_t)
        );
 

    /*************************************************************

                            TESTCASES

    *************************************************************/
    task testcase1;
    begin
        $display("\n----------------------------------------------------------------------\n");
        $display("SHA256_CORE TEST CASE 1 ");
        $display("\n----------------------------------------------------------------------\n");   
        
        $readmemh("update_vect_input0.mem", input_vects);
        $readmemh("update_vect_output0.mem", output_vects);

        en_t = 1;
        reset_core();
        load_buffer();

        compute_hash();

        display_hashes();
        compare_hashes();

        $display("\n----------------------------------------------------------------------\n");
    end
    endtask


    task testcase2;
    begin
        $display("\n----------------------------------------------------------------------\n");
        $display("SHA256_CORE TEST CASE 2 ");
        $display("\n----------------------------------------------------------------------\n");   
        
        $readmemh("update_vect_input1.mem", input_vects);
        $readmemh("update_vect_output1.mem", output_vects);

        en_t = 1;
        reset_core();
        load_buffer();

        compute_hash();

        display_hashes();
        compare_hashes();

        $display("\n----------------------------------------------------------------------\n");
    end
    endtask


    task testcase3;
    begin
        $display("\n----------------------------------------------------------------------\n");
        $display("SHA256_CORE TEST CASE 3 ");
        $display("\n----------------------------------------------------------------------\n");   
        
        $readmemh("update_vect_input2.mem", input_vects);
        $readmemh("update_vect_output2.mem", output_vects);

        en_t = 1;
        reset_core();
        load_buffer();

        compute_hash();

        display_hashes();
        compare_hashes();

        $display("\n----------------------------------------------------------------------\n");
    end
    endtask


    /*************************************************************

                            INITIALIZATION

    *************************************************************/
    initial begin
        write_addr_t = 0;
        write_word_t = 0;
        msg_buffer_wen_t = 0;
        start_t = 0;
        en_t = 0;
    end

    /*************************************************************

                                RUN TESTS

    *************************************************************/
    initial begin
        testcase1();
        testcase2();
        testcase3();

        #10;
        $finish;
    end


    /*************************************************************

                            CLOCK

    *************************************************************/
    initial begin
        clk_t = 0;
        forever 
            #(PERIOD / 2) clk_t = ~clk_t;
    end

    /*************************************************************

                            TIMEOUT

    *************************************************************/
    initial begin
        #(TIMEOUT);
        $display("Simulation timed out!");
        $finish();
    end

endmodule
