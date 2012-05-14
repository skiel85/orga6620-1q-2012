#include <mips/regdef.h>
#include "def_errores.h"

.globl	main
.ent	main

# Mensajes

.data
msg0:		.asciiz		"tp1: syntax error, this program takes no arguments.\n"
msg0len:	.word		52
nl:		.asciiz		"\n"

# Programa principal

.text
main:
	.frame		$fp,32,ra		# Definicion de stack frame
	subu		sp,sp,32		# Creo el stack frame
	.cprestore 16
	sw		ra,24(sp)		# Guardo ra
	sw		$fp,20(sp)		# Guardo fp
	sw		gp,16(sp)		# Guardo gp
	move		$fp,sp			# fp=sp

# Guardo los argumentos que le pasan a la funcion
	sw		a0,32($fp)		# Guardo el argumento 0 (argc)
	sw		a1,36($fp)		# Guardo el argumento 1 (**argv)

# Validacion de la sintaxis de la llamada al programa
	subu		a0,a0,1			# Resto en uno la cantidad de argumentos
	beqz		a0,syntax_ok		# No imprimo error si no hay argumentos
	li		a0,stderrfd		# a0=stream (stdoutfd)
	la		a1,msg0			# a1=data
	lw		a2,msg0len		# a1=size
	jal		my_write		# Llamada a my_write

syntax_ok:
	

# Fin de la funcion
fin_main:
	move		sp,$fp			# sp=fp
	lw		ra,24(sp)		# Restauro ra
	lw		$fp,20(sp)		# Restauro fp
	lw		gp,16(sp)		# Restauro gp
	addu		sp,sp,32		# Elimino el stack frame
	j		ra			# Retorno a funcion llamadora
.end	main

