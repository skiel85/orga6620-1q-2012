	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"tp0 [OPTIONS] [file...]\n"
	.ascii	"-h, --help\t display this help and exit.\n"
	.ascii	"-V, --version\t display version information and exit.\n"
	.ascii	"-m, --merge\t use mergesort algorithm.\n"
	.ascii	"-s, --sel\t use selectionsort algorithm.\n\n\000"
	.text
	.align	2
	.globl	imprimir_ayuda
	.ent	imprimir_ayuda
imprimir_ayuda:
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
	sw	$a1,44($fp)
	lw	$a0,40($fp)
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,exit
	jal	$ra,$t9
	.end	imprimir_ayuda
	.size	imprimir_ayuda, .-imprimir_ayuda
	.rdata
	.align	2
$LC1:
	.ascii	"TP0: v2.0.\n\000"
	.text
	.align	2
	.globl	imprimir_version
	.ent	imprimir_version
imprimir_version:
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
	sw	$a1,44($fp)
	lw	$a0,40($fp)
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,exit
	jal	$ra,$t9
	.end	imprimir_version
	.size	imprimir_version, .-imprimir_version
	.rdata
	.align	2
$LC2:
	.ascii	"Try `tp0 --help' for more information.\n\000"
	.text
	.align	2
	.globl	imprimir_leer_mas
	.ent	imprimir_leer_mas
imprimir_leer_mas:
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
	sw	$a1,44($fp)
	lw	$a0,40($fp)
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,exit
	jal	$ra,$t9
	.end	imprimir_leer_mas
	.size	imprimir_leer_mas, .-imprimir_leer_mas
	.rdata
	.align	2
$LC5:
	.ascii	"version\000"
	.align	2
$LC6:
	.ascii	"help\000"
	.align	2
$LC7:
	.ascii	"merge\000"
	.align	2
$LC8:
	.ascii	"sel\000"
	.data
	.align	2
$LC9:
	.word	$LC5
	.word	0
	.word	0
	.word	86
	.word	$LC6
	.word	0
	.word	0
	.word	104
	.word	$LC7
	.word	0
	.word	0
	.word	109
	.word	$LC8
	.word	0
	.word	0
	.word	115
	.word	0
	.word	0
	.word	0
	.word	0
	.globl	memcpy
	.rdata
	.align	2
$LC3:
	.ascii	"\000"
	.align	2
$LC4:
	.ascii	"Vhms\000"
	.align	2
$LC10:
	.ascii	"tp0: insufficient memory to start processing input.\n\000"
	.align	2
$LC11:
	.ascii	"tp0: insufficient memory to continue processing input.\n"
	.ascii	"\000"
	.align	2
$LC12:
	.ascii	"tp0: could not read input file `%s'.\n\000"
	.align	2
$LC13:
	.ascii	"tp0: unknown error.\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,184,$ra		# vars= 136, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,184
	.cprestore 24
	sw	$ra,176($sp)
	sw	$fp,172($sp)
	sw	$gp,168($sp)
	move	$fp,$sp
	sw	$a0,184($fp)
	sw	$a1,188($fp)
	la	$v0,$LC3
	sw	$v0,48($fp)
	li	$v0,1			# 0x1
	sw	$v0,52($fp)
	sw	$zero,56($fp)
	sw	$zero,60($fp)
	la	$v0,$LC4
	sw	$v0,64($fp)
	addu	$v0,$fp,72
	la	$v1,$LC9
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,80			# 0x50
	la	$t9,memcpy
	jal	$ra,$t9
