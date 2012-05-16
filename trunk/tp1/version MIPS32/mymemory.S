#include <mips/regdef.h>

/* void *mymemcpy (void * destination, const void * source, size_t num) */
.globl  mymemcpy
.ent    mymemcpy

mymemcpy:
	.frame		$fp,16,ra		# Definicion de stack frame
	subu		sp,sp,16		# Creo el stack frame
	.cprestore 8
	sw		$fp,12(sp)		# Guardo fp
	sw		gp,8(sp)		# Guardo gp
	move		$fp,sp			# fp=sp

# Guardo los argumentos que le pasan a la funcion
	sw		a0,16($fp)		# Guardo el argumento 0 (*destination)
	sw		a1,20($fp)		# Guardo el argumento 1 (*source)
	sw		a2,24($fp)		# Guardo el argumento 2 (num)

# Inicializo las variables locales
	lw		t0,16($fp)		# Cargo el valor de resultado en v0
	sw		t0,0($fp)		# void * resultado = destination

# Hacemos la copia de la memoria
	lw		t0,24($fp)		# Cargo en t0 el valor de num
while_mymemcpy_cond:
	addu		t0,t0,-1		# t0--
	sw		t0,24($fp)		# num--
	li		t1,-1			# t3=-1
	bne		t0,t1,while_mymemcpy_body  # while (num--) si t1 no es igual a -1, entramos al bucle
	b		mymemcpy_retorno_resultado # Si num=t1=-1 salimos del bucle
while_mymemcpy_body:
	lw		t1,16($fp)		# Cargo destination en t1
	lw		t2,20($fp)		# Cargo source en t2
	lb		t2,0(t2)		# Obtengo *(char *)source		
	sb		t2,0(t1)		# *(char *)destination = *(char *)source
		
	lw		t1,16($fp)		# Cargo destination en t1
	addu		t1,t1,1			# t1++
	sw		t1,16($fp)		# destination = (char *)destination + 1
		
	lw		t2,20($fp)		# Cargo source en t2
	addu		t2,t2,1			# t2++		
	sw		t2,20($fp)		# source = (char *)source + 1
	b		while_mymemcpy_cond	# Finalizado el body del while vuelvo a evaluar la condicion	

# Guardo en v0 el retorno de la funcion, resultado
mymemcpy_retorno_resultado:
	lw		v0,0($fp)		# v0=resultado

# Fin de la funcion
fin_mymemcpy:
	move		sp,$fp			# sp=fp
	lw		$fp,12(sp)		# Restauro fp
	lw		gp,8(sp)		# Restauro gp
	addu		sp,sp,16		# Elimino el stack frame
	j		ra			# Retorno a funcion llamadora

.end	mymemcpy

/* void *myrealloc(void *ptr, size_t old_size, size_t size) */
.text
.align	2
.globl	myrealloc
.ent	myrealloc

myrealloc:
	.frame		$fp,40,ra
	.set		noreorder
	.cpload		t9
	.set		reorder
	subu		sp, sp, 40
	.cprestore 24
	sw		ra, 32(sp)
	sw		$fp, 28(sp)
	move		$fp, sp
	sw		gp, 24(sp)

# Guardo los argumentos que le pasan a la funcion
	sw		a0, 40($fp)		# Guardo void *ptr
	sw		a1, 44($fp)		# Guardo size_t old_size
	sw		a2, 48($fp)		# Guardo size_t size

	lw		a0, 48($fp)		# Cargo en a0=size
	jal		mymalloc		# Llamo a mymalloc

	beqz		v0, return		# Si v0 es null, lo devuelve

	sw		v0, 16($fp)		# Guardo en 16($fp)=newptr

	lw		t0, 40($fp)		# Cargo en t0=ptr
	beqz		t0, return_newptr

	lw		a0, 16($fp)		# Cargo en a0=newptr
	lw		a1, 40($fp)		# Cargo en a1=ptr
	lw		a2, 44($fp)		# Cargo en a2=old_size

	jal		mymemcpy
	sw		v0, 16($fp)		# Guardo la direccion devuelva en 16($fp)=newptr

	lw		a0, 40($fp)		# Cargo en a0=ptr
	jal		myfree			# Llamo a myfree


return_newptr:
	lw		v0, 16($fp)

return:
	move		sp, $fp
	lw		$fp, 28(sp)
	lw		ra, 32(sp)
	addu		sp, sp, 40

	j		ra

.end		myrealloc

