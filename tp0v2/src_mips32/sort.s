	.file	1 "sort.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	mergeSort
	.ent	mergeSort
mergeSort:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$v0,76($fp)
	srl	$v0,$v0,1
	sw	$v0,36($fp)
	sw	$zero,40($fp)
	lw	$v1,76($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L18
	sw	$zero,44($fp)
	b	$L17
$L18:
	lw	$a0,72($fp)
	lw	$a1,36($fp)
	la	$t9,mergeSort
	jal	$ra,$t9
	lw	$v1,72($fp)
	lw	$v0,36($fp)
	addu	$a0,$v1,$v0
	lw	$v1,76($fp)
	lw	$v0,36($fp)
	subu	$v0,$v1,$v0
	move	$a1,$v0
	la	$t9,mergeSort
	jal	$ra,$t9
	lw	$a0,76($fp)
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
	sw	$v0,44($fp)
	b	$L17
$L19:
	sw	$zero,24($fp)
	lw	$v0,36($fp)
	sw	$v0,28($fp)
	sw	$zero,32($fp)
$L20:
	lw	$v0,24($fp)
	lw	$v1,36($fp)
	sltu	$v0,$v0,$v1
	beq	$v0,$zero,$L21
	lw	$v0,28($fp)
	lw	$v1,76($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L23
	b	$L21
$L23:
	addu	$a1,$fp,32
	lw	$v0,0($a1)
	move	$a0,$v0
	lw	$v1,40($fp)
	addu	$a0,$a0,$v1
	sw	$a0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,0($a1)
	lw	$v1,72($fp)
	lw	$v0,24($fp)
	addu	$a0,$v1,$v0
	lw	$v1,72($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	lb	$v1,0($a0)
	lb	$v0,0($v0)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L25
	lw	$v1,24($fp)
	move	$a0,$v1
	lw	$v0,72($fp)
	addu	$v0,$a0,$v0
	lbu	$v0,0($v0)
	sb	$v0,52($fp)
	addu	$v1,$v1,1
	sw	$v1,24($fp)
	b	$L26
$L25:
	addu	$a1,$fp,28
	lw	$v1,0($a1)
	move	$a0,$v1
	lw	$v0,72($fp)
	addu	$v0,$a0,$v0
	lbu	$v0,0($v0)
	sb	$v0,52($fp)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
$L26:
	lbu	$v0,52($fp)
	lw	$v1,48($fp)
	sb	$v0,0($v1)
	b	$L20
$L21:
	.set	noreorder
	nop
	.set	reorder
$L27:
	lw	$v0,24($fp)
	lw	$v1,36($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L29
	b	$L28
$L29:
	addu	$a3,$fp,32
	lw	$a1,0($a3)
	move	$v1,$a1
	lw	$v0,40($fp)
	addu	$a2,$v1,$v0
	lw	$v1,24($fp)
	move	$a0,$v1
	lw	$v0,72($fp)
	addu	$v0,$a0,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a2)
	addu	$v1,$v1,1
	sw	$v1,24($fp)
	addu	$a1,$a1,1
	sw	$a1,0($a3)
	b	$L27
$L28:
	.set	noreorder
	nop
	.set	reorder
$L30:
	lw	$v0,28($fp)
	lw	$v1,76($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L32
	b	$L31
$L32:
	addu	$a3,$fp,32
	lw	$a1,0($a3)
	move	$v1,$a1
	lw	$v0,40($fp)
	addu	$t0,$v1,$v0
	addu	$a2,$fp,28
	lw	$v1,0($a2)
	move	$a0,$v1
	lw	$v0,72($fp)
	addu	$v0,$a0,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($t0)
	addu	$v1,$v1,1
	sw	$v1,0($a2)
	addu	$a1,$a1,1
	sw	$a1,0($a3)
	b	$L30
$L31:
	sw	$zero,24($fp)
$L33:
	lw	$v0,24($fp)
	lw	$v1,76($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L36
	b	$L34
$L36:
	lw	$v1,72($fp)
	lw	$v0,24($fp)
	addu	$a0,$v1,$v0
	lw	$v1,40($fp)
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L33
$L34:
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,44($fp)
$L17:
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	mergeSort
	.size	mergeSort, .-mergeSort
	.align	2
	.globl	swap
	.ent	swap
swap:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$a1,28($fp)
	sw	$a2,32($fp)
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,8($fp)
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$a0,$v1,$v0
	lw	$v1,24($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v1,24($fp)
	lw	$v0,32($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,8($fp)
	sb	$v0,0($v1)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	swap
	.size	swap, .-swap
	.align	2
	.globl	selectionSort
	.ent	selectionSort
selectionSort:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$zero,24($fp)
$L39:
	lw	$v0,56($fp)
	lw	$v1,24($fp)
	lw	$v0,4($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L42
	b	$L40
$L42:
	lw	$v0,24($fp)
	sw	$v0,32($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
$L43:
	lw	$v0,56($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L46
	b	$L44
$L46:
	lw	$v0,56($fp)
	lw	$v1,0($v0)
	lw	$v0,28($fp)
	addu	$a0,$v1,$v0
	lw	$v0,56($fp)
	lw	$v1,0($v0)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	lb	$v1,0($a0)
	lb	$v0,0($v0)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L45
	lw	$v0,28($fp)
	sw	$v0,32($fp)
$L45:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L43
$L44:
	lw	$v1,32($fp)
	lw	$v0,24($fp)
	beq	$v1,$v0,$L41
	lw	$v0,56($fp)
	lw	$a0,0($v0)
	lw	$a1,24($fp)
	lw	$a2,32($fp)
	la	$t9,swap
	jal	$ra,$t9
$L41:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L39
$L40:
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	selectionSort
	.size	selectionSort, .-selectionSort
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
