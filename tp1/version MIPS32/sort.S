#include <mips/regdef.h>

.globl	mergeSort
.ent	mergeSort

mergeSort:
	.frame		$fp,56,ra		# Definicion de stack frame
	subu		sp,sp,56		# Creo el stack frame
	.cprestore 40
	sw		ra,48(sp)		# Guardo ra
	sw		$fp,44(sp)		# Guardo fp
	sw		gp,40(sp)		# Guardo gp
	move		$fp,sp			# fp=sp

# Guardo los argumentos que le pasan a la funcion
	sw		a0,56($fp)		# Guardo el argumento 0 (*list)
	sw		a1,60($fp)		# Guardo el argumento 1 (length)

# Inicializo las variables locales
	lw		t0,60($fp)		# Traigo el valor de length
	srl 		t1,t0,1			# Divido (division entera) por 2 el valor de length
	sw		t1,28($fp)		# f=length/2
	sw		zero,32($fp)		# *tmp=NULL

# Si el array tiene logitud 1, no ordenamos
	lw		t0,60($fp)		# Traigo el valor de length
	subu		t0,t0,1
	beqz		t0,retorno_OK		# Si length=1, salimos de la funcion con codigo OK

#Llamadas recursivas a mergeSort
	lw		a0,56($fp)		# a0=list
	lw		a1,28($fp)		# a1=f
	jal		mergeSort		# Llamada recursiva a mergeSort(list,f), primera mitad del array original

	lw		t0,56($fp)		# t0=list
	lw		t1,60($fp)		# t1=length
	lw		t2,28($fp)		# t2=f
	addu		a0,t0,t2		# a0=list+f
	subu		a1,t1,t2		# a1=length-f
	jal		mergeSort		# Llamada recursiva a mergeSort(list+f,length-f), segunda mitad del array original

# Reservo memoria para *temp
	lw		a0,60($fp)		# a0=length*sizeof(char)
	addiu		a0,1			# SI NO RESERVO UN BYTE DE MAS SE CUELGA, HAY ALGO MAL EN ALGUN LADO
	jal		mymalloc		# Llamada a mymalloc(length*sizeof(char))
	beqz		v0,retorno_MEM		# Si mymalloc devuelve NULL, termino con error
	move		t0,v0			# t0=*tmp

# Hacemos la union de ambas partes
	li		t1,0			# t1=0
	sw		t1,16($fp)		# t1=i=0
	lw		t2,28($fp)		# t2=f
	lw		t3,28($fp)		# t3=f
	sw		t3,20($fp)		# t3=j=f
	li		t4,0			# t4=0
	sw		t4,24($fp)		# t4=k=0
	lw		t8,56($fp)		# Cargo el puntero a list en t8
	lw		t9,60($fp)		# Cargo en t9 el valor de length

for_merge:
	addu		t5,t8,t1		# Calculo la posición del elemento list[i]	
	lb		t5,0(t5)		# Cargo en t5 el valor del elemento list[i]
	addu		t6,t8,t3		# Calculo la posición del elemento list[j]
	lb		t6,0(t6)		# Cargo en t5 el valor del elemento list[j]

	sltu		t7,t5,t6		# Comparo list[i]<list[j]
	beqz		t7,for_merge_else	# Si no se cumple salto al ELSE
	
	addu		t6,t0,t4		# Calculo la posición del elemento tmp[k]
	sb		t5,0(t6)		# tmp[k]=list[i]

	addiu		t1,1			# t1=i++
	sw		t1,16($fp)		# Actualizo el valor de i
	b		for_merge_cond		# Salteo el ELSE

for_merge_else:
	addu		t5,t0,t4		# Calculo la posición del elemento tmp[k]
	sb		t6,0(t5)		# tmp[k]=list[i]

	addiu		t3,1			# t3=j++
	sw		t3,20($fp)		# Actualizo el valor de j

for_merge_cond:
	addiu		t4,1			# t4=k++
	sw		t4,24($fp)		# Actualizo el valor de k

	sltu		t5,t1,t2		# Comparo i<f
	beqz		t5,while_i_f		# Si no se cumple salgo del FOR
	sltu		t5,t3,t9		# Comparo j<length
	beqz		t5,while_i_f		# Si no se cumple salgo del FOR
	b		for_merge		# Si paso por las dos condiciones sigo iterando

# Hacemos merge del resto
while_i_f:
	addu		t5,t0,t4		# Calculo la posición del elemento tmp[k]	
	addu		t6,t8,t1		# Calculo la posición del elemento list[i]
	lb		t7,0(t6)		# Cargo el valor de list[i] en t7		
	sb		t7,0(t5)		# tmp[k]=list[i]

	addiu		t1,1			# t1++
	sw		t1,16($fp)		# i++
	addiu		t4,1			# t4++
	sw		t4,24($fp)		# k++
	sltu		t5,t1,t2		# Guardo en t5 el resultado de la comparacion (i<f)
	bnez		t5,while_i_f		# Si se cumple (i<f)

while_j_l:
	addu		t5,t0,t4		# Calculo la posición del elemento tmp[k]	
	addu		t6,t8,t3		# Calculo la posición del elemento list[j]
	lb		t7,0(t6)		# Cargo el valor de list[j] en t7		
	sb		t7,0(t5)		# tmp[k]=list[j]

	addiu		t3,1			# t3++
	sw		t3,20($fp)		# j++
	addiu		t4,1			# t4++
	sw		t4,24($fp)		# k++
	sltu		t5,t3,t9		# Guardo en t5 el resultado de la comparacion (j<length)
	bnez		t5,while_j_l		# Si se cumple (j<length)

# Copiamos el vector temporal como resultado
	li		t1,0			# t1=0
	sw		t1,16($fp)		# t1=i=0
	lw		t2,60($fp)		# Cargo en t2 el valor de length
	lw		t3,56($fp)		# Cargo el puntero a list en t3
for_final:
	addu		t5,t0,t1		# Calculo la posición del elemento tmp[i]	
	addu		t6,t3,t1		# Calculo la posición del elemento list[i]
	lb		t7,0(t5)		# Cargo el valor de tmp[i] en t7		
	sb		t7,0(t6)		# list[i]=tmp[i]

	addiu		t1,1			# t1++
	sw		t1,16($fp)		# i++
	sltu		t4,t1,t2		# Guardo en t3 el resultado de la comparacion (i<length)
	bnez		t4,for_final		# Si se cumple (i<length)

# Liberamos la memoria reservada para el array temporal
	move		a0,t0			# a0=*tmp
	jal		myfree			# Llamada a myfree, para liberar *tmp
	j		retorno_OK		# Salto a la finalizacion de la funcion

# Guardo en v0 el codigo de retorno de la funcion ERROR_RESERVA_MEMORIA
retorno_MEM:
	li		v0,3			# v0=ERROR_RESERVA_MEMORIA
	j		fin_mergeSort		# Salto al fin de la funcion

# Guardo en v0 el codigo de retorno de la funcion EXIT_SUCCESS
retorno_OK:
	li		v0,0			# v0=0

# Fin de la funcion
fin_mergeSort:
	move		sp,$fp			# sp=fp
	lw		ra,48(sp)		# Restauro ra
	lw		$fp,44(sp)		# Restauro fp
	lw		gp,40(sp)		# Restauro gp
	addu		sp,sp,56		# Elimino el stack frame
	j		ra			# Retorno a funcion llamadora

.end	mergeSort

