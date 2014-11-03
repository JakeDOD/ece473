add $2, $2, $1	# $2 = $3
sub $2, $1, $2	# $2 = -2 = 0xFFFF FFFE
addu $2, $2, $1	# $2 = -1 = 0xFFFF FFFF
subu $2, $2, $1	# $2 = -2 = 0xFFFF FFFE
and $2, $2, $1	# $2 = 0
or $2, $1, $2 	# $2 = 1
nor $2, $2, $1	# $2 = 0xFFFF FFFE
slt $2, $2, $1	# $2 = 1
slt $2, $1, $2	# $2 = 0
sll $2, $2, 1	# $2 = 0
srl $2, $2, 1	# $2 = 0
sra $2, $1, 3	# $2 = 0
jr $2		# pc = 2
nop
nop
nop
nop
nop
