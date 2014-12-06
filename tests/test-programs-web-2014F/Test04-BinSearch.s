# NOTE: When check the correctness of your program, pay attention to 
#       register t5, which stores the sorted number sequentially. 	
	
	.data
first: 	# sorted array of 32 bit words
	.word 2, 3, 8, 10, 16, 21, 35, 42, 43, 50, 64, 69
	.word 70, 77, 82, 83, 84, 90, 96, 99, 100, 105, 111, 120
last: 	# address just after sorted array

	.text
	.globl main
main:
	# binary search in sorted array
	# input: search value (needle) in $a0
	# base address of array in $a1
	# last address of array in $a2
	# output: address of needle in $v0 if found,
	# 0 in $v0 otherwise

	li $a0, 42 		# needle value
	la $a1, first 		# address of first array entry
	la $a2, last		# address of last array entry
	addi $a2, $a2, -4
	jal binsearch 		# perform binary search
	nop
exit:	j exit			# dead loop; program stops here	
	nop

binsearch:
	addi $sp, $sp, -4 	# allocate 4 bytes on stack
	sw $ra, 4($sp) 		# save return address on stack
	subu $t0, $a2, $a1 	# $t0 <- size of array
	bnez $t0, search 	# if size > 0, continue search
	nop
	move $v0, $a1 	# address of only entry in array
	lw $t0, ($v0) 		# load the entry
	beq $a0, $t0, return 	# equal to needle value? yes => return
	nop
	li $v0, 0 		# no => needle not in array
	j return 		# done, return
	nop
	
search:
	srl $t0, $t0, 3 		# compute offset of middle entry m:
	sll $t0, $t0, 2 		# $t0 <- ($t0 / 8) * 4
	addu $v0, $a1, $t0 	# compute address of middle entry m
	lw $t0, ($v0) 		# $t0 <- middle entry m
	beq $a0, $t0, return 	# m = needle? yes => return
	nop
	blt $a0, $t0, go_left 	# needle less than m? yes =>
				# search continues left of m
	nop
	
go_right:
	addi $a1, $v0, 4 	# search continues right of m
	jal binsearch 		# recursive call
	nop
	j return 		# done, return
	nop
	
go_left:
	move $a2, $v0 	# search continues left of m
	jal binsearch 		# recursive call
	nop
return:
	lw $ra, 4($sp) 		# recover return address from stack
	addi $sp, $sp, 4 	# release 4 bytes on stack
	jr $ra 			# return to caller
	nop

