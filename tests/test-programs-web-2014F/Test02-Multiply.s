# $t1 :  multiplicand
# $t2 :  multiplier
# $s0 :  product
# $v1 :  cycle counter
# $t4 :  temporary storage
# $t5 :  loop counter (counts to 16)

# NOTE:  there is no nop after the branch instruction, 
#        which means this program uses the branch delay slot to improve 
#        performance. Thus the instruction in the branch delay slot
#   	 will always be execuated no matter the branch is taken or not.

.text
.globl main
main:
	la  $t0, para		# load address of A in $t0		
	lw  $t1, 0($t0)		# multiplicand ->$t1
	lw  $t2, 4($t0)		# multiplier->$t2
	add $s0, $0, $0		# Initialize the product to 0
	add $t5, $0, $0		# initialize loop counter
	add $v1, $0, 4		# initialize cycle counter, not contribute to multiply
Loop:	
	and $t4, $t2, 1		# And operation, the least significant bit to $t4
	beq $t4, 0, skip_add	# check least significant bit
	addi $v1, $v1, 1        # Branch Delay Slot
	add $s0, $s0, $t1	# add multiplicand
skip_add:
	srl $t2, $t2, 1		# shift multiplier right one bit
	sll $t1, $t1, 1		# shift multiplicand left one bit
	addi $t5, $t5, 1	# loop counter increment by 1
	addi $v1, $v1, 8		
	bne $t5, 16, Loop	# goto Loop
	addi $v1, $v1, 2        # Branch Delay Slot
	
exit:	j exit			# dead loop; program stops here
	nop 

# Data segment
##############
 	.data
para:	.word 51, 44
