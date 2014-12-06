# Program to evaluate a polynomial in the form of:
# f(x) = a[0] + a[1]*x + a[2]*x^2 + a[3]*x^3 +....+ a[n]*x^n
#
# Register usage:
# $t5: Address of array (contains polynomial coefficients)
# $t6: n (order of polynomial)
# $t7: x (variable of polynomial)
# $v0: result (f)
#

.data
	A: .word 1 2 3 4	# f = 1 + 2x + 3x^2 + 4x^3 
	n: .word 3		
	x: .word 2		# f = 49 = 0x31
	
.text
main:	
	la	$t5, A		# load address of array into $t5
	lw	$t6, n
	lw 	$t7, x
	# mul 	$t1, $t6, 4	# advance index to last element of array
	add	$a0, $t6, $zero
	addiu	$a1, $zero, 4
	jal	myMult
	nop
	add	$t1, $s0, $zero
	add 	$t5, $t5, $t1
	lw 	$v0, ($t5)	# load result with last element of array
		
loop:	
	beqz	$t1, exit
	nop
	subi	$t1, $t1, 4	# decrement index
	# mul	$v0, $v0, $t7	# multiply by x
	add	$a0, $v0, $zero
	add	$a1, $t7, $zero
	jal 	myMult
	nop
	add	$v0, $s0, $zero
	subi	$t5, $t5, 4	# decrement index
	lw	$t2, ($t5)
	add	$v0, $v0, $t2	# add to total
	b	loop
	nop
	
exit:   j exit			# dead loop
	nop
	


myMult:
	# multiplicand ->$a0
	# multiplier->$a1
        addu $fp, $sp, 0 	# $fp points to the first word of frame
        addi $sp, $sp, -8 	# $sp points to the last word of frame
       
        # store both those registers on the stack
        sw $a0, 0($fp)		# PUSH $a0
        sw $a1, -4($fp)		# PUSH $a1
        sw $ra, -8($fp)		# PUSH $ra
       
       
	add $s0, $0, $0		# Initialize the product to 0
	add $t3, $0, $0		# initialize loop counter
Loop:	
	and $t4, $a1, 1		# And operation, the least significant bit to $t4
	beq $t4, 0, skip_add	# check least significant bit
	nop
	add $s0, $s0, $a0	# add multiplicand
skip_add:
	srl $a1, $a1, 1		# shift multiplier right one bit
	sll $a0, $a0, 1		# shift multiplicand left one bit
	addi $t3, $t3, 1	# loop counter increment by 1
	bne $t3, 16, Loop	# goto Loop
	nop
	
	lw $ra, -8($fp)  	# POP $ra
	lw $a1, -4($fp)		# POP $a1
        lw $a0, 0($fp)		# POP $a0
        
	addu $sp, $fp, 0      
	jr $ra
	
