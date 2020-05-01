#include "sha256/axi_sha256.h"
#include "xil_printf.h"
#include <stdio.h>
#include <string.h>
#include "platform.h"

int main(void) {
	init_platform();

	char str[200] = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopqabcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopqzztopfuckyou";
	s32 hash_status;

	sha256_t test_hash;
	test_hash.msg_size = strlen(str);
	test_hash.msg_ptr = str;

	hash_status = sha256(&test_hash);

	if(hash_status)
		print("Hash FAILURE\n\r");
	else {
		print("Hash SUCCESS\n\r");

		print("Hash:\n\r");
		for (uint32_t i = 0; i < 8; i++) {
			xil_printf("%08X", test_hash.hash[i]);
		}
		print("\n\n\r");
	}

	cleanup_platform();
}
