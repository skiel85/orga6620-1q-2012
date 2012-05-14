#include <mips/regdef.h>

#ifndef	BUFFER_SIZE
#define BUFFER_SIZE 2048
#endif

#ifndef stdinfd
#define stdinfd 0
#endif

#ifndef stdoutfd
#define stdoutfd 1
#endif


	.text
	.align	2
	.globl	procesarEntrada
	.ent	procesarEntrada

procesarEntrada:
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
	sw	a0, 40(sp)

	li	t7, 0		#i=0 (i=t7)

while:
	sw	zero, 16(sp)	
	la	t0, 16(sp)	#t0=&aux_char

	li	a0, stdinfd	#a0=stdinfd 
	move	a1, t0		#a1=&aux_char
	li	a2, 1		#a2=1
	jal	my_read

	li	t0, 1
	bne	v0, t0, endwhile

	lbu	t1, 16(sp)	#t1=aux_char
	lw	t2, 40(sp)	#t2=datos_sort
	lw	t2, 0(t2)	#t2=datos_sort->data
	addu	t2, t2, t7	#t2=datos_sort->data[i]
	sb	t1, 0(t2)	#datos_sort->data[i]=aux_char

	lw	t2, 40(sp)	#t2=datos_sort
	lw	t3, 4(t2)	#t2=datos_sort->size
	
	addu	t3, t3, 1	#datos_sort->size++
	sw	t3, 4(t2)	
	
	lw	t0, 40(sp)	#t0=datos_sort
	lw	t1, 8(t0) 	#t1=datos_sort->allocated

	bne	t3, t1, endrealloc

	lw	t1, 0(t0)	#aux_data=datos_sort->data

	lw	a0, 0(t0)	#a0=datos_sort->data
	lw	a1, 4(t0)	#a1=datos_sort->size
	lw	a2, 8(t0)	#a1=datos_sort->allocated
	addiu	a2, a2, BUFFER_SIZE
	li	t3, 1		#t3=sizeof(char)
	mul	a2, a2, t3

	jal	myrealloc
	
	beqz	v0, error_memoria

	lw	t0, 40(sp)
	sw	v0, 0(t0)	#datos_sort->data=myrealloc
	lw	t2, 8(t0)	#t2=datos_sort->allocated
	addiu	t2, t2, BUFFER_SIZE
	sw	t2, 8(t0)

	b 	endrealloc

error_memoria:
	move	a0, t1
	jal	myfree
	li	v0, 3
	b	return
	
endrealloc:
	addu 	t7, t7, 1	#i++
	b	while
	
endwhile:

	li	v0, 0
	
return:
	move	sp, $fp	
	lw	$fp, 28(sp)
	lw	ra, 32(sp)
	addu	sp, sp, 40

	j	ra
	.end	procesarEntrada

	.text
	.align	2
	.globl	imprimirSalida
	.ent	imprimirSalida

imprimirSalida:
	.frame	$fp,32,ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 32
	.cprestore 16
	sw	ra, 24(sp)
	sw	$fp, 20(sp)
	move	$fp, sp
	sw	gp, 16(sp)

	#guardo a0
	sw	a0, 32(sp)

	li	a0, stdoutfd	#a0=stdoutfd

	lw	t2, 32(sp)	#t2=datos_sort
	lw	a1, 0(t2)	#a1=datos_sort->data

	lw	t2, 32(sp)	#t2=datos_sort
	lw	a2, 4(t2)	#a2=datos_sort->size

	jal my_write

	li	v0, 0

	move	sp, $fp
	lw	$fp, 20(sp)
	lw	ra, 24(sp)
	addu	sp, sp, 32

	j	ra
	.end	imprimirSalida

