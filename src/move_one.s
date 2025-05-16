.text
.globl move_one

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|----|		|----|----|----|----|----|
#	|  2 |  0 |  2 |  0 |  4 |	=> 	|  2 |  2 |  0 |  4 |  0 |
#	|----|----|----|----|----|		|----|----|----|----|----|
#
#	a0 1 iff something changed else 0

move_one:
	li t6 0
	li t5 1


loop:
	beq t5 a1 check
	lw t0 0(a0)
	lhu t1 0(t0)
	beq t1 zero next
	addi a0 a0 4
	addi t5 t5 1
	j loop

next:
	addi a0 a0 4
	addi t5 t5 1
	lw t3 0(a0)
	lhu t2 0(t3)
	bne t2 zero move
	j loop

move:
	addi t6 t6 1
	add t1 t1 t2
	sh t1 0(t0)
	sw t0 0(a0)
	li t2 0
	sh t2 0(t3)
	sw t3 0(a0)
	addi t0 t3 4
	sw t0 0(a0)
	addi t5 t5 1
	j loop


check: 
	beq t6 zero not_done
	li a0 1
	jr ra

not_done:
	li a0 0
	jr ra
