.data

x: .word 3,2,8,9,4,6

.text

li $t0,6		# int n = 6
la $t1,x
li $t2,0		# i = 0


jal SelectionSort


SelectionSort:
Loop:
	beq $t2,$t0,out
	
	add $a0,$0,$t1
	add $a1,$0,$t0
	add $a2,$0,$t2
	jal min
	add $t3,$0,$v0
	
	add $a0,$0,$t1
	add $a1,$0,$t3
	add $a2,$0,$t2
	jal swap
	
	
	addi $t2,$t2,1		#i++
j Loop
out:
j skip

min:
add $s0,$0,$a2		#index of mini = start
add $t8,$0,$a2		#idx = start

sll $t9,$a2,2
add $t9,$t9,$a0
lw $s1,0($t9)		#x[start]
add $s2,$0,$s1		#min = x[start]


Loop2:
	beq $s0,$t0,L
	sll $s3,$s0,2
	add $s3,$s3,$t1
	lw $s4,0($s3)		#x[index of min]
	slt $s5,$s4,$s2
	beq $s5,0,L2
	add $s2,$0,$s4
	add $t8,$0,$s0
	L2:
	
	addi $s0,$s0,1		
j Loop2
L:
add $v0,$0,$t8		#return idx
jr $ra



swap:
sll $t4,$a1,2
add $t4,$t4,$a0
lw $t5,0($t4)

add $t7,$0,$t5		#temp = x[i]

sll $s6,$a2,2
add $s6,$s6,$a0
lw $t6,0($s6)

add $t5,$0,$t6		# x[i] = x[j]
sw $t5,0($t4)

# x[j] = temp
sw $t7,0($s6)

jr $ra

skip:
