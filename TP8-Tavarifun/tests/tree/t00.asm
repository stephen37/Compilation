.text
#Initialisation
	sub $sp, $sp, 8
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
	li $v0, 15234
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
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 16
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	li $v0, 3
	sw $v0, 0($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 7
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
	add $v0, $v0, 16
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	li $v0, 3
	sw $v0, 0($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	li $v0, 9
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 8
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $a1, 0($sp)
	li $a2, 1
	sw $a2, 0($a1)
	sw $a0, 4($a1)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 0($gp)
	li $v0, 5
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	li $v0, 2
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	li $v0, 3
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	li $v0, 128
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_leaf
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	li $v0, 987
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_leaf
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	li $v0, 87
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_node_right
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 8
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	li $v0, 3476
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_node
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 12
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($gp)
	li $v0, 4
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
mk_node_right:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 8
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $a1, 0($sp)
	li $a2, 1
	sw $a2, 0($a1)
	sw $a0, 4($a1)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_node_aux
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 12
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $fp, 0($sp)
	add $sp, $sp, 4
	lw $ra, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jr $ra
mk_node_left:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 8
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $a1, 0($sp)
	li $a2, 1
	sw $a2, 0($a1)
	sw $a0, 4($a1)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_node_aux
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 12
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $fp, 0($sp)
	add $sp, $sp, 4
	lw $ra, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jr $ra
mk_node:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	lw $v0, 20($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 8
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $a1, 0($sp)
	li $a2, 1
	sw $a2, 0($a1)
	sw $a0, 4($a1)
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 8
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $a1, 0($sp)
	li $a2, 1
	sw $a2, 0($a1)
	sw $a0, 4($a1)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_node_aux
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 12
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $fp, 0($sp)
	add $sp, $sp, 4
	lw $ra, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jr $ra
mk_leaf:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_node_aux
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 12
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $fp, 0($sp)
	add $sp, $sp, 4
	lw $ra, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jr $ra
mk_node_aux:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	la $s0, nxt_loc
	lw $v0, 0($s0)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	add $v0, $v0, 16
	la $v1, max_loc
	lw $v1, 0($v1)
	bgt $v0, $v1, out_of_memory
	sw $v0, 0($s0)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	li $v0, 3
	sw $v0, 0($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
	lw $v0, 20($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $v1, 0($sp)
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
