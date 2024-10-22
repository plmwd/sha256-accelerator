

/***************************** Include Files *******************************/
#include "axi_sha256.h"
#include <string.h>


volatile uint32_t * const SHA256_CON = (volatile uint32_t *)XPAR_AXI_SHA256_0_S00_AXI_BASEADDR;
volatile uint32_t * const SHA256_MSG_SIZE_L = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG_SIZE_L_OFFSET);
volatile uint32_t * const SHA256_MSG_SIZE_H = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG_SIZE_H_OFFSET);
volatile uint32_t * const SHA256_CUR_BLOCK_L = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_CUR_BLOCK_L_OFFSET);
volatile uint32_t * const SHA256_CUR_BLOCK_H = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_CUR_BLOCK_H_OFFSET);
volatile uint32_t * const SHA256_MSG0 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG0_OFFSET);
volatile uint32_t * const SHA256_MSG1 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG1_OFFSET);
volatile uint32_t * const SHA256_MSG2 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG2_OFFSET);
volatile uint32_t * const SHA256_MSG3 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG3_OFFSET);
volatile uint32_t * const SHA256_MSG4 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG4_OFFSET);
volatile uint32_t * const SHA256_MSG5 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG5_OFFSET);
volatile uint32_t * const SHA256_MSG6 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG6_OFFSET);
volatile uint32_t * const SHA256_MSG7 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG7_OFFSET);
volatile uint32_t * const SHA256_MSG8 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG8_OFFSET);
volatile uint32_t * const SHA256_MSG9 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG9_OFFSET);
volatile uint32_t * const SHA256_MSG10 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG10_OFFSET);
volatile uint32_t * const SHA256_MSG11 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG11_OFFSET);
volatile uint32_t * const SHA256_MSG12 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG12_OFFSET);
volatile uint32_t * const SHA256_MSG13 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG13_OFFSET);
volatile uint32_t * const SHA256_MSG14 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG14_OFFSET);
volatile uint32_t * const SHA256_MSG15 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_MSG15_OFFSET);
volatile uint32_t * const SHA256_HASH0 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH0_OFFSET);
volatile uint32_t * const SHA256_HASH1 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH1_OFFSET);
volatile uint32_t * const SHA256_HASH2 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH2_OFFSET);
volatile uint32_t * const SHA256_HASH3 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH3_OFFSET);
volatile uint32_t * const SHA256_HASH4 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH4_OFFSET);
volatile uint32_t * const SHA256_HASH5 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH5_OFFSET);
volatile uint32_t * const SHA256_HASH6 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH6_OFFSET);
volatile uint32_t * const SHA256_HASH7 = (volatile uint32_t *)(XPAR_AXI_SHA256_0_S00_AXI_BASEADDR + AXI_SHA256_HASH7_OFFSET);


/************************** Function Definitions ***************************/
s32 sha256(sha256_t *sha256_obj) {
	uint64_t msg_size;
	uint64_t last_block;
	uint32_t data_bytes_in_last_block;
	uint64_t cur_block;
	void *msg_ptr;
	bool final_block;

    // Each block is 16 32-bit words, or 64 bytes
	// This gets the number of the last block (total number of blocks is last_block_num + 1)
	msg_size = sha256_obj->msg_size;
    last_block = msg_size >> 6;

    // Get lower 6 bits of data
    data_bytes_in_last_block = msg_size & 0x3F;

    // Get message buffer pointer
    msg_ptr = sha256_obj->msg_ptr;

    // disable while inputting the message size
    sha256_disable();
    *SHA256_MSG_SIZE_L = sha256_obj->msg_size;
    *SHA256_MSG_SIZE_H = sha256_obj->msg_size >> 32;

    // enter data into the message block buffer in little-endian format
    sha256_msg_little_endian_mode();

    // enable to reset module
    sha256_enable();

    // start hash loop
    while (!sha256_is_hash_done()) {
    	cur_block = ((uint64_t)*SHA256_CUR_BLOCK_H << 32) | *SHA256_CUR_BLOCK_L;

        // if is_final_block is true, then that means the previous intermediate hash was the last
        // and the loop should have been exited
        if (final_block)
            return XST_FAILURE;

        // load a word into the message block buffer until all words have been filled
        if (cur_block == last_block) {
        	memcpy((void*)SHA256_MSG0, msg_ptr, data_bytes_in_last_block);
        	final_block = true;
        }
		else
			memcpy((void*)SHA256_MSG0, msg_ptr, 64);

        // now that the message block buffer has been filled, start the intermediate hash
        sha256_update();

        //update msg_ptr to next block (64 bytes)
        msg_ptr += 64;

        // wait for the intermediate hash to be done, then check of the overall hash is done
        while (!sha256_is_block_done());

        // acknowledge the intermediate hash to allow for another update
        sha256_ack_block_done();
    }

    // get hash values
    sha256_obj->hash[0] = *SHA256_HASH0;
    sha256_obj->hash[1] = *SHA256_HASH1;
    sha256_obj->hash[2] = *SHA256_HASH2;
    sha256_obj->hash[3] = *SHA256_HASH3;
    sha256_obj->hash[4] = *SHA256_HASH4;
    sha256_obj->hash[5] = *SHA256_HASH5;
    sha256_obj->hash[6] = *SHA256_HASH6;
    sha256_obj->hash[7] = *SHA256_HASH7;

    // acknowledge that the hash is done and to reset the module - HASHn registers don't reset
    sha256_ack_hash_done();

    return XST_SUCCESS;
}
