.data 

x:  .word 4,3,6,-1,7

.text 
li $t1,5						# size = 5
li $t0,0 						# i = 0
la $s1,x
lw $t2,0($s1)				#minimum Assumtion
lw $t3,0($s1)				#maximum Assumtion


Loop:
	beq $t0,$t1,finish
	sll $a1,$t0,2				# i * 4
	add $a1,$a1,$s1
	lw $s2,0($a1)			#$s2 = x[0]	
	
	#----------------------------------------------------Getting Maximum
	
	bgt $s2,$t3,L
	
	j ium
	L:
	move $t3,$s2
	ium:
	#---------------------------------------------------Getting Minimum
	
	blt $s2,$t2,lab
	
	j jump
	lab:
	move $t2,$s2
	jump:
	addi $t0,$t0,1 
j Loop

finish:
