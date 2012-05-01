/* ALGORITMOS DE SORT (sort.c) */

#include "sort.h"
#include <stdio.h>
#include <stdlib.h>


int mergeSort(char *list, unsigned long length) {

	unsigned long i, j, k, f = length / 2; /* Inicializamos la variable f con la mitad de la longitud del array */
	char* tmp = NULL; /* Array temporal */

	if (length == 1) /* Si es un ordenamiento trivial no hacemos nada */
		return (EXIT_SUCCESS);

	mergeSort(list, f); /* Llamamos al sort con la primer mitad */
	mergeSort(list + f, length - f); /* Llamamos al sort con la segunda mitad */

	tmp = (char*)malloc(length*sizeof(char)); /* Hacemos la union de ambas partes */
	if (tmp==NULL) {
		free(tmp);
		tmp=NULL;
		return(ERROR_RESERVA_MEMORIA);
	}

	for (i = 0, j = f, k = 0; i < f && j < length;)
		tmp[k++] = (list[i] < list[j]) ? list[i++] : list[j++];

	/* Hacemos merge del resto */
	while (i < f)
		tmp[k++] = list[i++];
	while (j < length)
		tmp[k++] = list[j++];

	for (i = 0; i < length; i++)
		list[i] = tmp[i];

	free(tmp); /* Liberamos la memoria reservada para el array temporal */

	return (EXIT_SUCCESS);
}

/* FIN DE ALGORITMOS DE SORT (sort.c) */

