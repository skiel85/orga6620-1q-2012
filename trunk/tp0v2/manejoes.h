/* FUNCIONES DE E/S (manejoes.h) */

#ifndef __MANEJOES_H__
  #define __MANEJOES_H__

	#include "def_errores.h"
	
	#define BUFFER_SIZE 2048

	typedef struct tDynArray {
		char *data;
		unsigned long size;
		unsigned long allocated;
	} tDynArray;
		
	int procesarEntrada(tDynArray* datos_sort, char** argv, int argc, int optind, char** path_error_entrada);
	int imprimirSalida(tDynArray* datos_sort);
	
#endif

/* FIN DE FUNCIONES DE E/S (manejoes.h) */

