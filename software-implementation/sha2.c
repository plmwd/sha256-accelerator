#include "sha2.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

/*******************************************************************************************************
 *  SHA256 commandline utility and extensible library.
 * 
 * Author: Paul Wood
 * File Created: 03/21/2020
 * Last Revision: 03/24/2020
 * 
 * Program Hierarchy
 *      1. Constants
 *      2. Math Functions
 *      3. SHA256 Core Functions
 *      4. Utility Functions
 *      5. Initialization Functions
 *      6. Stream Reading Functions
 *      7. High Level SHA256 Function                         
 *      8. Commandline main() Function
 * 
********************************************************************************************************/


#define DEBUG

/*******************************************************************************************************
 * 
 * 
 *                                      CONSTANTS
 * 
 * 
********************************************************************************************************/
uint32_t init_hash[8] = {
    0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
    0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
    };

uint32_t k[64] = {
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
    0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
    0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
    0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
    0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
    0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
    0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
    0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
    0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
    };


/*******************************************************************************************************
 * 
 * 
 *                                      MATH FUNCTIONS
 * 
 * 
********************************************************************************************************/
uint32_t rotr(uint32_t num, uint32_t shift_amount) {
    return (num >> shift_amount) | (num << (32 - shift_amount));
}

uint32_t sigma0(uint32_t w) {
    return rotr(w, 7) ^ rotr(w, 18) ^ (w >> 3);
}

uint32_t sigma1(uint32_t w) {
    return rotr(w, 17) ^ rotr(w, 19) ^ (w >> 10);
}

uint32_t SIGMA0(uint32_t w) {
    return rotr(w, 2) ^ rotr(w, 13) ^ rotr(w, 22);
}

uint32_t SIGMA1(uint32_t w) {
    return rotr(w, 6) ^ rotr(w, 11) ^ rotr(w, 25);
}

uint32_t ch(uint32_t x, uint32_t y, uint32_t z) {
    return (x & y) ^ (~x & z);
}

uint32_t maj(uint32_t x, uint32_t y, uint32_t z) {
    return (x & y) ^ (x & z) ^ (y & z);
}


/*******************************************************************************************************
 * 
 * 
 *                                      SHA256 CORE FUNCTIONS
 * 
 * 
********************************************************************************************************/
// message is padded
void sha2_update(word_t *hash, byte_t *msg_block) {
    word_t msg_schedule[MSG_SCHEDULE_SIZE_WORDS];

    schedule_msgs(msg_schedule, msg_block);
    perform_compression(msg_schedule, hash);
    //compute_imd_hash(sha2);
}


void schedule_msgs(word_t *msg_schedule, byte_t *data) {
    int i, j;

    #ifdef DEBUG
        printf("message schedule:\n");
    #endif

    for (i = 0; i < 16; i++) {
        j = i * 4;
        msg_schedule[i] = (data[j] << 24) | (data[j + 1] << 16) | (data[j + 2] << 8) | (data[j + 3]);

        #ifdef DEBUG
            printf("i=%d\t%08x\n", i, msg_schedule[i]);
        #endif
    }

    for (; i < MSG_SCHEDULE_SIZE_WORDS; i++) {
        msg_schedule[i] =   sigma1(msg_schedule[i - 2]) + 
                            sigma0(msg_schedule[i - 15]) + 
                            msg_schedule[i - 7] +
                            msg_schedule[i - 16];

        #ifdef DEBUG
            printf("i=%d\t%08x\n", i, msg_schedule[i]);
        #endif
    }

    #ifdef DEBUG
        printf("%08x\n", msg_schedule[15]);
    #endif
}

word_t word_index_byte_arr(byte_t *arr, uint64_t index) {
    return (arr[index] << 24) | (arr[index + 1] << 16) | (arr[index + 2] << 8) || (arr[index + 3]);
}

