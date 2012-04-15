/*
 *------------------------------------------------------------------------------
 *
 *                      66.20 - ORGANIZACION DE COMPUTADORAS
 *                          TP0: Infraestructura basica
 *
 *------------------------------------------------------------------------------
 *
 * Grupo:
 * 79979 - Gonzalez, Juan Manuel (juan0511@yahoo.com)
 * 83062 - Arguello, Osiris (osirisarguello@yahoo.com.ar)
 * 84474 - Paez, Ezequiel (skiel85@gmail.com)
 *
 * Fecha de entrega: 15/04/2012
 */

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#include "manejoes.h"
#include "sort.h"

/* Funcion que imprime la ayuda */
void imprimir_ayuda (FILE* stream, int exit_code){

  fprintf (stream,
		"tp0 [OPTIONS] [file...]\n"
		"-h, --help\t display this help and exit.\n"
		"-V, --version\t display version information and exit.\n"
		"-m, --merge\t use mergesort algorithm.\n"
		"-s, --sel\t use selectionsort algorithm.\n"
		"\n");
		
  exit (exit_code);
}

/* Funcion que imprime la version del programa */
void imprimir_version(FILE* stream, int exit_code){

	fprintf (stream, "TP0: v2.0.\n");
	exit (exit_code);
}

/* Funcion que imprime el complemento de los mensajes de error */
void imprimir_leer_mas(FILE* stream, int exit_code){

	fprintf (stream, "Try `tp0 --help' for more information.\n");
	exit (exit_code);
}

/* Funcion principal */
int main(int argc, char** argv){
	
	tDynArray datos_sort;

	char* path_error_entrada = "";

	int algoritmo_sort=1; /* 1-mergesort, 2-selectionsort */	
	int opcion=0;
	int codigo_retorno=0;
		
	const char* const short_options = "Vhms";

	const struct option long_options[] =
	{
		{ "version", 0, NULL, 'V' },
		{ "help", 0, NULL, 'h' },
		{ "merge", 0, NULL, 'm' },
		{ "sel", 0, NULL, 's' },
		{ NULL, 0, NULL, 0 },
	};

	/* Comienzo de la validacion de argumentos */
	while((opcion = getopt_long (argc, argv, short_options, long_options, NULL)) != -1) {

		switch (opcion)
		{
		    case 'h':   /* -h o --help */
			    	imprimir_ayuda(stdout, EXIT_SUCCESS);
		    		break;
		    case 'V':   /* -V o --version */
				   	imprimir_version(stdout, EXIT_SUCCESS);
				   	break;
		    case 'm':   /* -m o --merge */
					algoritmo_sort=1;
			    	break;
		    case 's':   /* -s o --sel */
					algoritmo_sort=2;
			    	break;
		    case '?':  /* argumento no valido */
			    	imprimir_leer_mas(stderr, EXIT_FAILURE);
				break;
		    default:
				abort();
		}
	}
	
	/* Inicializacion de la estructura utilizada para guardar los datos de entrada */
	datos_sort.data=calloc(BUFFER_SIZE, sizeof(char));
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
		codigo_retorno=procesarEntrada(&datos_sort, argv, argc, optind, &path_error_entrada);	

	/* Ordenamiento de los datos introducidos al programa, con el algoritmo correspondiente */
	if ((codigo_retorno==0) && (algoritmo_sort==1)) {
		codigo_retorno=mergeSort(datos_sort.data,datos_sort.size);
	}
	else
		if ((codigo_retorno==0) && (algoritmo_sort==2))
			codigo_retorno=selectionSort(&datos_sort);

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
			fprintf(stderr, "tp0: insufficient memory to start processing input.\n");
			break;       
		case ERROR_RESERVA_MEMORIA:
			fprintf(stderr, "tp0: insufficient memory to continue processing input.\n");
			break;
		case ERROR_ARCHIVO_ENTRADA:
			fprintf(stderr, "tp0: could not read input file `%s'.\n", path_error_entrada);
			break;	
     		default:
			fprintf(stderr, "tp0: unknown error.\n");
			abort();
    }

	return EXIT_FAILURE;
}

