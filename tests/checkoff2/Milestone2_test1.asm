li  $1,1
li  $2,2
li  $3,3
add $3, $2, $1	# $3 = 3
sub $3, $2, $1	# $3 = 1
addu $3, $2, $1	# $3 = 3
subu $3, $2, $1	# $3 = 1
and $3, $2, $1	# $3 = 0
or $3, $2, $1	# $3 = 3
nor $3, $2, $1	# $3 = FFFF FFFC
slt $3, $2, $1	# $3 = 0
slt $3, $1, $2	# $3 = 1
sll $3, $2, 1	# $3 = 4; 0000 0000 0000 0010 0001 1000 0100 0010
srl $3, $2, 1	# $3 = 1
sra $3, $2, 3	# $3 = 0
jr $2		# pc = 2
nop
nop
nop
nop
nop
