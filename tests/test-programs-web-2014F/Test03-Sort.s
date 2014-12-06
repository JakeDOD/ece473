#  This program sorts number in an ascending order: from the lowest to the highest
#  $a0 :  Address of the original array
#  $a1 :  Size of the array
#  $t0 :  Address of sorted array
#  bub_sort: Implement bubble sort

.data	# Data Section
iArray:	.word 1 9 2 8 5 6 7 
iSize:  .word 7

		.text			# Code Section
main:
		addu $s0, $0, $ra	# save return address
		la $a0, iArray		# load base address to $a0
		
		la $t0, iSize		
		lw $a1, 0($t0)		# load size to $a1

		# $a0 and $a1 are parameters passed to procedure
		jal bub_sort		# Sorted array starts at $t0
		nop 		        # Branch Delay slot
		
		# Read the Sorted Array
		addu $t0, $a0, $0	# move $a0 to $t0, Array Base Addr.
		addu $t1, $a1, $0	# move $a1 to $t4, Array SIZE		
loop1:
		lw $t2, 0($t0)		# $t2=A[i]
            	addi $t1, $t1, -1	# Size decremented by 1
             	addi $t0, $t0, 4	# update current address of A[i]
             	bne $t1, 0, loop1	# If not done, goto loop1
		nop			# Branch delay slot
exit:		j exit			# dead loop; program stops here		
		nop	
			
bub_sort:
		# $s0 and $s1 are forbidden to use.
		addu $t4, $a1, $0	# move $a1 to $t4
loop3:					# outer loop
		addu $t1, $t4, $0	# Inner loop size	
		addu $t0, $a0, $0	# move $a0 to $t0
loop4:					
		lw $t2, 0($t0)		# $t2=A[i]
		lw $t3, 4($t0)		# $t3=A[i+1]
		ble $t2, $t3, skip1	# test for swapping memory elements	
		nop			# Branch delay slot
		sw $t2, 4($t0)
		sw $t3, 0($t0)		# Completes Swap
skip1:
		addi $t0, $t0, 4	# update current address of A[i]
		lw $t2, 0($t0)		# update A[i]
		addi $t1, $t1, -1	# Size decremented by 1
		bne $t1, 1, loop4	# If not done, goto loop4
		nop			# Branch delay slot
		addi $t4, $t4, -1	# outer loop size decreases
		bne $t4, 1, loop3	# test, if not goto loop3
		nop			# Branch delay slot

		addu $t0, $a0, $0	# Load base address
		addu $t1, $a1, $0	# load size of array
		sll  $t1, $t1, 2	# size*4
		add $t1, $t0, $t1	# End address of the array
		lw $v0, -4($t1)		# Load Maximum to $v0
		
					# Epilogue
		jr $ra			# Return to the caller
		nop
