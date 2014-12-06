# This TEST code is modifed from the code of Brian Bousquet-Smith
#	Function: 	Determine if the number is a prime
#	Output:		$v0 = 1 if prime; Otherwise, $so = 0.
.data
	num: .word 313		# An integer number to be checked

	.text
isPrime:
	la $t0, num		# load address
	lw $a0, ($t0)		# load the input number
	blt $a0, 3, YES		# Less than 3 automatically prime
	nop
	ori $a1, $zero, 2
LOOP:	jal modulo
	nop
	beq $s0, $zero, NO	# If modulo is 0, then not prime
	nop
	addi $a1, $a1, 1	# Add one to divider
	bgt $a0, $a1, LOOP	
	nop
	
YES:	ori $s0, $zero, 1	# a Prime Number
	j EXIT		
	nop
	
NO:	ori $s0, $zero, 0	# NOT a Prime Number

EXIT:	j EXIT			# Dead Loop
	nop

# Modulo Subroutine

# C Code representing the following
#	while(x>=y){
#		x = x-y;
#	}
#	return x		

modulo:	
	or $t2, $a0, $zero	# load x
	or $t1, $a1, $zero	# load y
loop2: 
	sub $t2, $t2, $t1	# Subtract test number
	bge $t2, $t1, loop2	# if x > y, loop
	nop
	or $s0, $t2, $zero	# save the modulo into $s0
	jr $ra			# Return
	nop

