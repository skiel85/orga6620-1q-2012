/*
 *------------------------------------------------------------------------------
 *
 *                      66.20 - ORGANIZACION DE COMPUTADORAS
 *                      TP1: Conjunto de instrucciones MIPS
 *
 *------------------------------------------------------------------------------
 *
 * Grupo:
 * 79979 - Gonzalez, Juan Manuel (juan0511@yahoo.com)
 * 83062 - Arguello, Osiris (osirisarguello@yahoo.com.ar)
 * 84474 - Paez, Ezequiel (skiel85@gmail.com)
 *
 * Fecha de entrega: 03/05/2012
 */

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#include "manejoes.h"
#include "sort.h"

/* Funcion principal */
int main(int argc, char** argv){
	
	tDynArray datos_sort;
	int codigo_retorno=0;

	fprintf(stderr,"EMPIEZA MYMALLOC!\n");			
	/* Inicializacion de la estructura utilizada para guardar los datos de entrada */
	datos_sort.data=(char*)mymalloc(2048576*sizeof(char));//(BUFFER_SIZE*sizeof(char));
	if (datos_sort.data == NULL) {
		datos_sort.allocated=0;
		codigo_retorno=ERROR_RESERVA_INICIAL_MEMORIA;
	}
	if (codigo_retorno==0) {
		datos_sort.data[0]='\0';
		datos_sort.size=0;
		datos_sort.allocated=BUFFER_SIZE;
	}

	fprintf(stderr,"EMPIEZA PARSER!\n");
	/* Llamada a la funcion que procesa stdin o los archivos de entrada y carga datos_string */
	if (codigo_retorno==0)
		codigo_retorno=procesarEntrada(&datos_sort);	

	fprintf(stderr,"EMPIEZA SORT!\n");
	/* Ordenamiento de los datos introducidos al programa */
	if (codigo_retorno==0)
		codigo_retorno=mergeSort(datos_sort.data,datos_sort.size);

	fprintf(stderr,"EMPIEZA PRINT!\n");
	/* Impresion de la salida del programa */
	if (codigo_retorno==0)
		imprimirSalida(&datos_sort);

	/* Liberacion de la memoria reservada */
	if ((datos_sort.allocated) > 0) {
		myfree(datos_sort.data);
		datos_sort.data=NULL;
		datos_sort.size=0;
		datos_sort.allocated=0;
	}

	fprintf(stderr,"EMPIEZA MYFREE!\n");
	/* Impresion de errores y salida al SO */
	switch (codigo_retorno) {
		case EXIT_SUCCESS:
			return EXIT_SUCCESS;
			break;
		case ERROR_RESERVA_INICIAL_MEMORIA:
			fprintf(stderr, "tp0: insufficient memory to start processing input.\n");
			break;       
		case ERROR_RESERVA_MEMORIA:
			fprintf(stderr, "tp0: insufficient memory to continue processing input.\n");
			break;
     		default:
			fprintf(stderr, "tp0: unknown error.\n");
			abort();
    }

	return EXIT_FAILURE;
}
