#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include "hefty1.h"

int main() {
    const char *test = "verycooltest";
    uint8_t digest[HEFTY1_DIGEST_BYTES];

    HEFTY1_Buf(test, strlen(test), digest);

    uint8_t i;
    for (i = 0; i < HEFTY1_DIGEST_BYTES; i++) {
        printf("%02X", digest[i]);
    }

    printf("\n");
    return 0;
}