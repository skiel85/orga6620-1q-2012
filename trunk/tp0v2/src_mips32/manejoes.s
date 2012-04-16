	.file	1 "manejoes.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"rb\000"
	.text
	.align	2
	.globl	procesarEntrada
	.ent	procesarEntrada
procesarEntrada:
	.frame	$fp,72,$ra		# vars= 32, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,68($sp)
	sw	$fp,64($sp)
	sw	$gp,60($sp)
	sw	$s0,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	sw	$a2,80($fp)
	sw	$a3,84($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	lw	$v1,80($fp)
	lw	$v0,84($fp)
	subu	$v0,$v1,$v0
	sw	$v0,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	sw	$zero,44($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L18
	la	$v0,__sF
	sw	$v0,36($fp)
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
$L18:
	li	$a0,1			# 0x1
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$v0,40($fp)
	bne	$v0,$zero,$L19
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,40($fp)
	li	$v0,3			# 0x3
	sw	$v0,48($fp)
	b	$L17
$L19:
	sw	$zero,24($fp)
$L20:
	lw	$v0,24($fp)
	lw	$v1,32($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L23
	b	$L21
$L23:
	lw	$v1,36($fp)
	la	$v0,__sF
	beq	$v1,$v0,$L24
	lw	$v1,24($fp)
	lw	$v0,84($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,2
	lw	$v0,76($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$a1,$LC0
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v0,36($fp)
	bne	$v0,$zero,$L24
	lw	$a0,88($fp)
	lw	$v1,24($fp)
	lw	$v0,84($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,2
	lw	$v0,76($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	sw	$v0,0($a0)
	li	$v0,4			# 0x4
	sw	$v0,48($fp)
	b	$L17
$L24:
	.set	noreorder
	nop
	.set	reorder
$L26:
	lw	$a0,40($fp)
	li	$a1,1			# 0x1
	li	$a2,1			# 0x1
	lw	$a3,36($fp)
	la	$t9,fread
	jal	$ra,$t9
	bne	$v0,$zero,$L28
	b	$L27
$L28:
	lw	$v0,72($fp)
	lw	$v1,0($v0)
	lw	$v0,28($fp)
	addu	$v1,$v1,$v0
	lw	$v0,40($fp)
	lbu	$v0,0($v0)
	sb	$v0,0($v1)
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	lw	$v0,4($v0)
	addu	$v0,$v0,1
	sw	$v0,4($v1)
	lw	$v0,72($fp)
	lw	$v1,72($fp)
	lw	$a0,4($v0)
	lw	$v0,8($v1)
	bne	$a0,$v0,$L29
	lw	$v0,72($fp)
	lw	$v0,0($v0)
	sw	$v0,44($fp)
	lw	$s0,72($fp)
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	lw	$v0,8($v0)
	addu	$v0,$v0,2048
	lw	$a0,0($v1)
	move	$a1,$v0
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,72($fp)
	lw	$v0,0($v0)
	bne	$v0,$zero,$L30
	lw	$a0,44($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,44($fp)
	li	$v0,3			# 0x3
	sw	$v0,48($fp)
	b	$L17
$L30:
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	lw	$v0,8($v0)
	addu	$v0,$v0,2048
	sw	$v0,8($v1)
$L29:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L26
$L27:
	lw	$v1,36($fp)
	la	$v0,__sF
	beq	$v1,$v0,$L22
	lw	$a0,36($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L22:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L20
$L21:
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,48($fp)
$L17:
	lw	$v0,48($fp)
	move	$sp,$fp
	lw	$ra,68($sp)
	lw	$fp,64($sp)
	lw	$s0,56($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	procesarEntrada
	.size	procesarEntrada, .-procesarEntrada
	.align	2
	.globl	imprimirSalida
	.ent	imprimirSalida
imprimirSalida:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	lw	$v1,40($fp)
	lw	$a0,0($v0)
	li	$a1,1			# 0x1
	lw	$a2,4($v1)
	la	$a3,__sF+88
	la	$t9,fwrite
	jal	$ra,$t9
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	imprimirSalida
	.size	imprimirSalida, .-imprimirSalida
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
