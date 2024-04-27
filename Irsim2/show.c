#include <stdio.h>
#include <stdlib.h>


void printBits(unsigned int num) {
	int bitarray[32];
    for (int i = 31; i >= 0; i--) {
        int bit = (num >> i) & 1; 
        bitarray[i] = bit;
    }
    for (int i = 0; i <= 31; i++) {
    	printf("%d ", bitarray[i]);
    	if((i+1) % 4 == 0)
    	{
    		printf("\n");
		}
	}
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <32-bit unsigned number>\n", argv[0]);
        return 1;
    }

    unsigned int num = strtoul(argv[1], NULL, 0);
    printBits(num);
    return 0;
}

