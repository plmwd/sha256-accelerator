

/***************************** Include Files *******************************/
#include "axi_sha256.h"
#include <string.h>
#include "xil_printf.h"

void swap_endianness32(uint32_t *);
void load_msg_buffer();
void pad_msg_block();


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


sha256_t sha256_obj;

void swap_endianness32(uint32_t *word) {
	uint32_t byte0, byte1, byte2, byte3;

	byte0 = *word & 0xFF;
	byte1 = *word & 0xFF00;
	byte2 = *word & 0xFF0000;
	byte3 = *word & 0xFF000000;

	*word = (byte0 << 24) | (byte1 << 8) | (byte2 >> 8) | (byte3 >> 24);
}

void load_msg_buffer() {

#if (XPAR_AXI_SHA256_0_S_SHA256_GEN_PADDER == false)
	if (sha256_obj.pad_of) {
		pad_msg_block();
		sha256_obj.final_block = true;
	}
	else if (sha256_obj.cur_block == sha256_obj.last_block) {
		memcpy((void*)SHA256_MSG0, sha256_obj.msg_ptr, sha256_obj.data_bytes_in_last_block);
		pad_msg_block();
		sha256_obj.final_block = !sha256_obj.pad_of;
	}
	else
		memcpy((void*)SHA256_MSG0, sha256_obj.msg_ptr, 64);

#else
	// load a word into the message block buffer until all words have been filled
	if (sha256_obj.cur_block == sha256_obj.last_block) {
		memcpy((void*)SHA256_MSG0, sha256_obj.msg_ptr, sha256_obj.data_bytes_in_last_block);
		sha256_obj.final_block = true;
	}
	else
		memcpy((void*)SHA256_MSG0, sha256_obj.msg_ptr, 64);
#endif
}


#if (XPAR_AXI_SHA256_0_S_SHA256_GEN_PADDER == false)
bool sha256_is_hash_done() {
	return sha256_obj.hash_done;
}

void pad_msg_block() {
	uint16_t i;
	uint32_t data_bytes_in_last_block = sha256_obj.data_bytes_in_last_block;

	// If this function got called and the previous padding overflowed, pad the overflowed block
	if (sha256_obj.pad_of) {
		// Fill with zeros
		for (i = 0; i < 14; i++) {
			SHA256_MSG0[i] = 0;
		}

		// Add message size to end
		// message size in bytes, need bits
		// >> 32 to get most-sig 32-bits, then << 3 to get bits
		*SHA256_MSG14 = sha256_obj.msg_size >> 29;
		*SHA256_MSG15 = sha256_obj.msg_size << 3;

		// SHA256 spec uses big endian, but message size is added in as little endian,
		// so swap the endianness for the message size words
		swap_endianness32((uint32_t *)SHA256_MSG14);
		swap_endianness32((uint32_t *)SHA256_MSG15);

		sha256_obj.hash_done = true;
	}
	else {
		// Get last word from last bytes
		i = data_bytes_in_last_block >> 2;
		uint16_t last_byte_pos = data_bytes_in_last_block % 4;

		// Add padding start byte after the last byte in the message block, then fill the rest with 0
		switch(last_byte_pos) {
			case 0:
				SHA256_MSG0[i] = 0x80;
				break;

			case 1:
				SHA256_MSG0[i] &= 0xFF;
				SHA256_MSG0[i] |= 0x8000;
				break;

			case 2:
				SHA256_MSG0[i] &= 0xFFFF;
				SHA256_MSG0[i] |= 0x800000;
				break;

			case 3:
				SHA256_MSG0[i] &= 0xFFFFFF;
				SHA256_MSG0[i] |= 0x80000000;
				break;
		}
		i++;

		// If there is no room for the message size, then the padding needs to wrap onto another block
		if (i > 13) {
			sha256_obj.pad_of = true;

			for (; i < 16; i++) {
				SHA256_MSG0[i] = 0;
			}
		}
		else {
			for(; i < 14; i++) {
				SHA256_MSG0[i] = 0;
			}

			// message size in bytes, need bits
			// >> 32 to get most-sig 32-bits, then << 3 to get bits
			*SHA256_MSG14 = sha256_obj.msg_size >> 29;
			*SHA256_MSG15 = sha256_obj.msg_size << 3;

			// SHA256 spec uses big endian, but message size is added in as little endian,
			// so swap the endianness for the message size words
			swap_endianness32((uint32_t *)SHA256_MSG14);
			swap_endianness32((uint32_t *)SHA256_MSG15);

			sha256_obj.hash_done = true;
		}
	}
}
#endif