void perform_compression(word_t *msg_schedule, word_t *hash) {
    uint32_t temp1, temp2;

    word_t a, b, c, d, e, f, g, h;

    #ifdef DEBUG
        printf ("\tA\t\tB\t\tC\t\tD\t\tE\t\tF\t\tG\t\tH\n");
    #endif

    // initialize working registers
    a = hash[0];
    b = hash[1];
    c = hash[2];
    d = hash[3];
    e = hash[4];
    f = hash[5];
    g = hash[6];
    h = hash[7];

    // perform compression rounds
    for (int i = 0; i < MSG_SCHEDULE_SIZE_WORDS; i++) {
        temp1 = h + SIGMA1(e) + ch(e, f, g) + k[i] + msg_schedule[i];

        temp2 = SIGMA0(a) + maj(a, b, c);

        //printf("\nmsg: %08X, k: %08X\n", sha2->msg_schedule[i], k[i]);

        h = g;
        g = f;
        f = e;
        e = d + temp1;
        d = c;
        c = b;
        b = a;
        a = temp1 + temp2;


        #ifdef DEBUG
            printf("t1: %08X\nt2: %08X\n", temp1, temp2);
            printf("msg[i]: %08X\nk[i]: %08X\n", msg_schedule[i], k[i]);
            printf("i=%d\t%08X\t%08X\t%08X\t%08X\t%08X\t%08X\t%08X\t%08X\n\n", 
                i, a, b, c, d, e, f, g, h 
            );
        #endif
    }

    hash[0] += a;
    hash[1] += b;
    hash[2] += c;
    hash[3] += d;
    hash[4] += e;
    hash[5] += f;
    hash[6] += g;
    hash[7] += h;

    #ifdef DEBUG
        for (int i = 0; i < SHA256_SIZE_WORDS; i++) {
            printf("hash%d: %08X\n", i, hash[i]);
        }
    #endif
}

// void compute_imd_hash(sha2_t *sha2) {
//     sha2->hash[0] += sha2->a;
//     sha2->hash[1] += sha2->b;
//     sha2->hash[2] += sha2->c;
//     sha2->hash[3] += sha2->d;
//     sha2->hash[4] += sha2->e;
//     sha2->hash[5] += sha2->f;
//     sha2->hash[6] += sha2->g;
//     sha2->hash[7] += sha2->h;

//     #ifdef DEBUG
//         for (int i = 0; i < 8; i++) {
//             printf("h%d\t%08X\n", i, sha2->hash[i]);
//         }
//     #endif
// }


bool add_padding(byte_t* msg_block, uint64_t padding_start, uint64_t msg_size) {
    bool finish_padding;
    int i = padding_start;

    #ifdef DEBUG
        printf("starting padding\npadding start: %ld\noverlapping thresh: %d\n", padding_start * 8, NUM_MSG_BLOCK_BITS - MIN_PAD_LENGTH_BITS);
    #endif

    // see if the padding needs to be wrapped across the two last message blocks
    // padding overlaps 
    if ((padding_start * 8) >= (NUM_MSG_BLOCK_BITS - MIN_PAD_LENGTH_BITS - 1)) {
        finish_padding = false;
        msg_block[i] = PAD_START;
        i++;
        
        #ifdef DEBUG
            printf("starting overlapping padding\n");
        #endif
    }

    // the padding start will be zero if the padding if overlapping between two blocks
    // add remainder of the padding to the last block
    else if (padding_start == 0) {
        finish_padding = true;

        #ifdef DEBUG
            printf("finishing overlapping padding\n");
        #endif
    }

    // the entire padding fits on one block
    else {
        finish_padding = true;
        msg_block[i] = PAD_START;
        i++;

        #ifdef DEBUG
            printf("adding entire padding to block\n");
        #endif
    }

    // check to see how to pad the message block
    // the padding ends on this block - add the message length at the end 
    if (finish_padding) {
        for (; i < NUM_MSG_BLOCK_BYTES - 8; i++) {
            msg_block[i] = 0;
        }

        #ifdef DEBUG
            printf("fin padding, msg size: %08lX: \n", msg_size * 8);
        #endif

        // set last 64 bits to the length of the entire message being hashed (in bits)
        msg_size *= 8;
        for (; i < NUM_MSG_BLOCK_BYTES; i++) {
            msg_block[i] = ((byte_t*)&msg_size)[NUM_MSG_BLOCK_BYTES - i - 1];

            #ifdef DEBUG
                printf("%02X", msg_block[i]);
            #endif
        }
        printf("\n");
    }

    // fill entirely with zeros as the padding extends to the next block
    else {
        for (; i < NUM_MSG_BLOCK_BYTES; i++) {
            msg_block[i] = 0;
        }
    }

    return finish_padding;
}





