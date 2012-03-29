#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void StrReverse(char *str);
long filesize(FILE **fd);

int main(int argc, char* argv[])
{
    int numArg = 1;
	char* param = argv[numArg];

    FILE *fdi;
    void* leido=0;

    fdi=fopen(param,"rb");
	if (!fdi) return -1; /* Error while opening input file */


	long size=filesize(&fdi);

	leido=malloc((size)*sizeof(char));

	fread(leido, sizeof(char), size, fdi);

	StrReverse((char*)leido);

}

void StrReverse(char *str)
{
	if(*str)
	{
		StrReverse(str+1);
		putchar(*str);
	}
}

long filesize(FILE **fd){
	fseek(*fd, 0, SEEK_END); /* seek to end of file*/
	long size = ftell(*fd); /* get current file pointer*/
	fseek(*fd, 0, SEEK_SET); /* seek back to beginning of file*/
	/* proceed with allocating memory and reading the file*/

	return size;
}
