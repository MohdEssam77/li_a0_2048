	.data
	.globl main

message:
	.asciiz "move_check returned: "

board:
	.half 2,4,4,8
	.half 0,0,0,0
	.half 0,0,0,0
	.half 0,0,0,0

unmodified_copy:
	.half 2,4,4,8
	.half 0,0,0,0
	.half 0,0,0,0
	.half 0,0,0,0

buf:
	.word 0,0,0,0	

	
	.text
.import "../../src/place.s"
.import "../../src/move_check.s"
.import "../../src/check_victory.s"
.import "../../src/printboard.s"

.import "../test_utils.s"

main: # checks if move possible in case 2_0_0_0
	la t0 board
	la t1 buf
	
	sw t0 0(t1) # first field address
	addi t0 t0 2
	sw t0 4(t1) # second field address
	addi t0 t0 2
	sw t0 8(t1) # third field address
	addi t0 t0 2
	sw t0 12(t1)# ...
	
	la a0 buf
	li a1 4
	jal move_check
	mv t0 a0

	la a1 message
	li a0 4
	ecall
	mv a1 t0
	li a0 1
	ecall

	la a0 board
	la a1 unmodified_copy
	li a2 16
	jal assert_eq_board

	li	a0 10
	ecall
