	#include <mips/regdef.h>

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

