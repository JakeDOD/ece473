# $s0 :  Sum of the array
# $t0 :  Address of the integer array

.data						# following words in data segment
	A: .word 1 2 3 4 5 6 7 8 9 10 0 	# array of 10 words in location A
						# The last ZERO indicates the end of this integer array.

.globl main					# define global label main

.text						# text segment begins here
main: 	
		la  $t0, A			# la: load address of A in $t0.
						# la is a pseudo-instruction, which is translated into lui
		add $s0, $zero, $zero		# s0 = 0

loop:
		lw   $t2, 0($t0)		# $t2 = Mem[$t0 + 0]
		add  $s0, $s0, $t2		# $s0 = $s0 + $t2
		addi $t0, $t0, 4		# $t0 = $t0 + 4
		bne  $t2, $zero, loop		# if ($t2 != 0) goto loop
		nop				# Branch Delay Slot

exit:		j exit				# dead loop; program stops here
		nop