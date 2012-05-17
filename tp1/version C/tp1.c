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
 * Fecha de entrega: 17/05/2012
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

	/* Validacion de la sintaxis de llamada al programa */
	if (argc>1) {
		fprintf(stderr,"tp1: syntax error, this program takes no arguments.\n");
		return (EXIT_FAILURE);
	}
			
	/* Inicializacion de la estructura utilizada para guardar los datos de entrada */
	datos_sort.data=(char*)malloc(BUFFER_SIZE*sizeof(char));
	if (datos_sort.data == NULL) {
		datos_sort.allocated=0;
		codigo_retorno=ERROR_RESERVA_INICIAL_MEMORIA;
	}
	if (codigo_retorno==0) {
		datos_sort.data[0]='\0';
		datos_sort.size=0;
		datos_sort.allocated=BUFFER_SIZE;
	}

	/* Llamada a la funcion que procesa stdin o los archivos de entrada y carga datos_string */
	if (codigo_retorno==0)
		codigo_retorno=procesarEntrada(&datos_sort);	

	/* Ordenamiento de los datos introducidos al programa */
	if (codigo_retorno==0)
		codigo_retorno=mergeSort(datos_sort.data,datos_sort.size);

	/* Impresion de la salida del programa */
	if (codigo_retorno==0)
		imprimirSalida(&datos_sort);

	/* Liberacion de la memoria reservada */
	if ((datos_sort.allocated) > 0) {
		free(datos_sort.data);
		datos_sort.data=NULL;
		datos_sort.size=0;
		datos_sort.allocated=0;
	}

	/* Impresion de errores y salida al SO */
	switch (codigo_retorno) {
		case EXIT_SUCCESS:
			return EXIT_SUCCESS;
			break;
		case ERROR_RESERVA_INICIAL_MEMORIA:
			fprintf(stderr, "tp1: insufficient memory to start processing input.\n");
			break;       
		case ERROR_RESERVA_MEMORIA:
			fprintf(stderr, "tp1: insufficient memory to continue processing input.\n");
			break;
     		default:
			fprintf(stderr, "tp1: unknown error.\n");
			abort();
    }

	return EXIT_FAILURE;
}
