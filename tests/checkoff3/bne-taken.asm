ori $1, $0, 2
    ori $2, $0, 1
    bne $1, $2, L
    nop
    ori $4, $0, 0xffff
L:  ori $3, $0, 1