void sha256_handler() {
	if (sha256_is_hash_done()) {
		// get hash values
		sha256_obj.hash_ptr[0] = *SHA256_HASH0;
		sha256_obj.hash_ptr[1] = *SHA256_HASH1;
		sha256_obj.hash_ptr[2] = *SHA256_HASH2;
		sha256_obj.hash_ptr[3] = *SHA256_HASH3;
		sha256_obj.hash_ptr[4] = *SHA256_HASH4;
		sha256_obj.hash_ptr[5] = *SHA256_HASH5;
		sha256_obj.hash_ptr[6] = *SHA256_HASH6;
		sha256_obj.hash_ptr[7] = *SHA256_HASH7;

		sha256_obj.hash_done = true;
		sha256_ack_hash_done();
	}
	else {
		sha256_ack_block_done();
		sha256_obj.msg_ptr += 64;

		sha256_obj.cur_block = ((uint64_t)*SHA256_CUR_BLOCK_H << 32) | *SHA256_CUR_BLOCK_L;

		// load a word into the message block buffer until all words have been filled
		load_msg_buffer();

		// now that the message block buffer has been filled, start the intermediate hash
		sha256_update();
	}
}

void sha256_isr(void) {
	if (sha256_obj.bnb == NONBLOCKING) {
		sha256_handler();
	}
}

bool sha256_isr_done() {
	return sha256_obj.hash_done;
}

/************************** Function Definitions ***************************/
s32 sha256(void *msg_ptr, uint64_t msg_size, uint32_t *hash_ptr, blocking_t bnb) {
	uint64_t last_block;
	uint32_t data_bytes_in_last_block;

	sha256_obj.hash_ptr = hash_ptr;
	sha256_obj.msg_size = msg_size;
	sha256_obj.msg_ptr = msg_ptr;
	sha256_obj.hash_done = false;
	sha256_obj.bnb = bnb;
	sha256_obj.final_block = false;

#if (XPAR_AXI_SHA256_0_S_SHA256_GEN_PADDER == false)
	sha256_obj.pad_of = false;
#endif

    // Each block is 16 32-bit words, or 64 bytes
	// This gets the number of the last block (total number of blocks is last_block_num + 1)
    last_block = msg_size >> 6;
    sha256_obj.last_block = last_block;

    // Get lower 6 bits of data
    data_bytes_in_last_block = msg_size & 0x3F;
    sha256_obj.data_bytes_in_last_block = data_bytes_in_last_block;

    // disable while inputting the message size
    sha256_disable();
    *SHA256_MSG_SIZE_L = msg_size;
    *SHA256_MSG_SIZE_H = msg_size >> 32;

    // enable to reset module
    sha256_enable();

    if (bnb == BLOCKING) {
		// start hash loop
		while (!sha256_is_hash_done()) {
			sha256_obj.cur_block = ((uint64_t)*SHA256_CUR_BLOCK_H << 32) | *SHA256_CUR_BLOCK_L;

			// if is_final_block is true, then that means the previous intermediate hash was the last
			// and the loop should have been exited
			if (sha256_obj.final_block)
				return XST_FAILURE;

			load_msg_buffer();

			// now that the message block buffer has been filled, start the intermediate hash
			sha256_update();

			//update msg_ptr to next block (64 bytes)
			sha256_obj.msg_ptr += 64;

			// wait for the intermediate hash to be done, then check of the overall hash is done
			while (!sha256_is_block_done());

			// acknowledge the intermediate hash to allow for another update
			sha256_ack_block_done();
		}

		// get hash values
		hash_ptr[0] = *SHA256_HASH0;
		hash_ptr[1] = *SHA256_HASH1;
		hash_ptr[2] = *SHA256_HASH2;
		hash_ptr[3] = *SHA256_HASH3;
		hash_ptr[4] = *SHA256_HASH4;
		hash_ptr[5] = *SHA256_HASH5;
		hash_ptr[6] = *SHA256_HASH6;
		hash_ptr[7] = *SHA256_HASH7;

		// acknowledge that the hash is done and to reset the module - HASHn registers don't reset
		sha256_ack_hash_done();
		sha256_obj.hash_done = true;
    }
    else {
    	sha256_obj.cur_block = ((uint64_t)*SHA256_CUR_BLOCK_H << 32) | *SHA256_CUR_BLOCK_L;

		// if is_final_block is true, then that means the previous intermediate hash was the last
		// and the loop should have been exited
		if (sha256_obj.final_block)
			return XST_FAILURE;

		load_msg_buffer();

		// now that the message block buffer has been filled, start the intermediate hash
		sha256_update();

		// ISR or handler handles the rest
    }

    return XST_SUCCESS;
}
