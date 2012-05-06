#include <mips/regdef.h>
#include <sys/syscall.h>

#ifndef 	fp
#define	fp	$fp
#endif

#define SSIZE			(32)

#define	O_RA			(24)
#define	O_FP			(20)
#define	O_GP			(16)

#define 	O_ARG0		(SSIZE)
#define 	O_ARG1		((SSIZE) + 4)
#define 	O_ARG2		((SSIZE) + 8)
#define 	O_ARG3		((SSIZE)	+ 12)

	/* ssize_t	my_read(int,void*,size_t)	*/
	.text
	.align 	2
	.globl	my_read
	.ent		my_read

my_read:
   	.frame fp,32, ra
   	.set  noreorder
   	.cpload  t9  
   	.set  reorder     
	
		subu	sp,sp,SSIZE

		sw		gp,O_GP(sp)
		sw		fp,O_FP(sp)
		sw		ra,O_RA(sp) 
		
		move	fp,sp

		sw		a0,O_ARG0(fp)
		sw		a1,O_ARG1(fp)
		sw		a2,O_ARG2(fp)
		


		li		v0,SYS_read

		lw		a0,O_ARG0(fp)
		lw		a1,O_ARG1(fp)
		lw		a2,O_ARG2(fp)

		syscall

		bne	a3,zero,read_error

		b		read_unwind

read_error:
		li		v0,-1

read_unwind:
		lw		gp,O_GP(sp)
		lw		fp,O_FP(sp)
		lw		ra,O_RA(sp)
		addu	sp,sp,SSIZE
		
		jr		ra

		.end		my_read

		/* ssize_t	my_write(int,const void*,size_t)	*/
		.text
		.align 	2
		.globl	my_write
		.ent		my_write

my_write:
   	.frame fp,32, ra
   	.set  noreorder
   	.cpload  t9  
   	.set  reorder     

		subu	sp,sp,SSIZE

		sw		gp,O_GP(sp)
		sw		fp,O_FP(sp)
		sw		ra,O_RA(sp) 
		
		move	fp,sp

		sw		a0,O_ARG0(fp)
		sw		a1,O_ARG1(fp)
		sw		a2,O_ARG2(fp)

		li		v0,SYS_write

		lw		a0,O_ARG0(fp)
		lw		a1,O_ARG1(fp)
		lw		a2,O_ARG2(fp)

		syscall

		bne	a3,zero,write_error

		b		write_unwind

write_error:
		li		v0,-1

write_unwind:
		lw		gp,O_GP(sp)
		lw		fp,O_FP(sp)
		lw		ra,O_RA(sp)
		addu	sp,sp,SSIZE
		
		jr		ra
		.end		my_write
