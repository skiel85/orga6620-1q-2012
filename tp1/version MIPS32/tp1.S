#include <mips/regdef.h>
#include "def_errores.h"

.globl	main
.ent	main

# Mensajes

.data
msg0:	.asciiz "Mensaje."
nl:	.asciiz "\n"

# Programa principal

.text
main:
	.frame		$fp,16,ra		# Definicion de stack frame
	subu		sp,sp,16		# Creo el stack frame
	.cprestore 0
	sw		ra,8(sp)		# Guardo ra
	sw		$fp,4(sp)		# Guardo fp
	sw		gp,0(sp)		# Guardo gp
	move		$fp,sp			# fp=sp

# Guardo los argumentos que le pasan a la funcion
	sw		a0,16($fp)		# Guardo el argumento 0 (argc)
	sw		a1,20($fp)		# Guardo el argumento 1 (**argv)

# Llamada de prueba a my_write

	li		a0,stdoutfd		# a0=stream (stdoutfd)
	la		a1,msg0			# a1=data
	li		a2,9			# a1=size
	jal		my_write		# Llamada a my_write

# Fin de la funcion
fin_main:
	move		sp,$fp			# sp=fp
	lw		ra,8(sp)		# Restauro ra
	lw		$fp,4(sp)		# Restauro fp
	lw		gp,0(sp)		# Restauro gp
	addu		sp,sp,16		# Elimino el stack frame
	j		ra			# Retorno a funcion llamadora
.end	main


