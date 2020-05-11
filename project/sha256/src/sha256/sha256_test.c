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

#define XINTC_UART_ID	0
#define XINTC_SHA256_ID	1

//int main(void) {
//	XIntc intc_obj;
//	uint32_t isr;
//
//	XIntc_Config XIntc_ConfigTable[1];
//
//	// config xintc device
//	XIntc_Config *intc_config = &XIntc_ConfigTable[0];
//	intc_config->DeviceId = XPAR_INTC_0_DEVICE_ID;
//	intc_config->FastIntr = true;
//	intc_config->BaseAddress = XPAR_INTC_0_BASEADDR;
//	intc_config->NumberofIntrs = XPAR_INTC_0_NUM_INTR_INPUTS;
//	intc_config->VectorAddrWidth = XPAR_INTC_0_ADDR_WIDTH;
//	intc_config->IntcType = 1;
//
//
//	init_platform();
//
//	XIntc_Initialize(&intc_obj, XPAR_INTC_0_DEVICE_ID);
//	XIntc_Start(&intc_obj, XIN_REAL_MODE);
//	XIntc_ConnectFastHandler(&intc_obj, XINTC_SHA256_ID, &sha256_isr);
//	XIntc_Enable(&intc_obj, XINTC_SHA256_ID);
//	//microblaze_enable_interrupts();
//
////	isr = Xil_In32(intc_obj.BaseAddress + XIN_ISR_OFFSET);
////	Xil_Out32(intc_obj.BaseAddress + XIN_ISR_OFFSET, isr | 0x2);
////
////	while(1);
//
//	char str[200] = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopqabcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopqzztopfuckyou";
//	//char str[20] = "abc";
//	s32 hash_status;
//	uint32_t hash[8];
//	uint32_t cy = 0;
//
//
//	hash_status = sha256(str, strlen(str), hash, BLOCKING);
//	while(!sha256_isr_done());
//	if(hash_status)
//		print("Hash FAILURE\n\r");
//	else {
//		print("Hash SUCCESS\n\r");
//		xil_printf("%d cys\n\r", cy);
//		print("Hash:\n\r");
//		for (uint32_t i = 0; i < 8; i++) {
//			xil_printf("%08X", hash[i]);
//		}
//		print("\n\n\r");
//	}
//
//	cleanup_platform();
//	return 0;
//}
