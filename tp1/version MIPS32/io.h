/* FUNCIONES DE E/S (io.h) */

#ifndef __IO_H__
  #define __IO_H__

	#include "def_errores.h"
	
	extern ssize_t my_read(int,void*,size_t);
	extern ssize_t my_write(int,const void*,size_t);
	
#endif

/* FIN DE FUNCIONES DE E/S (io.h) */

