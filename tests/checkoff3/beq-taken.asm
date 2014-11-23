ori $1, $0, 1
    ori $2, $0, 1
    beq $1, $2, L
    nop
    ori $4, $0, 0xffff
L:  ori $3, $0, 1