/*******************************************************************************************************
 * 
 * 
 *                                          UTILITY FUNCTIONS
 * 
 * 
********************************************************************************************************/
void print_msg_block(byte_t *msg_block) {
    printf("msg block:\n");

    printf("0x");
    for (int i = 0; i < NUM_MSG_BLOCK_BYTES; i++) {
        //printf("%d\t%x\n", i, msg_block[i]);
        printf("%02X", msg_block[i]);
    }

    printf("\n");
}

uint64_t get_file_len(FILE *f) {
    uint64_t num_bytes;
    fseek(f, 0, SEEK_END);
    num_bytes = ftell(f);
    fseek(f, 0, 0);
    
    return num_bytes;
}

void output_hash(byte_t* hash) {
    FILE *f = fopen("sha2.txt", "w");

    printf("sha256 hash:\n");
    for (int i = 0; i < SHA256_SIZE_BYTES; i++) {
        printf("%02X", hash[i]);
        fprintf(f, "%02X", hash[i]);
    }

    printf("\n");
    fclose(f);
}



/*******************************************************************************************************
 * 
 * 
 *                                      INITIALIZATION FUNCTIONS
 * 
 * 
********************************************************************************************************/
void init_sha256(word_t *hash) {
    hash[0] = init_hash[0];
    hash[1] = init_hash[1];
    hash[2] = init_hash[2];
    hash[3] = init_hash[3];
    hash[4] = init_hash[4];
    hash[5] = init_hash[5];
    hash[6] = init_hash[6];
    hash[7] = init_hash[7];
}


stream_t* init_stream(byte_t *stream, uint64_t stream_len) {
    stream_t *s = (stream_t*)malloc(sizeof(stream_t));
    s->stream = stream;
    s->stream_pos = 0;
    s->stream_len = stream_len;

    return s;
}


/*******************************************************************************************************
 * 
 * 
 *                                      STREAM READING FUNCTIONS
 * 
 * 
********************************************************************************************************/

// file read block (512 bits)
uint64_t fread_block(byte_t *msg_block, void *stream) {
    return fread(msg_block, sizeof(byte_t), NUM_MSG_BLOCK_BYTES, (FILE*)stream);
}

// buffer read block (512 bits) byte-by-byte
// returns the number of bytes read into message block
uint64_t bread_block(byte_t *msg_block, void *stream) {
    stream_t *s = (stream_t*)stream;
    uint64_t bytes_left = s->stream_len - s->stream_pos;
    byte_t *new_buf = s->stream + s->stream_pos;

    if (bytes_left < NUM_MSG_BLOCK_BYTES) {
        memcpy(msg_block, new_buf, bytes_left);
        s->stream_pos += bytes_left;
        return bytes_left;
    }
    else {
        memcpy(msg_block, new_buf, NUM_MSG_BLOCK_BYTES);
        s->stream_pos += NUM_MSG_BLOCK_BYTES;
        return NUM_MSG_BLOCK_BYTES;
    }
    
}


/*******************************************************************************************************
 * 
 * 
 *                                      HIGH LEVEL SHA256 FUNCTIONS
 * 
 * 
********************************************************************************************************/
void fsha256(byte_t* hash, FILE *f) {
    sha256(hash, (void*)f, get_file_len(f), &fread_block);
}


void bsha256(byte_t* hash, byte_t *buf, uint64_t buf_len) {
    sha256(hash, (void*)init_stream(buf, buf_len), buf_len, &bread_block);
}


