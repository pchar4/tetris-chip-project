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
    if (argc < 2) {
        printf("Usage: showirsim 2 4 8 16 32 64...\n");
        return 1;
    }
    int i;
    for (i = 0; i< argc; i++) {
    int number = atoi(argv[i]);
    int time = 150 + 40 * i;
    printf("Cycle Time  %d\n", time);
    printf("Board Value %u\n", number);
    printBits(number);
    printf("\n\n");
    }
    return 0;
}

