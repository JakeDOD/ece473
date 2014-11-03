# Forward from Execution test 1
add 	$1, $2, $3	# $1 = 5 = 0x5
add	$3, $1, $4	# $3 = 9 = 0x9
add 	$5, $6, $3	# $5 = 15 = 0xF
nop
nop
nop
# Forward from Execution test 2
add	$7, $8, $8	# $7 = 16 = 0x10
add	$2, $7, $4	# $2 = 20 = 0x14
add	$5, $6, $2	# $5 = 26 = 0x1A
nop
nop
nop
# Forward from Writeback test 1
add	$7, $20, $20	# $7 = 40 = 0x28
add	$5, $6, $3	# $5 = 15 = 0xF
add	$2, $7, $4	# $2 = 44 = 0x2C
add	$8, $3, $5	# $8 = 24 = 0x18
nop
nop
nop
# Forward from Writeback test 2
add	$4, $9, $8	# $4 = 33 = 0x21
add 	$5, $6, $2	# $5 = 50 = 0x32
add	$2, $4, $4	# $2 = 66 = 0x42
add	$8, $5, $5	# $8 = 100 = 0x64
nop
nop
nop

# No forward test 1
add	$10, $1, $2	# $10 = 71 = 0x47
add	$3, $4, $2	# $3 = 99 = 0x63
add	$6, $7, $11	# $6 = 51 = 0x33
nop
nop
nop
# No forward test 2
add	$2, $1, $10	# $2 = 76 = 0x4C
add	$5, $4, $3	# $5 = 132 = 0x84
add	$8, $7, $6	# $8 = 91 = 0x5B
nop
nop
nop
# No forward test 3
add	$12, $6, $2	# $12 = 127 = 0x7F
add	$13, $8, $8	# $13 = 182 = 0xB6
add	$14, $10, $10	# $14 = 142 = 0x8E




