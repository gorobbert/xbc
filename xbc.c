#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>

#define BFILE "/sys/class/backlight/amdgpu_bl0/brightness"

int main(int argc, char *argv[]) {
    // Unsigned int brightness value should be in range 0-255
    unsigned long int ubv;
    char *eptr;
    FILE *fp;  

    if (argc != 2) {
	    fprintf(stderr, "usage: %s <brightness value>\n", argv[0]);
        exit(1);
    }
    ubv = strtoul(argv[1], &eptr, 10);
    if(ubv >= 0 && ubv < 256 && *eptr == '\0') {
        if (setuid(0) != 0) {
            perror("Failed");
            exit(1);
        }
        fp = fopen(BFILE, "w");
        if (fp == NULL) {
            perror("Failed");
            exit(1);
        }
        fprintf(fp, "%u", ubv);
        fclose(fp);
        return 0;
    } else  {
	    fprintf(stderr, "Error: brightness value not in range <0-255>\n");
        exit(1);
    }
}
