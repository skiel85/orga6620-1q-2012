/* FUNCIONES DE E/S (manejoes.h) */

#ifndef __MANEJOES_H__
  #define __MANEJOES_H__

	#include "def_errores.h"

	typedef struct tDynArray {
		char *data;
		unsigned long size;
		unsigned long allocated;
	} tDynArray;
		
	extern int procesarEntrada(tDynArray* datos_sort);
	extern int imprimirSalida(tDynArray* datos_sort);
	
#endif

/* FIN DE FUNCIONES DE E/S (manejoes.h) */

