/* FUNCIONES DE E/S (manejoes.c) */

#include <stdio.h>
#include <stdlib.h>

#include "def_errores.h"
#include "manejoes.h"

void * mymemcpy (void * destination, const void * source, size_t num) {

	void * resultado = destination;

	while (num--) {
		*(char *)destination = *(char *)source;
		destination = (char *)destination + 1;
		source = (char *)source + 1;
	}

	return(resultado);
}


/* FIN DE FUNCIONES DE E/S (manejoes.c) */

