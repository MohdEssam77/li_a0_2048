.text
.globl move_check
#
#	a0 buffer address
#	a1 buffer length
#
#   a0 == 1 iff left move possible and would change something
#            else 0
#

move_check:
	li t0 1 #loading 1 to t0
	j loop #jump to the loop

loop:
	beq a1 t0 impossible #using 
	lw t1 0(a0) #loading the address of the array to t1
	lhu t2 0(t1) #t2 now has the address of playing field
	beq t2 zero next #if t2 hold 0 then jump to next to check the next number
	addi a0 a0 4 #going to the next place in the field
	lw t3 0(a0) #having it in t3 now
	lhu t4 0(t3) #t4 holds the value
	beq t2 t4 possible #if both values are equal then it is possible to move
	sub a1 a1 t0 #decrementing a1
	j loop


next:
	addi a0 a0 4
	lw t1 0(a0)         #Here we check next block
	lhu t2 0(t1)
	bne t2 zero possible
	addi a1 a1 -1
	j loop

possible:
	li a0 1
	jr ra

impossible:
	li a0 0
	jr ra