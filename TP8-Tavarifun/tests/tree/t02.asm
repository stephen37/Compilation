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
	li $v0, 12
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	li $v0, 456789
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
	li $v0, 5
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
	li $v0, 8
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
	li $v0, 6
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
	li $v0, 4
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
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 0($gp)
	li $v0, 1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	lw $v0, 0($gp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_bst
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 4($gp)
	li $v0, 2
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	lw $zero, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($gp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal infix
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $zero, 0($sp)
	add $sp, $sp, 4
#Fin
end_exec:
	li $v0, 10
	syscall
#Fonctions
infix:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sne $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	beqz $v0, __label__00011
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal infix
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	b __label__00012
__label__00011:
	sub $sp, $sp, 4
	sw $zero, 0($sp)
__label__00012:
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal print_int
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	sne $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	beqz $v0, __label__00013
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, -8($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal infix
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	b __label__00014
__label__00013:
	sub $sp, $sp, 4
	sw $zero, 0($sp)
__label__00014:
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
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
mk_bst:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_leaf
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	seq $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	beqz $v0, __label__00009
	lw $v0, 0($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	b __label__00010
__label__00009:
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, -4($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal add_list_to_bst
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 8
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
__label__00010:
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
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
add_list_to_bst:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal bs_insert
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 8
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	seq $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	beqz $v0, __label__00007
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	b __label__00008
__label__00007:
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, -4($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal add_list_to_bst
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 8
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
__label__00008:
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
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
bs_insert:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sub $sp, $sp, 4
	sw $fp, 0($sp)
	sub $fp, $sp, 4
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
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
	beqz $v0, __label__00005
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	seq $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	beqz $v0, __label__00001
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_leaf
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
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
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	b __label__00002
__label__00001:
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 8($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal bs_insert
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 8
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
__label__00002:
	b __label__00006
__label__00005:
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $v1, 0($sp)
	add $sp, $sp, 4
	seq $v0, $v0, $v1
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	beqz $v0, __label__00003
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal mk_leaf
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 4
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
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 0($sp)
	add $sp, $sp, 4
	sw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	b __label__00004
__label__00003:
	lw $v0, 16($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 12($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v1, 0($sp)
	add $sp, $sp, 4
	lw $v0, 4($v1)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 12($fp)
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	jal bs_insert
	lw $v0, 0($sp)
	add $sp, $sp, 4
	add $sp, $sp, 8
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	lw $v0, 0($sp)
	add $sp, $sp, 4
	lw $zero, 0($sp)
	add $sp, $sp, 4
	sub $sp, $sp, 4
	sw $v0, 0($sp)
__label__00004:
__label__00006:
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
