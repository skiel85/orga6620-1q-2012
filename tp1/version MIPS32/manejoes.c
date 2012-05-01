/* FUNCIONES DE E/S (manejoes.c) */

#include <stdio.h>
#include <stdlib.h>

#include "manejoes.h"
#include "mymalloc.h"

void *myrealloc(void *ptr, size_t old_size, size_t size) {

	//void *ptr_aux=NULL;

	//if (size==0) {
	//	if (ptr!=NULL)
	//		myfree(ptr);
	//	return (NULL);
	//}

	//ptr_aux = (void*)mymalloc(size);
	//return (ptr_aux);
	
	int minsize;
	void *newptr;
	
	// Allocate new block, returning NULL if not possible.
	
	newptr = mymalloc (size);
	if (newptr == NULL) return NULL;

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
		if (size < old_size)
			minsize = size;

	// Copy the memory, free the old block and return the new block.
		memcpy (newptr, ptr, minsize);
		myfree (ptr);
	}

    return newptr;	
}

int procesarEntrada(tDynArray* datos_sort) {

	unsigned long i=0;

	char aux_char;
	char* aux_data=NULL;

	while (my_read(stdinfd,&aux_char,1)) {
		
		datos_sort->data[i]=aux_char;
		datos_sort->size++;
		if (datos_sort->size==datos_sort->allocated) {
			aux_data=datos_sort->data;
			datos_sort->data=(char *)myrealloc(datos_sort->data, datos_sort->size, (datos_sort->allocated+BUFFER_SIZE)*sizeof(char));
			if (datos_sort->data==NULL) {
				myfree(aux_data);
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

	my_write(stdoutfd,datos_sort->data,datos_sort->size);
	return (EXIT_SUCCESS);
}

/* FIN DE FUNCIONES DE E/S (manejoes.c) */

