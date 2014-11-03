add $2, $2, $1	# $2 = $3
sub $2, $1, $2	# $2 = -2 = 0xFFFF FFFE
addu $2, $2, $1	# $2 = -1 = 0xFFFF FFFF
subu $2, $2, $1	# 
and $2, $2, $1
or $2, $1, $2 
nor $2, $2, $1
slt $2, $2, $1
slt $2, $1, $2
sll $2, $2, 1
srl $2, $2, 1
sra $2, $1, 3
jr $2
nop
nop
nop
nop
nop