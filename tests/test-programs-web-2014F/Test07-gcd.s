# This test program is modifed from the code of Brian Bousquet-Smith

#	Function: Calculates the greatest common divisors (GCD) of the values 
#	Inputs:	Two number to determine the GCD
#	Output:	GCD of the two inputs ($s0)
 

.data
	num1: .word 42		# Number A
	num2: .word 56		# Number B
#	$a0 = Input 1
# 	$a1 = Input 2
# 	$v0 = GCD(A,B)															
.text							
gcd:	la $t1, num1,		# load number A
	lw $a0, ($t1)	
	la $t1, num2,		# load number B
	lw $a1, ($t1)
				
	beq $a0, $zero, ENDA	# If A is zero, Output B as GCD
	nop
	
LOOP:	beq $a1, $zero, ENDB	# If B is zero, Output A as GCD
	nop
	blt $a1, $a0, IF1	# If A > B then A = A - B Else B = B - A
	nop
	sub $a1, $a1, $a0	# B = B - A
	j LOOP
	nop
IF1:	sub $a0, $a0, $a1	# A = A - B
	j LOOP	
	nop
	
ENDB:	la $s0, ($a0)		# Output A as GCD
	j EXIT			
	nop
	
ENDA:	la $s0, ($a1)		# Output B as GCD 
	j EXIT		
	nop
	
	
EXIT:	j EXIT			# Dead loop
	nop	
