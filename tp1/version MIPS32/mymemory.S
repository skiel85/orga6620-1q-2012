#include <mips/regdef.h>

#void * mymemcpy (void * destination, const void * source, size_t num) {

#	void * resultado = destination;

#	while (num--) {
#		*(char *)destination = *(char *)source;
#		destination = (char *)destination + 1;
#		source = (char *)source + 1;
#	}

#	return(resultado);
#}

#12.fp
#8.gp
#4.-
#0.resultado

.globl	mymemcpy
.ent	mymemcpy

mymemcpy:
#	.frame		$fp,56,ra		# Definicion de stack frame
	subu		sp,sp,16		# Creo el stack frame
	.cprestore 8
	sw		$fp,12(sp)		# Guardo fp
	sw		gp,8(sp)		# Guardo gp
	move		$fp,sp			# fp=sp

# Guardo los argumentos que le pasan a la funcion
	sw		a0,16($fp)		# Guardo el argumento 0 (*destination)
	sw		a1,20($fp)		# Guardo el argumento 1 (*source)
	sw		a3,24($fp)		# Guardo el argumento 2 (num)

# Inicializo las variables locales
	lw		t0,16($fp)
	sw		t0,0($fp)

# Hacemos la copia de la memoria
	lw		t1,16($fp)
	lw		t2,20($fp)
	lw		t3,24($fp)
	beqz		t3,retorno_resultado
	li		t4,1
while_mymemcpy:

	lb		t5,0(t2)
	sb		t5,0(t1)
	
	addiu		t1,1
	sw		t1,16($fp)

	addiu		t2,1
	sw		t2,20($fp)

	subu		t3,t3,t4
	sw		t3,24($fp)
	bnez		t3,while_mymemcpy

# Guardo en v0 el retorno de la funcion, resultado
retorno_resultado:
	move		v0,t0			# v0=resultado

# Fin de la funcion
fin_mymemcpy:
	move		sp,$fp			# sp=fp
	lw		$fp,12(sp)		# Restauro fp
	lw		gp,8(sp)		# Restauro gp
	addu		sp,sp,16		# Elimino el stack frame
	j		ra			# Retorno a funcion llamadora

.end	mymemcpy


	.text
	.align	2
	.globl	myrealloc
	.ent	myrealloc

myrealloc:
	.frame	$fp,40,ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 40
	.cprestore 24
	sw	ra, 32(sp)
	sw	$fp, 28(sp)
	move	$fp, sp
	sw	gp, 24(sp)

	#guardo a0
	sw	a0, 40($fp)	#guardo void *ptr
	sw	a1, 44($fp)	#guardo size_t old_size
	sw	a2, 48($fp)	#guardo	size_t size

	lw	a0, 48($fp)	#cargo en a0=size
	jal	mymalloc	#llamo a mymalloc

	beqz	v0, return	#Si v0 es null, lo devuelve

	sw	v0, 16($fp)	#guardo en 16($fp)=newptr

	lw	t0, 40($fp)	#cargo en t0=ptr
	beqz	t0, return_newptr

	lw	a0,	16($fp)	#Cargo en a0=newptr
	lw	a1, 40($fp)	#Cargo en a1=ptr
	lw	a2, 44($fp)	#Cargo en a2=old_size

	jal	mymemcpy
	sw	v0, 16($fp)	#Guardo la direccion devuelva en 16($fp)=newptr

	lw	a0, 40($fp)	#Cargo en a0=ptr
	jal	myfree		#llamo a myfree


return_newptr:
	lw	v0, 16($fp)

return:
	move	sp, $fp
	lw	$fp, 28(sp)
	lw	ra, 32(sp)
	addu	sp, sp, 40

	j	ra
	.end	myrealloc

