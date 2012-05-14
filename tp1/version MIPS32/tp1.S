#include <mips/regdef.h>
#include "def_errores.h"
/*#include "manejoes.h"
#include "mymalloc.h"
#include "sort.h"*/

#define SSIZE			(48)

/* Client arg. Area */
#define	O_ARG3		((SSIZE)+12)
#define	O_ARG2		((SSIZE)+8)
#define	O_ARG1		((SSIZE)+4)
#define	O_ARG0		(SSIZE)
/* Saved reg. area */
/* 	 		((SSIZE)-4) */
#define	O_RA		((SSIZE)-8)
#define	O_FP		((SSIZE)-12)
#define	O_GP		((SSIZE)-16)
/* Local area */
/* 	 		((SSIZE)-20) */
#define	O_ALLOC		((SSIZE)-24)
#define	O_SIZE		((SSIZE)-28)
#define	O_DATA		((SSIZE)-32)

/* Arg. building area */
/*			((SSIZE)-36) */
/*			((SSIZE)-40) */
/*			((SSIZE)-44) */
/*			((SSIZE)-48) */

#define BUFFER_SIZE 	2048

.globl	main
.ent	main

# Mensajes

.data
msg0:		.asciiz		"tp1: syntax error, this program takes no arguments.\n"
msg0len:	.word		52
msg1:		.asciiz		"tp1: insufficient memory to start processing input.\n"
msg1len:	.word		52
nl:		.asciiz		"\n"

# Programa principal

.text
main:
	.frame		$fp,SSIZE,ra		# Definicion de stack frame
	subu		sp,sp,SSIZE		# Creo el stack frame
	.cprestore SSIZE
	sw		ra,O_RA(sp)		# Guardo ra
	sw		$fp,O_FP(sp)		# Guardo fp
	sw		gp,O_GP(sp)		# Guardo gp
	move		$fp,sp			# fp=sp

# Guardo los argumentos que le pasan a la funcion
	sw		a0,O_ARG0($fp)		# Guardo el argumento 0 (argc)
	sw		a1,O_ARG1($fp)		# Guardo el argumento 1 (**argv)

# Validacion de la sintaxis de la llamada al programa
	subu		t0,a0,1			# Resto en uno la cantidad de argumentos
	bnez		t0,syntax_error		# Imprimo error si hay argumentos

# Inicializo variables locales
	li		t0,0			# Valor inicial de varias variables
	sw		t0,O_DATA($fp)		# datosSort.data
	sw		t0,O_SIZE($fp)		# datosSort.size
	sw		t0,O_ALLOC($fp)		# datosSort.allocated

# Reservo memoria inicial para los datos de entrada
	li		a0,BUFFER_SIZE		# Bytes a alocar
	jal		mymalloc		# Llamada a mymalloc
	beqz		v0,alloc_error		# Salto si no se aloco memoria

# Inicializo datos de entrada
	move		t0,v0
	li		t1,0
	li		t2,BUFFER_SIZE
	sw		t0,O_DATA($fp)		# datos_sort.data=v0
	sw		t1,O_SIZE($fp)		# datos_sort.size=0
	sw		t2,O_ALLOC($fp)		# datos_sort.allocated=BUFFER_SIZE

# Proceso la entrada	
	addi		a0,$fp,O_DATA		# a0=datos_sort
#	jal		procesarEntrada		# Llamada a procesarEntrada
	li		v0,0			# DEBUG: mientras esté comentado arriba
	bnez		v0,alloc_error		# Saltar si hubo error

# Ordeno
	addi		t0,$fp,O_DATA		# t0=datos_sort
	lw		a0,0(t0)		# a0=datos_sort.data
	lw		a1,4(t0)		# a1=datos_sort.size
#	jal		mergeSort		# Llamada a mergeSort
	bnez		v0,alloc_error		# Saltar si hubo error

# Imprimo la salida
	addi		a0,$fp,O_DATA		# a0=datos_sort
#	jal		imprimirSalida		# Llamada a imprimirSalida
	li		v0,0			# DEBUG: mientras esté comentado arriba
	bnez		v0,alloc_error		# Saltar si hubo error

# Libero la memoria
	addi		t0,$fp,O_DATA		# t0=datos_sort
	lw		a0,0(t0)		# a0=datos_sort.data
	jal		myfree			# Llamada a myfree
#	li		v0,0			# DEBUG: mientras esté comentado arriba
	bnez		v0,alloc_error		# Saltar si hubo error

# Fin exitoso de la funcion
fin_ok:
	li		v0,0			# v0=0
	j		fin_main		# Finalizo el programa

# Impresión de mensajes de error
syntax_error:
	li		a0,stderrfd		# a0=stream
	la		a1,msg0			# a1=data
	lw		a2,msg0len		# a1=size
	jal		my_write		# Llamada a my_write
	li		v0,1			# Establezco el codigo de error
	j		fin_main		# Finalizo el programa

alloc_error:
	li		a0,stderrfd		# a0=stream
	la		a1,msg1			# a1=data
	lw		a2,msg1len		# a1=size
	jal		my_write		# Llamada a my_write
	li		v0,2			# Establezco el codigo de error
	j		fin_main		# Finalizo el programa

# Fin de la funcion
fin_main:
	move		sp,$fp			# sp=fp
	lw		ra,O_RA(sp)		# Restauro ra
	lw		$fp,O_FP(sp)		# Restauro fp
	lw		gp,O_GP(sp)		# Restauro gp
	addu		sp,sp,SSIZE		# Elimino el stack frame
	j		ra			# Retorno a funcion llamadora
.end	main
