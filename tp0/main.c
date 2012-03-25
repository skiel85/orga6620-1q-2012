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
        	//error = encodeProcess(input,output, length);
        	printf("Usando el mergesort con input:'%s' y output:'%s'\n",input,output);
        }
        else if (action && ((strcmp(action, "--sel") == 0) || (strcmp(action, "-s") == 0))){
        	//error = decodeProcess(input,output);
        	printf("Usando el selectionsort con input:'%s' y output:'%s'\n",input,output);
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

int encodeProcess(const char* filein,const char* fileou, int lineLength) {
        FILE *fdi, *fdo;
        int i=0, c;

        fdi=strcmp(filein,"stdin") ?fopen(filein,"rb"):stdin;
	if (!fdi) return -1; /* Error while opening input file */
        fdo=strcmp(fileou,"stdout")?fopen(fileou,"wt"):stdout;
	if (!fdo) return -2; /* Error while opening output file */

        while ((c=fgetc(fdi))!=EOF) {
          fprintf(fdo,"%02x",c);
          if (lineLength && !((++i)%lineLength))
                fputc('\n',fdo);
         }
        if (!lineLength || i%lineLength)
                fputc('\n',fdo);
	fclose(fdi);
	fclose(fdo);
	return 0; /*Successfully finished*/
}

int decodeProcess(const char* filein,const char* fileou) {
	FILE *fdi, *fdo;
	int  c;

	fdi=strcmp(filein,"stdin") ?fopen(filein,"rb"):stdin;
	if (!fdi) return -1; /* Error while opening input file */
	fdo=strcmp(fileou,"stdout")?fopen(fileou,"wt"):stdout;
	if (!fdo) return -2; /* Error while opening output file */

	while (fscanf(fdi,"%02x", &c)!=EOF) {
		fputc(c,fdo);
	}

	fclose(fdi);
	fclose(fdo);

	return 0;
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
