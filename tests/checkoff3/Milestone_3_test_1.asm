# Milestone 3 - test 1: arithmetic without RAW
ori  $1,  $0, 0xFF
ori  $2,  $0, 0x3F        
andi $2, $1, 0x14
ori $2, $1,  0x14
slti $2, $1, 0x14
slti $2, $1, 0xFFF
addi $2, $1, 0x14
addiu $2, $1, 0x14
lui $1, 0xEE
nop
nop
nop
nop
nop