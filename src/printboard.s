.data
.globl printboard
#
#a0 Address of the first field of the board
#
#	-----------------------------
#	|      |      |      |      |
#	| 2048 |  128 |    8 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	| 1024 |   64 |    4 |    8 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  512 |   32 |  512 |  128 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  256 |   16 | 2048 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#
.text

printboard:
    mv t0 a0
    la a1 line
    li a0 4
    ecall
    li t1 0
rowstart:
    li t2 0
    li a1 '|'
    li a0 11
    ecall

topempty:
    li t3 6
spaces1:
    li a1 ' '
    li a0 11
    ecall
    addi t3 t3 -1
    bnez t3 spaces1
    li a1 '|'
    li a0 11
    ecall
    addi t2 t2 1
    li t4 4
    blt t2 t4 topempty
    li a1 10
    li a0 11
    ecall
    li t2 0
    li a1 '|'
    li a0 11
    ecall

numstart:
    slli t5 t1 3    
    slli t6 t2 1    
    add t5 t5 t6
    add t5 t5 t0
    lhu t6 0(t5)
    li t5 0
    li t3 10
    blt t6 t3, printspaces
    li t5 1
    li t3 100
    blt t6 t3, printspaces
    li t5 2
    li t3 1000
    blt t6 t3 printspaces
    li t5 3
    li t3 10000

printspaces:
    li t3 4
    sub t3 t3 t5
padding:
    blez t3 prntnum
    li a1 ' '          
    li a0 11
    ecall
    addi t3 t3 -1
    j padding

prntnum:
    mv a1 t6
    li a0 1
    ecall
    li a1 ' '
    li a0 11 
    ecall
    li a1 '|'
    li a0 11
    ecall
    addi t2 t2 1
    li t3 4
    blt t2 t3 numstart
    li a1 10
    li a0 11
    ecall
    li t2 0
    li a1 '|'
    li a0 11
    ecall

botempty:
    li t3 6
spaces2:
    li a1 ' '
    li a0 11
    ecall
    addi t3 t3 -1
    bnez t3 spaces2
    li a1 '|'
    li a0 11
    ecall
    addi t2 t2 1
    li t4 4
    blt t2 t4 botempty
    li a1 10
    li a0 11
    ecall
    la a1 line
    li a0 4
    ecall
    addi t1 t1 1
    li t4 4
    blt t1 t4 rowstart
    ret

.data
line:
    .asciiz "-----------------------------\n"

