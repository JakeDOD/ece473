#L:	lw 	$10,0($0)
	ori	$10, $0, 1
L:	add	$16, $16, $10
	addi	$8, $8, 4
	bne	$10, $1, L
#exit:	j 	exit
