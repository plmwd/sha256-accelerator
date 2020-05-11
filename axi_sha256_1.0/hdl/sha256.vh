
parameter   WORD_WIDTH = 32,
            MSG_BLOCK_SIZE = 512;

`define ROTR32(n, sh) {n[sh - 1 : 0], n[31 : sh]}

function `WORD sigma0 (input `WORD w);
    sigma0 = (`ROTR32(w, 7)) ^ (`ROTR32(w, 18)) ^ (w >> 3);
endfunction


function `WORD sigma1 (input `WORD w);
    sigma1 = `ROTR32(w, 17) ^ `ROTR32(w, 19) ^ (w >> 10);
endfunction


function `WORD SIGMA0 (input `WORD w);
    SIGMA0 = `ROTR32(w, 2) ^ `ROTR32(w, 13) ^ `ROTR32(w, 22);
endfunction


function `WORD SIGMA1 (input `WORD w);
    SIGMA1 = (`ROTR32(w, 6)) ^ (`ROTR32(w, 11)) ^ (`ROTR32(w, 25));
endfunction


function `WORD ch;
    input `WORD x;
    input `WORD y;
    input `WORD z;

    ch = (x & y) ^ (~x & z);
endfunction


function `WORD maj;
    input `WORD x;
    input `WORD y;
    input `WORD z;

    maj = (x & y) ^ (x & z) ^ (y & z);
endfunction


