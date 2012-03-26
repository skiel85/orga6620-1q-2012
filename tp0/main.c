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
int procesar_mergesort(const char* filein,const char* fileou);
int procesar_selectionsort(const char* filein,const char* fileou);
char* mergesort(char* list);
char* selectionsort(char* list);
long filesize(FILE** fd);
char* merge(char* left, char* right);
void swap(char* array, int index1, int index2);


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

    printf("\n");

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

        if (!action || ((strcmp(action, "--merge") == 0) || (strcmp(action, "-m") == 0))){
        	printf("Usando el mergesort con input:'%s' y output:'%s'\n",input,output);
        	error = procesar_mergesort(input,output);
        }
        else if (action && ((strcmp(action, "--sel") == 0) || (strcmp(action, "-s") == 0))){
        	printf("Usando el selectionsort con input:'%s' y output:'%s'\n",input,output);
		error = procesar_selectionsort(input,output);
        }
        else
        {
            fprintf(stderr, "Unknown action\n");
            return 1;
        }
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
	fseek(*fd, 0, SEEK_END); // seek to end of file
	long size = ftell(*fd); // get current file pointer
	fseek(*fd, 0, SEEK_SET); // seek back to beginning of file
	// proceed with allocating memory and reading the file

	return size;
}

int procesar_mergesort(const char* filein,const char* fileou) {
    FILE *fdi, *fdo;
    char* leido=0;

    fdi=strcmp(filein,"stdin") ?fopen(filein,"rb"):stdin;
	if (!fdi) return -1; /* Error while opening input file */
    fdo=strcmp(fileou,"stdout")?fopen(fileou,"wt"):stdout;
	if (!fdo) return -2; /* Error while opening output file */

	long size=filesize(&fdi);

	leido=malloc((size)*sizeof(char));

	fgets(leido,size+1,fdi);

	printf("texto leido: %s\n",leido);


	leido=mergesort(leido);

	fputs(leido,fdo);
	printf("\n");

	free(leido);


	fclose(fdi);
	fclose(fdo);
	return 0; /*Successfully finished*/
}

int procesar_selectionsort(const char* filein,const char* fileou) {
    FILE *fdi, *fdo;
    char* leido=0;

    fdi=strcmp(filein,"stdin") ?fopen(filein,"rb"):stdin;
	if (!fdi) return -1; /* Error while opening input file */
    fdo=strcmp(fileou,"stdout")?fopen(fileou,"wt"):stdout;
	if (!fdo) return -2; /* Error while opening output file */

	long size=filesize(&fdi);

	leido=malloc((size)*sizeof(char));

	fgets(leido,size+1,fdi);

	printf("texto leido: %s\n",leido);


	leido=selectionsort(leido);

	fputs(leido,fdo);
	printf("\n");

	free(leido);


	fclose(fdi);
	fclose(fdo);
	return 0; /*Successfully finished*/
}

char* mergesort(char* list){

	char* left;
	char* right;
	char* result=list;

	long length=strlen(list);

	if(length==1)
		return result;


	long middle=length/2;
	left=malloc((middle)*sizeof(char));
	strncpy(left,list,middle);

	right=malloc((length-middle)*sizeof(char));
	strncpy(right,list+middle,length-middle);

	left=mergesort(left);
	right=mergesort(right);

	result=merge(left,right);


	return result;

}

char* selectionsort(char* list) {

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

	char* result=malloc((length_left+length_right)*sizeof(char));

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

	return result;

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
