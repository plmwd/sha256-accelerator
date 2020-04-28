`timescale 1ns / 1ps

`include "sha256types.vh"

module sha256(
    output `WORD hash0,
    output `WORD hash1,
    output `WORD hash2,
    output `WORD hash3,
    output `WORD hash4,
    output `WORD hash5,
    output `WORD hash6,
    output `WORD hash7,
    output done,

    input msg_ram_wen,
    input msg_addr,
    
    );
endmodule
