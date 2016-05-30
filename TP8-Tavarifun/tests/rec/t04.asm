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
	li $v0, 5040
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
	li $v0, 1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 0($gp)
	li $v0, 2
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($gp)
	li $v0, 7
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal fact
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($gp)
	lw $v0, 8($gp)
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
fact:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	lw $v0, 4($gp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	slt $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	beqz $v0, __label__00001
	li $v0, 1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	b __label__00002
__label__00001:
	lw $v0, 0($gp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sub $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal fact
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	mul $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
__label__00002:
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $fp, 0($sp)
	add $sp, $sp, 4
	lw $ra, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jr $ra
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
