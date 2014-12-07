.data
	num1: .word 42		# Number A
	num2: .word 56		# Number B
#	$a0 = Input 1
# 	$a1 = Input 2
# 	$v0 = GCD(A,B)															
.text
la $9, num1,		# load number A
lw $4, ($9)	
la $9, num2,		# load number B
lw $5, ($9)