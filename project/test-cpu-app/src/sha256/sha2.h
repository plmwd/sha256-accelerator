#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

#ifndef _SHA2H
#define _SHA2H

/*
    See https://csrc.nist.gov/projects/hash-functions for the SHA256 implementation.
*/

typedef uint8_t byte_t;
typedef uint32_t word_t;

// "width" is reserved for size of words and "size" for any other block or sub-word
#define NUM_MSG_BLOCK_BITS          512
#define SHA256_SIZE_BITS            256
#define WORD_WIDTH_BITS             32
#define NUM_PAD_MSG_LEN_BITS        64
#define MSG_SCHEDULE_SIZE_WORDS     64
#define PAD_START                   0x80
#define SHA256_SIZE_WORDS           SHA256_SIZE_BITS / WORD_WIDTH_BITS
#define SHA256_SIZE_BYTES           SHA256_SIZE_BITS / 8
#define NUM_MSG_BLOCK_BYTES         NUM_MSG_BLOCK_BITS / 8
#define NUM_MSG_BLOCK_WORDS         NUM_MSG_BLOCK_BITS / WORD_WIDTH_BITS
#define WORD_WIDTH_BYTES            WORD_WIDTH_BITS / 8
#define PAD_MSG_LEN_START_BYTE      NUM_MSG_BLOCK_BYTES - (NUM_PAD_MSG_LEN_BITS / 8)
#define MIN_PAD_LENGTH_BITS         NUM_PAD_MSG_LEN_BITS + 1                

// typedef struct {
//     // working variables
//     word_t a, b, c, d, e, f, g, h;

//     // hash variables
//     word_t hash[8];

//     word_t msg_schedule[MSG_SCHEDULE_SIZE_WORDS];
// } sha2_t;


typedef struct {
    byte_t *stream;
    uint64_t stream_pos;
    uint64_t stream_len;
} stream_t;

stream_t* init_stream(byte_t *stream, uint64_t stream_len);

// creates and initializes hash variables with IV and working regs to zero
void init_sha256(word_t *hash);

/*
    Adds padding to a message block. It calculates whether to end the padding on the current
    block. If it doesn't finish the padding (pads with only zeros) then it will return false 
    indicating that the padding has not finished and a compression of a new message block is
    required. The new message will solely compose of padding zeros and the length of the entire
    message being hashed in bits. No new data should be read into the block if the padding 
    overlaps between two blocks. It will return true if the padding was completed with the length 
    of the message in bits added to the end of the block.

    msg_block: a 512 bit byte addressable buffer with data read from stream or another buffer
                to be hashed

    padding_start_byte: the byte after the last byte of read data into the msg_block

    message_size_bytes: the total size of the entire message being hashed in bytes
    
*/
bool add_padding(byte_t* msg_block, uint64_t padding_start_byte, uint64_t message_size_bytes);

/*
    Attempts to read a block (512 bits, 64 bytes) from a FILE. The file contains the cursor 
    position. The number of bytes actually read is returned, and if it is less than 64 bytes, 
    then padding will need to be added.

    msg_block: a 64 bytes (512 bit) buffer being written to. No initialization needed.
    f: file being read from
*/
uint64_t fread_block(byte_t *msg_block, void *stream);

/*
    Attempts to read a block (512 bits, 64 bytes) from a byte addressable buffer into
    a message block buffer. The function returns the number of bytes actually read into the
    message block, and if it is less than 64 bytes, then padding will need to be added. The function starts 
    reading from the buffer at buf_pos and will try to read 64 bytes unless the end of the buffer
    has been reached indicated by the current buf_pos and the size, buf_size.

    msg_block: a 64 bytes (512 bit) buffer being written to. No initialization needed.
    buf: a byte addressable buffer to read from
    buf_pos: the starting byte to start reading from buf
    buf_size: the entire size of buf in bytes

    returns the number of bytes read. 64 bytes or less
*/
uint64_t bread_block(byte_t *msg_block, void *stream);

/*
    Performs the message scheduling operation. Transforms the 16 words in the (already padded)
    message block into a 64 word message schedule.

    sha2: pointer to a sha2 object
    msg_block: a 512 bit message block that has already been padded if nesscesarry
*/
void schedule_msgs(word_t *msg_schedule, byte_t *data);


/*
    Performs the compression rounds of the sha256 algorithm. It is assumed that
    the message scheduler has been filed with a message that is padded if nesscessary.
    The output will be new working register values and the intermediate hash can be 
    calculated.

    sha2_t: pointer to a sha2 object
*/
void perform_compression(word_t *msg_schedule, word_t *hash);

/*
    Computes the intermediate hash.

    sha2_t: pointer to a sha2 object

*/
//void compute_imd_hash(sha2_t *sha2);

/*
    Updates the current sha object the hash of the new block

    sha2_t: pointer to a sha2 object
    msg_block: a 512 bit block from the message. The block should already
                be padded.
*/
void sha2_update(word_t *hash, byte_t *msg_block);


/*
    Output the concatted hash registers h0|h1|h2|h3|h4|h5|h6|h7 to the console
    and to a file named "sha256.txt".

    sha2_t: pointer to a sha2 object
*/
void output_hash(byte_t* hash);

void sha256(byte_t* hash, void *stream, uint64_t stream_len, uint64_t (*read_block)(byte_t*, void*));

void bsha256(byte_t* hash, byte_t *buf, uint64_t buf_len);
void fsha256(byte_t* hash, FILE *f);

/*
    Used for debugging. Will print all bytes in hex of the message block.

    msg_block: pointer to a 512 bit message block. It is assumed that the block
                is 512 bits. 
*/
void print_msg_block(byte_t *msg_block);

#endif
