	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"--version\000"
	.align	2
$LC1:
	.ascii	"--help\000"
	.align	2
$LC2:
	.ascii	"--merge\000"
	.align	2
$LC3:
	.ascii	"--sel\000"
	.align	2
$LC4:
	.ascii	"stdin\000"
	.align	2
$LC5:
	.ascii	"stdout\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
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
	sb	$zero,24($fp)
	sb	$zero,25($fp)
	sb	$zero,26($fp)
	sb	$zero,27($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
	lw	$v0,72($fp)
	slt	$v0,$v0,5
	bne	$v0,$zero,$L18
	la	$t9,PrintTooManyParamError
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,52($fp)
	b	$L17
$L18:
	.set	noreorder
	nop
	.set	reorder
$L19:
	lw	$v0,40($fp)
	lw	$v1,72($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L20
	lb	$v0,24($fp)
	bne	$v0,$zero,$L20
	lb	$v0,25($fp)
	bne	$v0,$zero,$L20
	lb	$v0,26($fp)
	bne	$v0,$zero,$L20
	lw	$v0,40($fp)
	sll	$v1,$v0,2
	lw	$v0,76($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	sw	$v0,44($fp)
	lw	$a0,44($fp)
	la	$t9,strlen
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v0,44($fp)
	lb	$v1,0($v0)
	li	$v0,45			# 0x2d
	bne	$v1,$v0,$L23
	lw	$v1,48($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L24
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,118			# 0x76
	beq	$v1,$v0,$L26
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,86			# 0x56
	beq	$v1,$v0,$L26
	b	$L25
$L26:
	li	$v0,1			# 0x1
	sb	$v0,24($fp)
	b	$L42
$L25:
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,104			# 0x68
	beq	$v1,$v0,$L29
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,72			# 0x48
	beq	$v1,$v0,$L29
	b	$L28
$L29:
	li	$v0,1			# 0x1
	sb	$v0,25($fp)
	b	$L42
$L28:
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,109			# 0x6d
	beq	$v1,$v0,$L32
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,77			# 0x4d
	beq	$v1,$v0,$L32
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,115			# 0x73
	beq	$v1,$v0,$L32
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,83			# 0x53
	beq	$v1,$v0,$L32
	b	$L31
$L32:
	lw	$v0,44($fp)
	sw	$v0,28($fp)
	b	$L42
$L31:
	lw	$a0,44($fp)
	la	$t9,PrintParameterError
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,26($fp)
	b	$L42
$L24:
	lw	$a0,44($fp)
	la	$a1,$LC0
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L35
	li	$v0,1			# 0x1
	sb	$v0,24($fp)
	b	$L42
$L35:
	lw	$a0,44($fp)
	la	$a1,$LC1
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L37
	li	$v0,1			# 0x1
	sb	$v0,25($fp)
	b	$L42
$L37:
	lw	$a0,44($fp)
	la	$a1,$LC2
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L40
	lw	$a0,44($fp)
	la	$a1,$LC3
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L39
$L40:
	lw	$v0,44($fp)
	sw	$v0,28($fp)
	b	$L42
$L39:
	lw	$a0,44($fp)
	la	$t9,PrintParameterError
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,26($fp)
	b	$L42
$L23:
	lb	$v0,27($fp)
	bne	$v0,$zero,$L43
	lw	$v0,44($fp)
	sw	$v0,32($fp)
	li	$v0,1			# 0x1
	sb	$v0,27($fp)
	b	$L42
$L43:
	lw	$v0,44($fp)
	sw	$v0,36($fp)
$L42:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L19
$L20:
	lb	$v0,24($fp)
	beq	$v0,$zero,$L45
	lw	$v0,72($fp)
	slt	$v0,$v0,3
	bne	$v0,$zero,$L46
	la	$t9,PrintTooManyParamError
	jal	$ra,$t9
	la	$t9,PrintHelp
	jal	$ra,$t9
	b	$L48
$L46:
	la	$t9,PrintVersion
	jal	$ra,$t9
	b	$L48
$L45:
	lb	$v0,25($fp)
	beq	$v0,$zero,$L49
	lw	$v0,72($fp)
	slt	$v0,$v0,3
	bne	$v0,$zero,$L50
	la	$t9,PrintTooManyParamError
	jal	$ra,$t9
$L50:
	la	$t9,PrintHelp
	jal	$ra,$t9
	b	$L48
$L49:
	lb	$v0,26($fp)
	beq	$v0,$zero,$L52
	la	$t9,PrintHelp
	jal	$ra,$t9
	b	$L48
$L52:
	sw	$zero,48($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L54
	la	$v0,$LC4
	sw	$v0,32($fp)
$L54:
	lw	$v0,36($fp)
	bne	$v0,$zero,$L55
	la	$v0,$LC5
	sw	$v0,36($fp)
$L55:
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	lw	$a2,28($fp)
	la	$t9,procesarOrdenamiento
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v1,48($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L56
	lw	$a0,32($fp)
	la	$t9,PrintFileError
	jal	$ra,$t9
	b	$L57
$L56:
	lw	$v1,48($fp)
	li	$v0,-2			# 0xfffffffffffffffe
	bne	$v1,$v0,$L57
	lw	$a0,36($fp)
	la	$t9,PrintFileError
	jal	$ra,$t9
$L57:
	lw	$v0,48($fp)
	sw	$v0,52($fp)
	b	$L17
$L48:
	sw	$zero,52($fp)
$L17:
	lw	$v0,52($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	main
	.size	main, .-main
	.align	2
	.globl	filesize
	.ent	filesize
filesize:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$a0,0($v0)
	move	$a1,$zero
	li	$a2,2			# 0x2
	la	$t9,fseek
	jal	$ra,$t9
	lw	$v0,48($fp)
	lw	$a0,0($v0)
	la	$t9,ftell
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,48($fp)
	lw	$a0,0($v0)
	move	$a1,$zero
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	filesize
	.size	filesize, .-filesize
	.rdata
	.align	2
$LC6:
	.ascii	"rb\000"
	.align	2
$LC7:
	.ascii	"wt\000"
	.align	2
$LC8:
	.ascii	"-m\000"
	.align	2
$LC9:
	.ascii	"-s\000"
	.align	2
$LC10:
	.ascii	"Unknown action\n\000"
	.text
	.align	2
	.globl	procesarOrdenamiento
	.ent	procesarOrdenamiento
procesarOrdenamiento:
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
	sw	$a2,80($fp)
	sw	$zero,32($fp)
	lw	$a0,72($fp)
	la	$a1,$LC4
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L61
	lw	$a0,72($fp)
	la	$a1,$LC6
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,44($fp)
	b	$L62
$L61:
	la	$v0,__sF
	sw	$v0,44($fp)
$L62:
	lw	$v0,44($fp)
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L63
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,40($fp)
	b	$L60
$L63:
	lw	$a0,76($fp)
	la	$a1,$LC5
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L64
	lw	$a0,76($fp)
	la	$a1,$LC7
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,48($fp)
	b	$L65
$L64:
	la	$v0,__sF+88
	sw	$v0,48($fp)
$L65:
	lw	$v0,48($fp)
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L66
	li	$v0,-2			# 0xfffffffffffffffe
	sw	$v0,40($fp)
	b	$L60
$L66:
	addu	$a0,$fp,24
	la	$t9,filesize
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$a0,36($fp)
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$a0,32($fp)
	li	$a1,1			# 0x1
	lw	$a2,36($fp)
	lw	$a3,24($fp)
	la	$t9,fread
	jal	$ra,$t9
	lw	$v0,80($fp)
	beq	$v0,$zero,$L68
	lw	$a0,80($fp)
	la	$a1,$LC2
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L68
	lw	$a0,80($fp)
	la	$a1,$LC8
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L67
$L68:
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,mergeSort
	jal	$ra,$t9
	sw	$v0,32($fp)
	b	$L69
$L67:
	lw	$v0,80($fp)
	beq	$v0,$zero,$L70
	lw	$a0,80($fp)
	la	$a1,$LC3
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L71
	lw	$a0,80($fp)
	la	$a1,$LC9
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L70
$L71:
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,selectionSort
	jal	$ra,$t9
	sw	$v0,32($fp)
	b	$L69
$L70:
	la	$a0,__sF+176
	la	$a1,$LC10
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
	b	$L60
$L69:
	lw	$a0,32($fp)
	lw	$a1,28($fp)
	la	$t9,fputs
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
	sw	$zero,40($fp)
$L60:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	procesarOrdenamiento
	.size	procesarOrdenamiento, .-procesarOrdenamiento
	.align	2
	.globl	mergeSort
	.ent	mergeSort
mergeSort:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	lw	$v0,64($fp)
	sw	$v0,32($fp)
	lw	$v1,68($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L74
	lw	$v0,32($fp)
	sw	$v0,44($fp)
	b	$L73
$L74:
	lw	$v1,68($fp)
	sra	$v0,$v1,31
	srl	$v0,$v0,31
	addu	$v0,$v1,$v0
	sra	$v0,$v0,1
	sw	$v0,36($fp)
	lw	$v1,68($fp)
	lw	$v0,36($fp)
	subu	$v0,$v1,$v0
	sw	$v0,40($fp)
	lw	$a0,64($fp)
	move	$a1,$zero
	lw	$a2,36($fp)
	la	$t9,substring
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	lw	$a0,64($fp)
	move	$a1,$v0
	lw	$a2,40($fp)
	la	$t9,substring
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$a0,24($fp)
	lw	$a1,36($fp)
	la	$t9,mergeSort
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$a0,28($fp)
	lw	$a1,40($fp)
	la	$t9,mergeSort
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,merge
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	sw	$v0,44($fp)
$L73:
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	mergeSort
	.size	mergeSort, .-mergeSort
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
	sw	$a1,60($fp)
	sw	$zero,24($fp)
$L76:
	lw	$v0,24($fp)
	lw	$v1,60($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L79
	b	$L77
$L79:
	lw	$v0,24($fp)
	sw	$v0,32($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
$L80:
	lw	$v0,28($fp)
	lw	$v1,60($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L83
	b	$L81
$L83:
	lw	$v1,56($fp)
	lw	$v0,28($fp)
	addu	$a0,$v1,$v0
	lw	$v1,56($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	lb	$v1,0($a0)
	lb	$v0,0($v0)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L82
	lw	$v0,28($fp)
	sw	$v0,32($fp)
$L82:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L80
$L81:
	lw	$v1,32($fp)
	lw	$v0,24($fp)
	beq	$v1,$v0,$L78
	lw	$a0,56($fp)
	lw	$a1,24($fp)
	lw	$a2,32($fp)
	la	$t9,swap
	jal	$ra,$t9
$L78:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L76
$L77:
	lw	$v0,56($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	selectionSort
	.size	selectionSort, .-selectionSort
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
	.globl	merge
	.ent	merge
merge:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	lw	$a0,64($fp)
	la	$t9,strlen
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$a0,68($fp)
	la	$t9,strlen
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	addu	$v0,$v0,1
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	sw	$zero,44($fp)
$L88:
	lw	$v0,36($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L90
	lw	$v0,40($fp)
	lw	$v1,28($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L90
	b	$L89
$L90:
	lw	$v0,36($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L91
	lw	$v0,40($fp)
	lw	$v1,28($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L91
	lw	$v1,64($fp)
	lw	$v0,36($fp)
	addu	$a0,$v1,$v0
	lw	$v1,68($fp)
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	lb	$v1,0($a0)
	lb	$v0,0($v0)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L92
	lw	$v1,32($fp)
	lw	$v0,44($fp)
	addu	$a0,$v1,$v0
	lw	$v1,64($fp)
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L94
$L92:
	lw	$v1,32($fp)
	lw	$v0,44($fp)
	addu	$a0,$v1,$v0
	lw	$v1,68($fp)
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L94
$L91:
	lw	$v0,36($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L95
	lw	$v1,32($fp)
	lw	$v0,44($fp)
	addu	$a0,$v1,$v0
	lw	$v1,64($fp)
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L94
$L95:
	lw	$v0,40($fp)
	lw	$v1,28($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L94
	lw	$v1,32($fp)
	lw	$v0,44($fp)
	addu	$a0,$v1,$v0
	lw	$v1,68($fp)
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
$L94:
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	sw	$v0,44($fp)
	b	$L88
$L89:
	lw	$v1,32($fp)
	lw	$v0,44($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	merge
	.size	merge, .-merge
	.rdata
	.align	2
$LC11:
	.ascii	"Unable to allocate memory.\n\000"
	.text
	.align	2
	.globl	substring
	.ent	substring
substring:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L99
	la	$a0,$LC11
	la	$t9,printf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L99:
	sw	$zero,28($fp)
$L100:
	lw	$v0,52($fp)
	addu	$v1,$v0,-1
	lw	$v0,28($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L103
	b	$L101
$L103:
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L100
$L101:
	sw	$zero,28($fp)
$L104:
	lw	$v0,28($fp)
	lw	$v1,56($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L107
	b	$L105
$L107:
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$v1,$v1,$v0
	lw	$v0,48($fp)
	lbu	$v0,0($v0)
	sb	$v0,0($v1)
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L104
$L105:
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	substring
	.size	substring, .-substring
	.rdata
	.align	2
$LC12:
	.ascii	"Error: too many parameters\n\n\000"
	.text
	.align	2
	.globl	PrintTooManyParamError
	.ent	PrintTooManyParamError
PrintTooManyParamError:
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
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	PrintTooManyParamError
	.size	PrintTooManyParamError, .-PrintTooManyParamError
	.rdata
	.align	2
$LC13:
	.ascii	"Error: unknown parameter '%s' \n\n\000"
	.text
	.align	2
	.globl	PrintParameterError
	.ent	PrintParameterError
PrintParameterError:
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
	la	$a0,__sF+176
	la	$a1,$LC13
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	PrintParameterError
	.size	PrintParameterError, .-PrintParameterError
	.rdata
	.align	2
$LC14:
	.ascii	"Error: Impossible to open file '%s' \n\n\000"
	.text
	.align	2
	.globl	PrintFileError
	.ent	PrintFileError
PrintFileError:
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
	la	$a0,__sF+176
	la	$a1,$LC14
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	PrintFileError
	.size	PrintFileError, .-PrintFileError
	.rdata
	.align	2
$LC15:
	.ascii	"-- TP0 --\n\000"
	.align	2
$LC16:
	.ascii	"Organizaci\303\263n de Computadoras - 66.20\n\000"
	.align	2
$LC17:
	.ascii	"Version 1.0\n\000"
	.text
	.align	2
	.globl	PrintVersion
	.ent	PrintVersion
PrintVersion:
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
	la	$a0,$LC15
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC17
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	PrintVersion
	.size	PrintVersion, .-PrintVersion
	.rdata
	.align	2
$LC18:
	.ascii	"Usage:\n\000"
	.align	2
$LC19:
	.ascii	" tp0 [OPTIONS][file...]\n\000"
	.align	2
$LC20:
	.ascii	"Options:\n\000"
	.align	2
$LC21:
	.ascii	" -h, --help \t Display this help and exit.\n\000"
	.align	2
$LC22:
	.ascii	" -V, --version \t Display version information and exit.\n"
	.ascii	"\000"
	.align	2
$LC23:
	.ascii	" -m, --merge \t Use the mergesort algorithm.\n\000"
	.align	2
$LC24:
	.ascii	" -s, --sel \t Use the selectionsort algorithm.\n\000"
	.text
	.align	2
	.globl	PrintHelp
	.ent	PrintHelp
PrintHelp:
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
	la	$a0,$LC18
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC19
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC20
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC21
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC22
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC23
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC24
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	PrintHelp
	.size	PrintHelp, .-PrintHelp
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
