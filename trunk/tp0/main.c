#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void PrintHelp();
void PrintVersion();
void PrintTooManyParamError();
void PrintParameterError(char* param);
void PrintFileError(char* filename);
int decodeProcess(const char* filein,const char* fileou);
int encodeProcess(const char* input, const char* output, int lineLength);
int procesarOrdenamiento(const char* filein,const char* fileou, char* action);
char* mergeSort(char* list);
char* selectionSort(char* list);
long filesize(FILE** fd);
char* merge(char* left, char* right);
void swap(char* array, int index1, int index2);
char *substring(char *string, int position, int length);


int main(int argc, char* argv[])
{
    char showVersion = 0;
    char showHelp = 0;
    char showUnknownParam=0;
    char foundInput = 0;
    char* action = 0;
    char* input = 0;
    char* output = 0;

    int numArg = 1;

    if (argc>4){
        PrintTooManyParamError();
        return 1;
    }

    while (numArg < argc && !showVersion && !showHelp && !showUnknownParam){
    	char* param = argv[numArg];
		int paramLength = strlen(param);

		if (param[0] == '-')
		{
			if (paramLength == 2)
			{
				if (param[1] == 'v' || param[1] == 'V')
					showVersion = 1;
				else if (param[1] == 'h' || param[1] == 'H')
					showHelp = 1;
				else if (param[1] == 'm' || param[1] == 'M' || param[1] == 's' || param[1] == 'S'){
					action=param;
				}
				else{
					PrintParameterError(param);
					showUnknownParam = 1;
				}

			}
			else if (strcmp(param, "--version") == 0)
				showVersion = 1;
			else if (strcmp(param, "--help") == 0)
				showHelp = 1;
			else if (strcmp(param, "--merge") == 0 || strcmp(param, "--sel") == 0){
				action=param;
			}
			else{
				PrintParameterError(param);
				showUnknownParam = 1;

			}

		} else {
			if(!foundInput){
				input=param;
				foundInput=1;
			} else{
				output=param;
			}
		}

    	numArg++;
    }

    if (showVersion){
    	if (argc>2){
    		PrintTooManyParamError();
			PrintHelp();
    	} else {
    		PrintVersion();
    	}
    }
    else if (showHelp){
    	if (argc>2){
    		PrintTooManyParamError();
    	}
    	PrintHelp();
    } else if (showUnknownParam){
    	PrintHelp();
    }
    else
    {
        int error = 0;

        if (!input)
            input = "stdin";

        if (!output)
        	output = "stdout";

        error=procesarOrdenamiento(input, output, action);

        if (error==-1){
        	PrintFileError(input);
        } else {
        	if (error==-2){
        		PrintFileError(output);
        	}
        }

        return error;
    }

    return 0;
}

long filesize(FILE **fd){
	fseek(*fd, 0, SEEK_END); /* seek to end of file*/
	long size = ftell(*fd); /* get current file pointer*/
	fseek(*fd, 0, SEEK_SET); /* seek back to beginning of file*/
	/* proceed with allocating memory and reading the file*/

	return size;
}

int procesarOrdenamiento(const char* filein,const char* fileou, char* action) {
    FILE *fdi, *fdo;
    char* leido=0;

    fdi=strcmp(filein,"stdin") ?fopen(filein,"rb"):stdin;
	if (!fdi) return -1; /* Error while opening input file */
    fdo=strcmp(fileou,"stdout")?fopen(fileou,"wt"):stdout;
	if (!fdo) return -2; /* Error while opening output file */

	long size=filesize(&fdi);

	leido=malloc((size)*sizeof(char));

	fgets(leido,size+1,fdi);

	if (!action || ((strcmp(action, "--merge") == 0) || (strcmp(action, "-m") == 0))){
		/* Invocando el metodo mergeSort */
		leido=mergeSort(leido);
	}
	else if (action && ((strcmp(action, "--sel") == 0) || (strcmp(action, "-s") == 0))){
		/*Invocando el metodo selectionSort */
		leido=selectionSort(leido);
	}
	else
	{
		fprintf(stderr, "Unknown action\n");

		free(leido);
		fclose(fdi);
		fclose(fdo);
		return 1;
	}

	fputs(leido,fdo);


	free(leido);


	fclose(fdi);
	fclose(fdo);
	return 0; /*Successfully finished*/
}

char* mergeSort(char* list){

	char* left=0;
	char* right=0;
	char* result=list;

	long length=strlen(list);

	if(length==1)
		return result;

	long middle=length/2;
	long lengthRight=length-middle;

	left=substring(list,0,middle);
	right=substring(list,middle+1,lengthRight);

	left=mergeSort(left);
	right=mergeSort(right);

	result=merge(left,right);


	return result;

}

char* selectionSort(char* list) {

	int i, j;
	int minPos;

	int length=strlen(list);
	 
	for (i = 0; i < length; i++) {
	    minPos = i;

	    for (j = i+1; j < length; j++) {
		if (list[j] < list[minPos]) {
		    minPos = j;
		}
	    }
	 
	    if ( minPos != i ) {
		swap(list, i, minPos);
	    }
	}

	return list;
}

void swap(char* array, int index1, int index2) {
	char aux = array[index1];
	array[index1] = array[index2];
	array[index2] = aux;
}


char* merge(char* left, char* right){

	long length_left=strlen(left);
	long length_right=strlen(right);

	char* result=malloc((length_left+length_right+1)*sizeof(char));

	long i=0;
	long j=0;
	long c=0;

	while(i<length_left || j<length_right){
		if (i<length_left && j<length_right){
			if (left[i]<=right[j]){
				result[c]=left[i];
				i++;
			} else {
				result[c]=right[j];
				j++;
			}

		} else if(i<length_left){
			result[c]=left[i];
			i++;
		} else if(j<length_right) {
			result[c]=right[j];
			j++;
		}

		c++;
	}

	result[c]='\0';

	return result;

}

char *substring(char *string, int position, int length)
{
   char *pointer;
   int c;

   pointer = malloc(length+1);

   if( pointer == NULL )
   {
      printf("Unable to allocate memory.\n");
      exit(EXIT_FAILURE);
   }

   for( c = 0 ; c < position -1 ; c++ )
      string++;

   for( c = 0 ; c < length ; c++ )
   {
      *(pointer+c) = *string;
      string++;
   }

   *(pointer+c) = '\0';

   return pointer;
}

void PrintTooManyParamError()
{
    fprintf(stderr,"Error: too many parameters\n\n");
}

void PrintParameterError(char* param)
{
    fprintf(stderr,"Error: unknown parameter '%s' \n\n",param);
}

void PrintFileError(char* filename)
{
    fprintf(stderr,"Error: Impossible to open file '%s' \n\n",filename);
}

void PrintVersion(){
	printf("-- TP0 --\n");
	printf("Organización de Computadoras - 66.20\n");
	printf("Version 1.0\n");
}


void PrintHelp()
{
    printf("Usage:\n");
    printf(" tp0 [OPTIONS][file...]\n");
    printf("Options:\n");
    printf(" -h, --help \t Display this help and exit.\n");
    printf(" -V, --version \t Display version information and exit.\n");
    printf(" -m, --merge \t Use the mergesort algorithm.\n");
    printf(" -s, --sel \t Use the selectionsort algorithm.\n");
}
