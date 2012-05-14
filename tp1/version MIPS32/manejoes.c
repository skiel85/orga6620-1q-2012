/* FUNCIONES DE E/S (manejoes.c) */

#include <stdio.h>
#include <stdlib.h>

#include "def_errores.h"
#include "manejoes.h"
#include "mymalloc.h"

void * mymemcpy (void * destination, const void * source, size_t num) {

	void * resultado = destination;

	while (num--) {
		*(char *)destination = *(char *)source;
		destination = (char *)destination + 1;
		source = (char *)source + 1;
	}

	return(resultado);
}

void *myrealloc(void *ptr, size_t old_size, size_t size) {

	int minsize;
	void *newptr;
	
	// Allocate new block, returning NULL if not possible.	
	newptr = mymalloc (size);
	if (newptr == NULL)
		return NULL;

	// Don't copy/free original block if it was NULL.
	if (ptr != NULL) {
		// Get size to copy - mm_getsize must give you the size of the current block.
		// But, if new size is smaller, only copy that much. Many implementations
		// actually reserve the 16 bytes in front of the memory to store this info, e.g.,
		// +--------+--------------------------------+
		// | Header | Your data                      |
		// +--------+--------------------------------+
		//           ^
		//           +--- this is your pointer.
		// <- This is the memory actually allocated ->
	
		//minsize = mm_getsize (ptr);
		minsize = old_size;
	
		// Copy the memory, free the old block and return the new block.
		mymemcpy (newptr, ptr, minsize);
		myfree (ptr);
	}

	return newptr;
}

/* FIN DE FUNCIONES DE E/S (manejoes.c) */

