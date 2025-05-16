.text
.globl check_victory


#
#	a0 board address
#	a1 board length
#
#	a0 == 1 iff 2048 found
#

check_victory:
    beq a1 zero not_found #checking if we already done with the full array, if yes then go to not_found
    li t0 2048 #putting 2048 to t0 to use it for checking
    lhu t1 0(a0) #getting the value in the address a0 which is the base address in the beginnig
    beq t1 t0 found #comparing value in the base address with the 2048 in t0, if yes then go to found
    addi a1 a1 -1 #decrementing
    addi a0 a0 2 #going to the next cell in the array
    j check_victory #looping

not_found:
    li a0 0
    jr ra

found:
    li a0 1
    jr ra