#include "axi_sha256.h"
#include "xil_printf.h"
#include <stdio.h>
#include <string.h>
#include "xintc.h"
#include <stdint.h>
#include <stdbool.h>
#include "xintc_i.h"
#include "xparameters.h"
#include "mb_interface.h"
#include <time.h>
#include "xtmrctr.h"
#include "sha2.h"

XTmrCtr bench_tmr;

// Returns the approx number of cycles and -1 if the hash doesn't
// match the expected output or fails for whatever reason
// Input message is a string
uint32_t sha256_hw_try(uint8_t *msg, uint32_t *expected_hash) {
	uint32_t hash[8];
	s32 return_status;

	XTmrCtr_Start(&bench_tmr, 0);
	return_status = sha256(msg, 3, hash, BLOCKING);
	XTmrCtr_Stop(&bench_tmr, 0);

	if (return_status == XST_FAILURE)
		return -1;

	for (uint32_t i = 0; i < 8; i++) {
		xil_printf("%08X\n\r", hash[i]);
		if (expected_hash[i] != hash[i])
			return -1;
	}

	return XTmrCtr_GetValue(&bench_tmr, 0);
}

uint32_t sha256_sw_try(uint8_t *msg, uint32_t *expected_hash) {
	uint32_t hash[8];
	uint8_t hash_byte[32];

	XTmrCtr_Start(&bench_tmr, 0);
	bsha256(hash_byte, msg, (uint64_t)strlen(msg));
	XTmrCtr_Stop(&bench_tmr, 0);

	//output_hash(hash_byte);

	for (uint32_t i = 0; i < 8; i++) {
		hash[i] = 	(hash_byte[i*4] << 24) |
					(hash_byte[i*4 + 1] << 16) |
					(hash_byte[i*4 + 2] << 8) |
					 hash_byte[i*4 + 3];
	}

	for (uint32_t i = 0; i < 8; i++) {
		//xil_printf("%08X\n\r", hash[i]);
		if (expected_hash[i] != hash[i])
			return -1;
	}

	return XTmrCtr_GetValue(&bench_tmr, 0);
}


int main() {
	XTmrCtr_Initialize(&bench_tmr, XPAR_TMRCTR_0_DEVICE_ID);

	uint32_t num_cy_hw, num_cy_sw;
	uint8_t in0[10] __attribute__((aligned(4))) = "abc";
	uint32_t out0[8] = {
			0xBA7816BF,
			0x8F01CFEA,
			0x414140DE,
			0x5DAE2223,
			0xB00361A3,
			0x96177A9C,
			0xB410FF61,
			0xF20015AD};

	num_cy_hw = sha256_hw_try(in0, out0);
	xil_printf("hw\n\r\tnum cycles: %d\n\r", num_cy_hw);

	num_cy_sw = sha256_sw_try(in0, out0);
	xil_printf("sw\n\r\tnum cycles: %d\n\r", num_cy_sw);

	xil_printf("accelerator speed up: ~%d\n\n\r", num_cy_sw / num_cy_hw);

	while(1);
}
