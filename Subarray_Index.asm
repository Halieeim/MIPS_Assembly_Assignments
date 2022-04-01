#index is stored in $t6

.data
x: .word 2,4,5,7,6,8,9
y: .word 5,7,6

.text

la $t0,x		# array x
li $t1,0		# j = 0
li $t2,7		# x.length = 7

la $t3,y		# array y
li $t4,0		# k = 0
li $t5,3		# y.length = 3



Loop:
	beq $t1,$t2,out
	
	sll $t7,$t1,2		# j *4 
	add $t7,$t7,$t0
	lw $s0,0($t7)		#x[j]
	
	sll $t8,$t4,2		# k * 4
	add $t8,$t8,$t3
	lw $s1,0($t8)		# y[k]
	
	slt $t9,$t4,$t5
	seq $s2,$s0,$s1
	and $s3,$t9,$s2
	beq $s3,0,go
	li $t6,0			# index = 0
	add $t6,$t1,$0
	addi $t4,$t4,1		# k++
	go:
	sgt $s5,$t4,$0
	and $s6,$s5,$t9
	beq $s6,0,else
	bne $s0,$s1,Break
	else:
	beq $t4,$t5,jumb
	
	
	addi $t1,$t1,1		# j++
j Loop
out:
jumb:
Break:

slt $s4,$t4,$t5			# k < y.length
beq $s4,0,L
addi $t6,$0,-1			# index = -1
L:

beq $t6,-1,L2			# if index == -1
sub $t6,$t6,$t5
addi $t6,$t6,1			# index - y.lenght + 1
L2:
