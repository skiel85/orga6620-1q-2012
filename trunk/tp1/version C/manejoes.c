/* FUNCIONES DE E/S (manejoes.c) */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "manejoes.h"

int procesarEntrada(tDynArray* datos_sort) {

	unsigned long i=0;

	char* aux_data=NULL;
	char aux_char;

	while (fread(&aux_char, sizeof(char), 1, stdin)) {
		datos_sort->data[i]=aux_char;
		datos_sort->size++;

		if (datos_sort->size==datos_sort->allocated) {
			aux_data=datos_sort->data;
			datos_sort->data=(char *)realloc(datos_sort->data, (datos_sort->allocated+BUFFER_SIZE)*sizeof(char));
			if (datos_sort->data==NULL) {
				free(aux_data);
				aux_data=NULL;
				return(ERROR_RESERVA_MEMORIA);
			}
			datos_sort->allocated=datos_sort->allocated+BUFFER_SIZE;
		}
		i++;
	}

	return (EXIT_SUCCESS);
}

int imprimirSalida(tDynArray* datos_sort) {

	fwrite(datos_sort->data, sizeof(char), datos_sort->size, stdout);
	return (EXIT_SUCCESS);
}

/* FIN DE FUNCIONES DE E/S (manejoes.c) */
