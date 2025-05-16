.data
    .globl main
board:
    .half 2048,0,2,0
    .half 0,512,0,0
    .half 1024,0,0,16
    .half 0,0,0,32


.text

.import "../../src/place.s"
.import "../../src/buffer.s"
.import "../../src/check_victory.s"
.import "../../src/printboard.s"

.import "../test_utils.s"
main:
    la a0 board
    li a1 4
    li a2 4

    jal printboard

    li a0 10
    ecall
