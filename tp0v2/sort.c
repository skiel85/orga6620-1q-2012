/* ALGORITMOS DE SORT (sort.c) */

#include "sort.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* merge(char* left, char* right){

	unsigned long length_left=strlen(left);
	unsigned long length_right=strlen(right);

	char* result=malloc((length_left+length_right+1)*sizeof(char));

	unsigned long i=0;
	unsigned long j=0;
	unsigned long c=0;

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
   unsigned long c;

   pointer = malloc(length+1);

   if( pointer == NULL )
   {
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

int mergeSort(char* list, unsigned long length) {

	char* left=NULL;
	char* right=NULL;
	char* result=list;

	printf("MERGESORT!");
	
	if(length==1)
		return (EXIT_SUCCESS);

	unsigned long middle=length/2;
	unsigned long lengthRight=length-middle;

	left=substring(list,0,middle);
	right=substring(list,middle+1,lengthRight);

	mergeSort(left, middle);
	mergeSort(right, lengthRight);

	result=merge(left,right);
	list=result;

	free(left);
	free(right);

	return (EXIT_SUCCESS);
}

void swap(char* array, unsigned long index1, unsigned long index2) {

	char aux = array[index1];
	array[index1] = array[index2];
	array[index2] = aux;
}

int selectionSort(tDynArray* list) {

	unsigned long i, j;
	unsigned long minPos;

	for (i = 0; i < list->size; i++) {
	    minPos = i;

	    for (j = i+1; j < list->size; j++) {
		if (list->data[j] < list->data[minPos]) {
		    minPos = j;
		}
	    }
	 
	    if ( minPos != i ) {
		swap(list->data, i, minPos);
	    }
	}

	return (EXIT_SUCCESS);
}

/* FIN DE ALGORITMOS DE SORT (sort.c) */

