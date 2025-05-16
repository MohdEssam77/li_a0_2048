	.data
	.globl main

board:
	.half 0,0,0,0 # +0
	.half 0,0,0,0 # +8
	.half 0,0,0,0 # +16
	.half 0,0,2,2 # +24

buf:
	.word 0,0,0,0

	
	.text
.import "../../src/place.s"
.import "../../src/merge.s"
.import "../../src/check_victory.s"
.import "../../src/printboard.s"

.import "../test_utils.s"

main:
	la t0 board
	addi t0, t0, 24
	la t1 buf

   	sw t0 0(t1)
	addi t0 t0 2
	sw t0 4(t1)
	addi t0 t0 2
	sw t0 8(t1)
	addi t0 t0 2
	sw t0 12(t1)


    la a0 buf
    li a1 4
    jal merge
    la a0 board
    li a1 16
 	jal print_board_test
	li	a0 10
	ecall
