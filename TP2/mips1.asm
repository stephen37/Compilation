.text 

main : 
	li $v0, 1
	li $t0, 4
	addi $t0, $t0, 6
	li $s0, 21
	sll $s0, $s0, 1 #Permet de faire une multiplication par 2
	li $s1, 7
	srl $s1, $s1, 1
	add $s1, $s1, $v0 # On fait l'addition après avoir fait la division par 2
	# On veut faire une division par 5 => On doit donc faire une division par 4 et ajouter 1 
	li $s2, 3		
	li $s3, 6
	sub $s2, $s2, $s3
	li $t0, 10
	# On veut diviser par 5 
	li $t1, 5
	li $t2, 6
	li $t3, 3
	div $s4, $t0, $t1 
	mul $s4, $t2, $s4 #On stocke le résultat de notre multiplication, on trouve -9
	sub $s3, $t3,$s4
	
	
	
	
	#Partie booléenne
	#true && false
	li $t0, 1
	li $t1, 0
	and $t1, $t0,$t1

	#if 3 != 4 then 10 * 2 else 14
	li $t0, 3
	li $t1, 4
	bne $t0, $t1, condi1
	li $t2, 14
condi1 : 
	li $t3, 10
	sll $t3, $t3, 1 
	
	#2 = 3 || 4 <= 2*3
	
	li $t0, 2
	li $t1, 3
	beq $t0, $t1, condi2
	li $t2, 4
	mul $t3, $t1, $t0
	ble $t2, $t3, condi2
	li $a0, 0
	b final
condi2 :
	li $a0, 1
	b final
		
final : 
	li $t6, 10
	sw $t6, 0($sp)
	li $t7, 4 # Permet de changer de case dans la pile
	sub $sp, $sp, $t7
	li $t8, 2
	sw $t8, 0($sp) 
	sub $sp, $sp, $t7
	li $t9, 6
	sw $t9, 0($sp)
	
	lw $t4, 0($sp)
	addi $sp, $sp, 4
	lw $t5, 0($sp)
	add $t5, $t5, $t4
	sw $t5, 0($sp)
	jal print_int
	
print_int : 
	syscall 
	add $ra, $ra, 4
	
	
	# Partie traitant de la pile 
	
	