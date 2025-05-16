.text
.globl move_left
.import "move_one.s"
#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  0 |  2 |  0 |  4 |	=> 	|  2 |  4 |  0 |  0 |
#	|----|----|----|----|		|----|----|----|----|
#



move_left:
    addi sp sp -12
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    mv s0 a0
    
move_loop:
    mv a0 s0
    jal ra move_one 
    mv s1 a0
    beq s1 zero move_done
    j move_loop 

move_done:
    mv a0 s0
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    addi sp sp 12
    jr ra