// streamable type should return number of bytes left
// it must keep track of the pointer position, like a FILE does
// it should have the base pointer
// read_block should return zero if the position pointer reaches the end of the stream 
// read_block should cast stream to appropiate type
void sha256(byte_t* hash_byte, void *stream, uint64_t stream_len, uint64_t (*read_block)(byte_t*, void*)) {
    byte_t msg_block[NUM_MSG_BLOCK_BYTES];
    uint64_t bytes_read;
    bool done = false;
    uint64_t block_num = 0;     // for debugging
    word_t hash[SHA256_SIZE_WORDS];

    init_sha256(hash);

    while (!done) {
        #ifdef DEBUG
            printf("block: %ld\n", block_num);
        #endif

        bytes_read = read_block(msg_block, stream);

        
        //remaining_bytes < NUM_MSG_BLOCK_BYTES
        if (bytes_read < NUM_MSG_BLOCK_BYTES) {
            done = add_padding(msg_block, bytes_read, stream_len);
        }

        sha2_update(hash, msg_block);

        block_num++;
    }

    int j = 0;
    for (int i = 0; i < SHA256_SIZE_WORDS; i++) {
        hash_byte[j++] = (byte_t)(hash[i] >> 24);
        hash_byte[j++] = (byte_t)(hash[i] >> 16);
        hash_byte[j++] = (byte_t)(hash[i] >> 8);
        hash_byte[j++] = (byte_t)hash[i];
    }
}



// /*******************************************************************************************************
//  * 
//  * 
//  *                                      COMMANDLINE FUNCTIONALITY
//  * 
//  * 
// ********************************************************************************************************/
// void main(int argc, char **argv) {
    

//     typedef enum {ARGT_INVALID, ARGT_FILE, ARGT_STRING} arg_type_t;
//     typedef enum {ARGM_INVALID, ARGM_TEXT, ARGM_BINARY} arg_mode_t;

//     arg_type_t arg_type;
//     arg_mode_t arg_mode = ARGM_TEXT;        // default text mode 
//     FILE *file;
//     byte_t hash[SHA256_SIZE_BYTES];

//     if (argc == 1) {
//         printf("Error.\nOptions:\n   -f file\n   -s string\n");
//         return;
//     }
//     else {
//         // get flag
//         if (strcmp("-f", argv[1]) == 0) {
//             arg_type = ARGT_FILE;
//         }
//         else if (strcmp("-s", argv[1]) == 0) {
//             arg_type = ARGT_STRING;
//         }
//         else {
//             arg_type = ARGT_INVALID;
//         }

//         // only for files
//         if (argc == 4) {
//             if (strcmp("-b", argv[3]) == 0) {
//                 arg_mode = ARGM_BINARY;
//             }
//             else if (strcmp("-t", argv[3]) == 0) {}
//             else {
//                 arg_mode = ARGM_INVALID;
//             }
//         }
//     }

//     if (argc == 2) {
//         switch (arg_type) {
//             case ARGT_FILE:
//                 printf("Error: no file path.\n");
//                 break;
            
//             case ARGT_STRING:
//                 printf("Error: no string.\n");
//                 break;

//             case ARGT_INVALID: break;
//             default:
//                 printf("Invalid arg(s). Run without any args to see possible args.\n");
//         }
//     }  
//     else if (argc >= 3) {
//         switch (arg_type) {
//             case ARGT_FILE:
//                 switch (arg_mode) {
//                     case ARGM_TEXT:
//                         file = fopen(argv[2], "r");
//                         break;

//                     case ARGM_BINARY:
//                         file = fopen(argv[2], "rb");
//                         break;

//                     case ARGM_INVALID:
//                     default:
//                         printf("Invalid file mode.\n");
//                         return;
//                 }
                
//                 fsha256(hash, file);
//                 output_hash(hash);
//                 fclose(file);
//                 break;
            
//             case ARGT_STRING:
//                 //printf("%d, %s\n", strlen(argv[2]), argv[2]);
//                 bsha256(hash, argv[2], strlen(argv[2]));
//                 output_hash(hash);
//                 break;

//             case ARGT_INVALID:
//             default:
//                 printf("Invalid arg(s). Run without any args to see possible args.\n");
//         }
//     }
// }