.text
.globl place

# 	a0 board address
# 	a1 board length
#	a2 field number to place into
#	a3 number to place
#
#	a0 == 0 iff place succesfull else 1
#

place:
	lhu t0 0(a0) #getting the value in the address a0 which is the base address and putting it tin t0
    li t1 2 #loading 2 to t1
    mul a2 a2 t1 #multiplying the index given by 2
    blt a1 a2 unsuccessful #unsuccessful if the index given is out of range
    add t0 t0 a2 #jumping to the cell given in a2 and putting it to t0
    bne t0 zero unsuccessful #checking if it is free or not, if not then go to unsuccessful
    mv t0 a3 #moving the value to be placed into t0
    sh t0 0(a0) #saving the value
    j successful #done


successful:
    li a0 0
    jr ra
 
unsuccessful:
    li a0 1
    jr ra