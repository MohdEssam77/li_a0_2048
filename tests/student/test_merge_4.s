	.data
	.globl main

board:
	.half 2,4,8,16,32,64
	.half 0,0,0,0,0,0
	.half 0,0,0,0,0,0
	.half 0,0,0,0,0,0
	.half 0,0,0,0,0,0
	.half 0,0,0,0,0,0
	

buf:
	.word 0,0,0,0,0,0

	
	.text
.import "../../src/place.s"
.import "../../src/merge.s"
.import "../../src/check_victory.s"
.import "../../src/printboard.s"

.import "../test_utils.s"

main:
	la t0 board # loads board address
	la t1 buf # loads buff address.

   	sw t0 0(t1) # stores first address bytes of the board in t0,
	addi t0 t0 2 # increase position of the board ? 
	sw t0 4(t1) #stores next  address on the board in t0
	addi t0 t0 2 # increase position on the board to get next address
	sw t0 8(t1) #  stores next address of the board in 8(t1)
	addi t0 t0 2 # increase position of the board
	sw t0 12(t1) # stores next address of the board.
	addi t0 t0 2
	sw t0 16(t1)
	addi t0 t0 2
	sw t0 20(t1)

	#How do we load other addresses/other row?

    la a0 buf # loads address of the first address 
    li a1 6	# loads number of positions into a1
    jal merge
    la a0 board
    li a1 36
 	jal print_board_test
	li	a0 10
	ecall
