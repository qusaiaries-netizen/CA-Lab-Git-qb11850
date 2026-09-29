.text
.globl main
main:
li x10, 1 # g
li x11, 2 # h
li x12, 3 # i
li x13, 4 # j
#li x20, 0
jal x1, leaf
addi x11, x10, 0
li x10, 1
ecall
beq x0, x0, Exit
leaf:
addi sp, sp -12
sw x18, 0(sp)
sw x19, 4(sp)
sw x20, 8(sp)
add x18, x10, x11 #g+h
add x19, x12, x13 #i+j
sub x20, x18, x19 #
addi x10, x20, 0 # for return
lw x18, 0(sp)
lw x19, 4(sp)
lw x20, 8(sp) # saving previpus value
addi sp, sp, 12 #returning space
jalr x0, 0(x1) #return to caller
Exit: