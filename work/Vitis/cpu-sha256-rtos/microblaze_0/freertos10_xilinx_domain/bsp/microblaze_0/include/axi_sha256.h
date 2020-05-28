
#ifndef AXI_SHA256_H
#define AXI_SHA256_H

 
/****************** Include Files ********************/
#include <stdint.h>
#include <stdbool.h>
#include "xstatus.h"
#include "xparameters.h"

#if defined (__GNUC__) || defined (__ICCARM__) || defined (__MICROBLAZE__)
#define INLINE inline
#else
#define INLINE __inline
#endif

//#define XPAR_AXI_SHA256_0_S_SHA256_GEN_PADDER 0

#define AXI_SHA256_CON_OFFSET 0
#define AXI_SHA256_MSG_SIZE_L_OFFSET 4
#define AXI_SHA256_MSG_SIZE_H_OFFSET 8
#define AXI_SHA256_CUR_BLOCK_L_OFFSET 12
#define AXI_SHA256_CUR_BLOCK_H_OFFSET 16
#define AXI_SHA256_MSG0_OFFSET 20
#define AXI_SHA256_MSG1_OFFSET 24
#define AXI_SHA256_MSG2_OFFSET 28
#define AXI_SHA256_MSG3_OFFSET 32
#define AXI_SHA256_MSG4_OFFSET 36
#define AXI_SHA256_MSG5_OFFSET 40
#define AXI_SHA256_MSG6_OFFSET 44
#define AXI_SHA256_MSG7_OFFSET 48
#define AXI_SHA256_MSG8_OFFSET 52
#define AXI_SHA256_MSG9_OFFSET 56
#define AXI_SHA256_MSG10_OFFSET 60
#define AXI_SHA256_MSG11_OFFSET 64
#define AXI_SHA256_MSG12_OFFSET 68
#define AXI_SHA256_MSG13_OFFSET 72
#define AXI_SHA256_MSG14_OFFSET 76
#define AXI_SHA256_MSG15_OFFSET 80
#define AXI_SHA256_HASH0_OFFSET 84
#define AXI_SHA256_HASH1_OFFSET 88
#define AXI_SHA256_HASH2_OFFSET 92
#define AXI_SHA256_HASH3_OFFSET 96
#define AXI_SHA256_HASH4_OFFSET 100
#define AXI_SHA256_HASH5_OFFSET 104
#define AXI_SHA256_HASH6_OFFSET 108
#define AXI_SHA256_HASH7_OFFSET 112
#define AXI_SHA256_S00_AXI_SLV_REG29_OFFSET 116


#define SHA256_CON_EN_BIT 				1u
#define SHA256_CON_UPDATE_BIT			2u
#define SHA256_CON_BUSY_BIT				4u
#define SHA256_CON_ERROR_BIT			8u
#define SHA256_CON_BLOCK_DONE_BIT 		16u
#define SHA256_CON_HASH_DONE_BIT 		32u

#define SHA256_USE

// registers
extern volatile uint32_t * const SHA256_CON;
extern volatile uint32_t * const SHA256_MSG_SIZE_L;
extern volatile uint32_t * const SHA256_MSG_SIZE_H;
extern volatile uint32_t * const SHA256_CUR_BLOCK_L;
extern volatile uint32_t * const SHA256_CUR_BLOCK_H;
extern volatile uint32_t * const SHA256_MSG0;
extern volatile uint32_t * const SHA256_MSG1;
extern volatile uint32_t * const SHA256_MSG2;
extern volatile uint32_t * const SHA256_MSG3;
extern volatile uint32_t * const SHA256_MSG4;
extern volatile uint32_t * const SHA256_MSG5;
extern volatile uint32_t * const SHA256_MSG6;
extern volatile uint32_t * const SHA256_MSG7;
extern volatile uint32_t * const SHA256_MSG8;
extern volatile uint32_t * const SHA256_MSG9;
extern volatile uint32_t * const SHA256_MSG10;
extern volatile uint32_t * const SHA256_MSG11;
extern volatile uint32_t * const SHA256_MSG12;
extern volatile uint32_t * const SHA256_MSG13;
extern volatile uint32_t * const SHA256_MSG14;
extern volatile uint32_t * const SHA256_MSG15;
extern volatile uint32_t * const SHA256_HASH0;
extern volatile uint32_t * const SHA256_HASH1;
extern volatile uint32_t * const SHA256_HASH2;
extern volatile uint32_t * const SHA256_HASH3;
extern volatile uint32_t * const SHA256_HASH4;
extern volatile uint32_t * const SHA256_HASH5;
extern volatile uint32_t * const SHA256_HASH6;
extern volatile uint32_t * const SHA256_HASH7;

typedef enum {BLOCKING, NONBLOCKING} blocking_t;

typedef struct {
    void *msg_ptr;
    uint64_t msg_size;
    uint64_t last_block;
    uint64_t cur_block;
    uint32_t data_bytes_in_last_block;
    bool final_block;
    uint32_t *hash_ptr;
    bool hash_done;
    blocking_t bnb;	// blocking, non-blocking

#if (XPAR_AXI_SHA256_0_S_SHA256_GEN_PADDER == 0)
    bool pad_of;		// only used if
#endif
} sha256_t;


static INLINE void sha256_update() {
    *SHA256_CON |= SHA256_CON_UPDATE_BIT ;
}

static INLINE void sha256_enable() {
    *SHA256_CON |= SHA256_CON_EN_BIT;
}

static INLINE void sha256_disable() {
    *SHA256_CON &= ~SHA256_CON_EN_BIT;
}

static INLINE bool sha256_is_block_done() {
    return (*SHA256_CON & SHA256_CON_BLOCK_DONE_BIT) > 0u;
}

static INLINE bool sha256_is_busy() {
    return *SHA256_CON |= SHA256_CON_BUSY_BIT > 0u;
}

static INLINE void sha256_ack_block_done() {
	*SHA256_CON &= ~SHA256_CON_BLOCK_DONE_BIT;
}

#if (XPAR_AXI_SHA256_0_S_SHA256_GEN_PADDER == false)

bool sha256_is_hash_done();

static INLINE void sha256_ack_hash_done() {
	// Do nothing
}

#else

static INLINE bool sha256_is_hash_done() {
    return (*SHA256_CON & SHA256_CON_HASH_DONE_BIT) > 0u;
}

static INLINE void sha256_ack_hash_done() {
	*SHA256_CON &= ~SHA256_CON_HASH_DONE_BIT;
}

#endif

bool sha256_isr_done();

static INLINE void sha256_reset() {
	sha256_disable();
	sha256_enable();
}

//s32 construct_sha256_t(sha256_t* sha256_obj, u32 *msg_ptr, u64 msg_size);
s32 sha256(void *msg_ptr, uint64_t msg_size, uint32_t *hash_ptr, blocking_t b_t);

void sha256_isr(void) __attribute__((fast_interrupt));
void sha256_handler();

/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a AXI_SHA256 register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the AXI_SHA256device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void AXI_SHA256_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define AXI_SHA256_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a AXI_SHA256 register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the AXI_SHA256 device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 AXI_SHA256_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define AXI_SHA256_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the AXI_SHA256 instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus AXI_SHA256_Reg_SelfTest(void * baseaddr_p);

#endif // AXI_SHA256_H