$L21:
	addu	$v0,$fp,72
	sw	$zero,16($sp)
	lw	$a0,184($fp)
	lw	$a1,188($fp)
	lw	$a2,64($fp)
	move	$a3,$v0
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,56($fp)
	lw	$v1,56($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L23
	b	$L22
$L23:
	lw	$v0,56($fp)
	sw	$v0,156($fp)
	li	$v0,104			# 0x68
	lw	$v1,156($fp)
	beq	$v1,$v0,$L25
	lw	$v1,156($fp)
	slt	$v0,$v1,105
	beq	$v0,$zero,$L32
	li	$v0,63			# 0x3f
	lw	$v1,156($fp)
	beq	$v1,$v0,$L29
	li	$v0,86			# 0x56
	lw	$v1,156($fp)
	beq	$v1,$v0,$L26
	b	$L30
$L32:
	li	$v0,109			# 0x6d
	lw	$v1,156($fp)
	beq	$v1,$v0,$L27
	li	$v0,115			# 0x73
	lw	$v1,156($fp)
	beq	$v1,$v0,$L28
	b	$L30
$L25:
	la	$a0,__sF+88
	move	$a1,$zero
	la	$t9,imprimir_ayuda
	jal	$ra,$t9
	b	$L21
$L26:
	la	$a0,__sF+88
	move	$a1,$zero
	la	$t9,imprimir_version
	jal	$ra,$t9
	b	$L21
$L27:
	li	$v0,1			# 0x1
	sw	$v0,52($fp)
	b	$L21
$L28:
	li	$v0,2			# 0x2
	sw	$v0,52($fp)
	b	$L21
$L29:
	la	$a0,__sF+176
	li	$a1,1			# 0x1
	la	$t9,imprimir_leer_mas
	jal	$ra,$t9
	b	$L21
$L30:
	la	$t9,abort
	jal	$ra,$t9
$L22:
	li	$a0,2048			# 0x800
	li	$a1,1			# 0x1
	la	$t9,calloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L33
	sw	$zero,40($fp)
	li	$v0,2			# 0x2
	sw	$v0,60($fp)
$L33:
	lw	$v0,60($fp)
	bne	$v0,$zero,$L34
	lw	$v0,32($fp)
	sb	$zero,0($v0)
	sw	$zero,36($fp)
	li	$v0,2048			# 0x800
	sw	$v0,40($fp)
$L34:
	lw	$v0,60($fp)
	bne	$v0,$zero,$L35
	addu	$v0,$fp,48
	sw	$v0,16($sp)
	addu	$a0,$fp,32
	lw	$a1,188($fp)
	lw	$a2,184($fp)
	lw	$a3,optind
	la	$t9,procesarEntrada
	jal	$ra,$t9
	sw	$v0,60($fp)
$L35:
	lw	$v0,60($fp)
	bne	$v0,$zero,$L36
	lw	$v1,52($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L36
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,mergeSort
	jal	$ra,$t9
	sw	$v0,60($fp)
	b	$L37
$L36:
	lw	$v0,60($fp)
	bne	$v0,$zero,$L37
	lw	$v1,52($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L37
	addu	$a0,$fp,32
	la	$t9,selectionSort
	jal	$ra,$t9
	sw	$v0,60($fp)
$L37:
	lw	$v0,60($fp)
	bne	$v0,$zero,$L39
	addu	$a0,$fp,32
	la	$t9,imprimirSalida
	jal	$ra,$t9
$L39:
	lw	$v0,40($fp)
	beq	$v0,$zero,$L40
	lw	$a0,32($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
$L40:
	lw	$v0,60($fp)
	sw	$v0,160($fp)
	li	$v0,2			# 0x2
	lw	$v1,160($fp)
	beq	$v1,$v0,$L43
	lw	$v1,160($fp)
	slt	$v0,$v1,3
	beq	$v0,$zero,$L48
	lw	$v0,160($fp)
	beq	$v0,$zero,$L42
	b	$L46
$L48:
	li	$v0,3			# 0x3
	lw	$v1,160($fp)
	beq	$v1,$v0,$L44
	li	$v0,4			# 0x4
	lw	$v1,160($fp)
	beq	$v1,$v0,$L45
	b	$L46
$L42:
	sw	$zero,152($fp)
	b	$L20
$L43:
	la	$a0,__sF+176
	la	$a1,$LC10
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L41
$L44:
	la	$a0,__sF+176
	la	$a1,$LC11
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L41
$L45:
	la	$a0,__sF+176
	la	$a1,$LC12
	lw	$a2,48($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L41
$L46:
	la	$a0,__sF+176
	la	$a1,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
	la	$t9,abort
	jal	$ra,$t9
$L41:
	li	$v0,1			# 0x1
	sw	$v0,152($fp)
$L20:
	lw	$v0,152($fp)
	move	$sp,$fp
	lw	$ra,176($sp)
	lw	$fp,172($sp)
	addu	$sp,$sp,184
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
