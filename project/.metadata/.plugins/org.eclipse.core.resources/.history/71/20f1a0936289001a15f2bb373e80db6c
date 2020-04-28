#include "sha2.h"
#include <string.h>

// command line functionality of sha256 library


/*******************************************************************************************************
 * 
 * 
 *                                      COMMANDLINE FUNCTIONALITY
 * 
 * 
********************************************************************************************************/
void main(int argc, char **argv) {
    

    typedef enum {ARGT_INVALID, ARGT_FILE, ARGT_STRING} arg_type_t;
    typedef enum {ARGM_INVALID, ARGM_TEXT, ARGM_BINARY} arg_mode_t;

    arg_type_t arg_type;
    arg_mode_t arg_mode = ARGM_TEXT;        // default text mode 
    FILE *file;
    byte_t hash[SHA256_SIZE_BYTES];

    if (argc == 1) {
        printf("Error.\nOptions:\n   -f file\n   -s string\n");
        return;
    }
    else {
        // get flag
        if (strcmp("-f", argv[1]) == 0) {
            arg_type = ARGT_FILE;
        }
        else if (strcmp("-s", argv[1]) == 0) {
            arg_type = ARGT_STRING;
        }
        else {
            arg_type = ARGT_INVALID;
        }

        // only for files
        if (argc == 4) {
            if (strcmp("-b", argv[3]) == 0) {
                arg_mode = ARGM_BINARY;
            }
            else if (strcmp("-t", argv[3]) == 0) {}
            else {
                arg_mode = ARGM_INVALID;
            }
        }
    }

    if (argc == 2) {
        switch (arg_type) {
            case ARGT_FILE:
                printf("Error: no file path.\n");
                break;
            
            case ARGT_STRING:
                printf("Error: no string.\n");
                break;

            case ARGT_INVALID: break;
            default:
                printf("Invalid arg(s). Run without any args to see possible args.\n");
        }
    }  
    else if (argc >= 3) {
        switch (arg_type) {
            case ARGT_FILE:
                switch (arg_mode) {
                    case ARGM_TEXT:
                        file = fopen(argv[2], "r");
                        break;

                    case ARGM_BINARY:
                        file = fopen(argv[2], "rb");
                        break;

                    case ARGM_INVALID:
                    default:
                        printf("Invalid file mode.\n");
                        return;
                }
                
                fsha256(hash, file);
                output_hash(hash);
                fclose(file);
                break;
            
            case ARGT_STRING:
                //printf("%d, %s\n", strlen(argv[2]), argv[2]);
                bsha256(hash, argv[2], strlen(argv[2]));
                output_hash(hash);
                break;

            case ARGT_INVALID:
            default:
                printf("Invalid arg(s). Run without any args to see possible args.\n");
        }
    }
}