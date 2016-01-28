.text

main : 
	li $t0, 4
	move $gp, $sp 
	sub $sp, $sp, 8
	li $t1, 2
	sw $t1, 0($gp)
	mul $t2, $t1, $t1
	sw $t2, -4($gp)
	lw $t3, -4($gp)
	lw $t4, 0($gp)
	# On stocke le résultat dans a0
	add $a0,$t4,$t3	
	jal print_int
	# Quand v0 est à 10, le programme s'arrête
	li $v0, 10
	syscall
	
print_int :
	# On met v0 à 1 pour lui dire qu'il y a un print
	li $v0, 1
	syscall 
	jr $ra