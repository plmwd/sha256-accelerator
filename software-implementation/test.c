#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>
//#include <sha2.h>

int do_operation(int a, int b, int (*op)(int, int)) {
    return op(a, b);
}

int add(int a, int b) {
    return a + b;
}

void main (void) {
    int num_times, result = 0, a = 69, b = 420;
    clock_t call_start, call_end, ptr_start, ptr_end;
    double call_ms = 0.0, ptr_ms = 0.0;

    printf("Num loops: ");
    scanf("%d", &num_times);

    call_start = clock();
    for (int i = 0; i < num_times; i++) {
        result += add(a, b);
    }
    call_end = clock();

    call_ms = (call_end - call_start) * 1000.0 / CLOCKS_PER_SEC;
    printf("direct function call timing for %d loops:\n", num_times);
    printf("total elapsed time: %.5fms\n", call_ms);
    printf("average time per call: %.5fus\n\n", call_ms * 1000 / num_times);

    result = 0;

    ptr_start = clock();
    for (int i = 0; i < num_times; i++) {
        result += do_operation(a, b, &add);
    }
    ptr_end = clock();

    ptr_ms = (ptr_end - ptr_start) * 1000.0 / CLOCKS_PER_SEC;
    printf("function pointer call timing for %d loops:\n", num_times);
    printf("total elapsed time: %.5fms\n", ptr_ms);
    printf("average time per call: %.5fus\n", ptr_ms * 1000 / num_times);
    
}