`timescale 1ns / 1ps

module compressor_tb();

`include "sha256.vh";
`include "testbench.vh";

localparam PERIOD = 10;

// testbench for sha256 of a 1 block message - "abc"
// test vectors generated from debug of C program

/*************************************************************

                        SIGNALS

*************************************************************/
reg clk_t;
reg en_t;
reg init_t;
reg `WORD msgs [63:0];
reg [5:0] i;
reg `WORD expected_out_A [63:0]; 
reg `WORD expected_out_B [63:0]; 
reg `WORD expected_out_C [63:0]; 
reg `WORD expected_out_D [63:0]; 
reg `WORD expected_out_E [63:0]; 
reg `WORD expected_out_F [63:0]; 
reg `WORD expected_out_G [63:0]; 
reg `WORD expected_out_H [63:0]; 

wire `WORD A_t;
wire `WORD B_t;
wire `WORD C_t;
wire `WORD D_t;
wire `WORD E_t;
wire `WORD F_t;
wire `WORD G_t;
wire `WORD H_t;
wire `WORD msg;

integer num_errors, vect_pass;

assign msg = msgs[i];

reg `WORD kvals [63:0];


/*************************************************************

                            DUT

*************************************************************/
compressor DUT (
    .A(A_t),
    .B(B_t),
    .C(C_t),
    .D(D_t),
    .E(E_t),
    .F(F_t),
    .G(G_t),
    .H(H_t),

    .clk(clk_t),
    .hash0(32'h6a09e667),
    .hash1(32'hbb67ae85),
    .hash2(32'h3c6ef372),
    .hash3(32'ha54ff53a),
    .hash4(32'h510e527f),
    .hash5(32'h9b05688c),
    .hash6(32'h1f83d9ab),
    .hash7(32'h5be0cd19),
    .w(msg),
    .k(kvals[i]),
    .en(en_t),
    .init(init_t)
);


/*************************************************************

                          TESTCASES

*************************************************************/
task testcase1;
begin
    num_errors = 0;
    vect_pass = 1;
    i = 0;
    en_t = 1;

    $display("\n\n----------------------------------------------------\n");
    $display("COMPRESSOR TESTBENCH");
    $display("\n----------------------------------------------------\n");

    // load constants
    $readmemh("kvals.mem", kvals);

    // load input vectors
    $readmemh("compressor_vect_input.mem", msgs);

    // load expected outputs
    $readmemh("compressor_vect_output_A.mem", expected_out_A);
    $readmemh("compressor_vect_output_B.mem", expected_out_B);
    $readmemh("compressor_vect_output_C.mem", expected_out_C);
    $readmemh("compressor_vect_output_D.mem", expected_out_D);
    $readmemh("compressor_vect_output_E.mem", expected_out_E);
    $readmemh("compressor_vect_output_F.mem", expected_out_F);
    $readmemh("compressor_vect_output_G.mem", expected_out_G);
    $readmemh("compressor_vect_output_H.mem", expected_out_H);

    init_t = 1;
    sync_pos();
    sync_neg();
    init_t = 0;

    repeat(64) begin
        sync_pos();

        // wait 1 to do error checking not on the signal edge
        #1;

        $display("Index: %d", i);
        if (A_t !== expected_out_A[i]) begin
            $display("- A: expected %h, got %h", expected_out_A[i], A_t);
            vect_pass = 0;
        end
        if (B_t !== expected_out_B[i]) begin
            $display("- B: expected %h, got %h", expected_out_B[i], B_t);
            vect_pass = 0;
        end   
        if (C_t !== expected_out_C[i]) begin
            $display("- C: expected %h, got %h", expected_out_C[i], C_t);
            vect_pass = 0;
        end         
        if (D_t !== expected_out_D[i]) begin
            $display("- D: expected %h, got %h", expected_out_D[i], D_t);
            vect_pass = 0;
        end
        if (E_t !== expected_out_E[i]) begin
            $display("- E: expected %h, got %h", expected_out_E[i], E_t);
            vect_pass = 0;
        end   
        if (F_t !== expected_out_F[i]) begin
            $display("- F: expected %h, got %h", expected_out_F[i], F_t);
            vect_pass = 0;
        end   
        if (G_t !== expected_out_G[i]) begin
            $display("- G: expected %h, got %h", expected_out_G[i], G_t);
            vect_pass = 0;
        end 
        if (H_t !== expected_out_H[i]) begin
            $display("- H: expected %h, got %h", expected_out_H[i], H_t);
            vect_pass = 0;
        end 

        if (vect_pass) 
            $display("vector passed!");
        else begin
            $display("vector failed!");
            num_errors = num_errors + 1;
        end

        i = i + 1;
        vect_pass = 1;
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
    init_t = 0;
    i = 0;
    num_errors = 0;
    vect_pass = 1;
end


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
