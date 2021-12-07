#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <string.h>

#include "hefty1.h"

void hefty1_string(const char *string, char outputBuffer[65]) {
    uint8_t hash[HEFTY1_DIGEST_BYTES];
    uint8_t i;

    HEFTY1_Buf(string, strlen(string), hash);
    for(i = 0; i < HEFTY1_DIGEST_BYTES; i++) {
        sprintf(outputBuffer + (i * 2), "%02x", hash[i]);
    }
    outputBuffer[64] = 0;
}

int main(int argc, char **argv) {
    char hash_buffer[65];
    int i;
    int num_hashes = 3500;
    clock_t t;
	
    printf("Benchmarking 1 Thread...\n");
        
    t = clock();
    for(i = 0; i < num_hashes; i++) {
        hefty1_string(hash_buffer, hash_buffer);
    }
    t = clock() - t;

    printf("~%d H/s\n", (int)(num_hashes / (((double)t) / CLOCKS_PER_SEC)));
}