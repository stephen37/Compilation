.text
#Initialisation
	sub $sp, $sp, 12
	move $gp, $sp
	sub $fp, $sp, 4
	li $a0, 1024
	li $v0, 9
	syscall
	la $a0, nxt_loc
	sw $v0, 0($a0)
	add $v0, $v0, 1024
	la $a0, max_loc
	sw $v0, 0($a0)
#Code principal
main:
	li $v0, 479
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	jal print_newline
	lw $zero, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 12
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	li $v0, 2
	sw $v0, 0($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 3
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 0($gp)
	li $v0, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 12
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	li $v0, 2
	sw $v0, 0($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 2
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 0($gp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($gp)
	li $v0, 7
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 12
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	li $v0, 2
	sw $v0, 0($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 0
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 12
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	li $v0, 2
	sw $v0, 0($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 2
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($gp)
	li $v0, 9
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
#Fin
end_exec:
	li $v0, 10
	syscall
#Fonctions
#Primitives
print_int:
	lw $a0, 0($sp)
	add $sp, $sp, 4
	li $v0, 1
	syscall
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	jr $ra
print_newline:
	lw $zero, 0($sp)
	add $sp, $sp, 4
	li $v0, 11
	li $a0, 10
	syscall
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	jr $ra
out_of_memory:
	la $a0, __const_out_of_memory
	li $v0, 4
	syscall
	b end_exec
.data
#Constantes
__const_out_of_memory:
	.asciiz "out of memory"
#Variables globales pour la gestion du tas
nxt_loc:
	.word 0
max_loc:
	.word 0
