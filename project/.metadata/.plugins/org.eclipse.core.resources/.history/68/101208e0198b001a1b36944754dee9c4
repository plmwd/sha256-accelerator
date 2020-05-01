#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "led_axi.h"
#include "xparameters.h"


int main(void) {
	u32 *LEDS = XPAR_LED_AXI_0_LED_IO_AXI_BASEADDR;


	init_platform();

	*LEDS = 0xFF;

	while(1);

	cleanup_platform();
	return 0;
}
