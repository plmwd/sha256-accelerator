`timescale 1ns / 1ps

module sha256_update_no_padder_tb();
`include "sha256types.vh";
    `include "testbench.vh";

    localparam PERIOD = 10;

    /*************************************************************

                            SIGNALS

    *************************************************************/
    reg clk_t;
    reg update_t;
    reg en_t;
    reg reset_t;
    wire `WORD hash [7:0];
    wire [3:0] block_offset_t;
    wire [52:0] cur_block_t;
    wire done_t;
    wire error_t;

    wire [5:0] addr;

    reg `WORD input_vects [63:0];
    reg `WORD expected_hash [7:0];

    integer i, hashes_match;

    assign addr = {cur_block_t, block_offset_t};


    /*************************************************************

                                DUT

    *************************************************************/
    sha256_update_no_padder DUT (
        .hash0(hash[0]),
        .hash1(hash[1]),
        .hash2(hash[2]),
        .hash3(hash[3]),
        .hash4(hash[4]),
        .hash5(hash[5]),
        .hash6(hash[6]),
        .hash7(hash[7]),
        .block_offset(block_offset_t),
        .cur_block(cur_block_t),
        .done(done_t),
        .error(error_t),

        .clk(clk_t),
        .w(input_vects[addr]),
        .update(update_t),
        .en(en_t),
        .reset(reset_t)
    );

    /*************************************************************

                            TESTCASES

    *************************************************************/
    task testcase1;
    begin
        $display("\n\n----------------------------------------------------------------------\n");
        $display("SHA256_UPDATE TEST CASE 1 ");
        $display("\n----------------------------------------------------------------------\n");   
        
        $readmemh("padder_vect_output0.mem", input_vects);
        $readmemh("vect_output_abc.mem", expected_hash);

        // $readmemh("update_vect_input1.mem", input_vects);
        // $readmemh("update_vect_output1.mem", expected_hash);

        i = 0;

        hashes_match = 1;

        reset_t = 1;
        sync_pos();
        sync_neg();
        reset_t = 0;

        en_t = 1;
        update_t = 1;
        sync_neg();
        update_t = 0;

        // wait for the hash computation to finish
        wait(done_t == 1'b1);
        #3;

        // print expected and calculated hash
        $display("Expected hash:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", expected_hash[i]);
        end
        $display();

        $display("Calculated hash:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", hash[i]);
        end
        $display();

        // compare the hashes
        for (i = 0; i < 8; i = i + 1) begin
            if (expected_hash[i] !== hash[i]) begin
                hashes_match = 0;
                $display("Error: invalid hash: %d", i);
                $display("\tExpected: %h\n\tGot: %h", expected_hash[i], hash[i]);
            end
        end

        if (hashes_match) 
            $display("Hash calculation: SUCCESS");
        else 
            $display("Hash calculation: FAIL");

        $display("\n----------------------------------------------------------------------\n");
    end
    endtask


    task testcase2;
    begin
        $display("\n\n----------------------------------------------------------------------\n");
        $display("SHA256_UPDATE TEST CASE 2");
        $display("\n----------------------------------------------------------------------\n");   
        
        $readmemh("padder_vect_output1.mem", input_vects);
        $readmemh("update_vect_output1.mem", expected_hash);

        // $readmemh("update_vect_input1.mem", input_vects);
        // $readmemh("update_vect_output1.mem", expected_hash);

        i = 0;

        hashes_match = 1;

        reset_t = 1;
        sync_pos();
        sync_neg();
        reset_t = 0;

        en_t = 1;
        for (i = 0; i < 2; i = i + 1) begin
            update_t = 1;
            sync_neg();
            update_t = 0;

            // wait for the hash computation to finish
            wait(done_t == 1'b1);
            sync_neg();
        end
        #3;

        // print expected and calculated hash
        $display("Expected hash:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", expected_hash[i]);
        end
        $display();

        $display("Calculated hash:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", hash[i]);
        end
        $display();

        // compare the hashes
        for (i = 0; i < 8; i = i + 1) begin
            if (expected_hash[i] !== hash[i]) begin
                hashes_match = 0;
                $display("Error: invalid hash: %d", i);
                $display("\tExpected: %h\n\tGot: %h", expected_hash[i], hash[i]);
            end
        end

        if (hashes_match) 
            $display("Hash calculation: SUCCESS");
        else 
            $display("Hash calculation: FAIL");

        $display("\n----------------------------------------------------------------------\n");
    end
    endtask


    task testcase3;
    begin
        $display("\n\n----------------------------------------------------------------------\n");
        $display("SHA256_UPDATE TEST CASE 3");
        $display("\n----------------------------------------------------------------------\n");   
        
        $readmemh("padder_vect_output2.mem", input_vects);
        $readmemh("update_vect_output2.mem", expected_hash);

        // $readmemh("update_vect_input1.mem", input_vects);
        // $readmemh("update_vect_output1.mem", expected_hash);

        i = 0;

        hashes_match = 1;

        reset_t = 1;
        sync_pos();
        sync_neg();
        reset_t = 0;

        en_t = 1;
        for (i = 0; i < 3; i = i + 1) begin
            update_t = 1;
            sync_neg();
            update_t = 0;

            // wait for the hash computation to finish
            wait(done_t == 1'b1);
            sync_neg();
        end
        #3;

        // print expected and calculated hash
        $display("Expected hash:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", expected_hash[i]);
        end
        $display();

        $display("Calculated hash:");
        for (i = 0; i < 8; i = i + 1) begin
            $write("%h", hash[i]);
        end
        $display();

        // compare the hashes
        for (i = 0; i < 8; i = i + 1) begin
            if (expected_hash[i] !== hash[i]) begin
                hashes_match = 0;
                $display("Error: invalid hash: %d", i);
                $display("\tExpected: %h\n\tGot: %h", expected_hash[i], hash[i]);
            end
        end

        if (hashes_match) 
            $display("Hash calculation: SUCCESS");
        else 
            $display("Hash calculation: FAIL");

        $display("\n----------------------------------------------------------------------\n");
    end
    endtask

    task testcase4;
    begin
        $display("\n\n----------------------------------------------------------------------\n");
        $display("SHA256_UPDATE TEST CASE 4");
        $display("\n----------------------------------------------------------------------\n");

        i = 0;

        hashes_match = 1;

        reset_t = 1;
        sync_pos();
        sync_neg();
        reset_t = 0;

        en_t = 1;
        update_t = 1;
        sync_neg();
        update_t = 0;

        // force bad state to test it reaching error state
        DUT.state = 10'b1111111111;
        sync_pos();
        sync_neg();
        if (error_t === 1) 
            $display("SUCCESSFULLY TRAPPED IN ERROR STATE");
        else
            $display("FAILED TO TRAP IN ERROR STATE");

        $display("\n----------------------------------------------------------------------\n");
    end
    endtask;

    /*************************************************************

                            INITIALIZATION

    *************************************************************/
    initial begin
        en_t = 0;
        reset_t = 0;
        i = 0;
        hashes_match = 0;
    end

    /*************************************************************

                                RUN TESTS

    *************************************************************/
    initial begin
        testcase1();
        testcase2();
        testcase3();
        testcase4();

        #10;
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
