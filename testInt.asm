.data
keydata: .space 32
timer: .word 0, 1, 2, 3, 4, 5

.text

_start:
lui $t0, 0xffff
li $s1, 0x02
sw $s1, 0($t0)

mfc0 $t0, $12
ori $t0, $t0, 0x0001
mtc0 $t0, $12

jal main
main:

#load word?Print Word?
#lw 0xFFFF000C, keydata


again:
lui $s0, 0xFFFF
lw $s0, 8($s0)
andi $s0, $s0, 1
beq $s0, 0, again
#its ready at this point to display
la $s1, keydata
lui $s0, 0xFFFF
lw $s1, 0($s1)
sw $s1, 12($s0)
j again
#for(t1= 0...) nested loop. 



.kdata
.ktext 0x80000180


lui $k0, 0xFFFF
lw $k1, 4($k0)
la $k0, keydata
sw $k1, 0($k0)





mtc0 $0, $13
mfc0 $k0, $12
ori $k0, $k0, 1
mtc0 $k0, $12
eret 
