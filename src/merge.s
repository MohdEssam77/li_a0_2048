.text
.globl merge

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  2 |  2 |  0 |  4 |  => 	|  4 |  0 |  0 |  4 |
#	|----|----|----|----|		|----|----|----|----|
#
#   BONUS: Return the number of merges in a0 and the
#          total base score of the merges in a1.

merge:
    li t1 1
    li t5 0 #used to calculate v (total number of merges)
    li t6 0 #counter to calculate s (score)

loop:
    beq t1 a1 done
    lw t0 0(a0)
    lhu t2 0(t0)
    bne t2 zero check_next
    addi t1 t1 1
    addi a0 a0 4
    j loop

check_next:
    addi a0 a0 4
    lw t3 0(a0)
    lhu t4 0(t3)
    beq t2 t4 merge_them
    addi t1 t1 1
    j loop

merge_them:
    addi t5 t5 1
    addi a0 a0 -4
    add t2 t2 t4
    add t6 t6 t2
    sh t2 0(t0)
    sw t0 0(a0)
    addi a0 a0 4
    li t4 0
    sh t4 0(t3)
    sw t3 0(a0)
    addi a0 a0 4
    addi t1 t1 2
    j loop

done:
    mv a0 t5
    mv a1 t6
    jr ra
