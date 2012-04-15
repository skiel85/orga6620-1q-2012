/* FUNCIONES DE E/S (manejoes.c) */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "manejoes.h"

int procesarEntrada(tDynArray* datos_sort, char** argv, int argc, int optind, char** path_error_entrada) {

	unsigned long i=0;
	unsigned long j=0;
	unsigned long cantidad_archivos=(argc-optind);
	FILE* archivo_entrada=NULL;

	char* aux_char=NULL;
	char* aux_data=NULL;

	if (cantidad_archivos==0) {
		archivo_entrada=stdin;
		cantidad_archivos=1;
	}

	aux_char = (char*)malloc(sizeof(char));
	if (aux_char==NULL) {
		free(aux_char);
		aux_char=NULL;
		return(ERROR_RESERVA_MEMORIA);
	}

	for (i=0; i<cantidad_archivos; i++) {

		if (archivo_entrada!=stdin) {
			if (!(archivo_entrada=fopen(argv[i+optind],"rb"))) {  
				*path_error_entrada=argv[i+optind];
				return ERROR_ARCHIVO_ENTRADA;
			}
		}

		while (fread(aux_char, sizeof(char), 1, archivo_entrada)) {
			datos_sort->data[j]=aux_char[0];
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

			j++;
		}

		if (archivo_entrada!=stdin)			
			fclose (archivo_entrada);

	}

	free(aux_char);
	return (EXIT_SUCCESS);
}

int imprimirSalida(tDynArray* datos_sort) {

	fwrite(datos_sort->data, sizeof(char), datos_sort->size, stdout);
	return (EXIT_SUCCESS);
}

/* FIN DE FUNCIONES DE E/S (manejoes.c) */

