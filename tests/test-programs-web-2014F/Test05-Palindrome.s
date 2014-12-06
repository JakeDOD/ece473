# palindrome.s

# A palindrome is a string that is exactly the same when read backwards
# as when it is read forward (e.g. anna).

# In this example, we work on integer arrays. The integer array must end with zero 
# which indicates the end of this array. This ending zero is not counted used in paralindrome
# checking


	.text
main:

## Read the number
	la $a1, first 		# address of first array entry
	la $a2, last		# address of last array entry

	addi $s0, $0, 0		# reset the flag
	addi $s1, $0, 0		# reset the flag

	or $t1, $a1, $0	
	or $t2, $t1, $0	

length_loop:			# length of the string
	lw $t3, 0($t2)		# load the byte at addr B into $t3.
	beq $t3, $0, end_length_loop 		# if $t3 == 0, branch out of loop.
	nop
	addi $t2, $t2, 4	# otherwise, increment B,
	j length_loop		# and repeat the loop.
	nop

end_length_loop:
	addi $t2, $t2, -4	# subtract 2 to move back past

test_loop:
	blt $t2, $t1, is_palin	# if A >= B, it's a palindrome.
	nop
	lw $t3, 0($t1)		# load the byte at addr A into $t3,
	lw $t4, 0($t2)		# load the byte at addr B into $t4.
	bne $t3, $t4, not_palin # if $t3 != $t4, not a palindrome.	
	nop
	addi $t1, $t1, 4	# Otherwise, increment A,
	addi $t2, $t2, -4	# and, decrement B,
	j test_loop		# and repeat the loop.
	nop

is_palin:			# print the is_palin_msg, and exit.
	addi $s0, $0, 1
	j exit
	nop

not_palin:
	addi $s0, $0, -1
	j exit
	nop
exit:				# exit the program
	addi $s1, $0, 1
loop:	j loop			# dead loop; program stops here	
	nop
	
	
	.data
first: # integer array
	.word 2, 3, 8, 10, 16, 21, 35, 36, 39, 51, 1, 256, 1024, 43, 1024, 256, 1, 51, 39, 36, 35, 21, 16, 10, 8, 3, 2, 0
last:

