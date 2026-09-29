.text
.globl main
main:
addi x10,x0,12
addi x11,x0,12
jal x1,sum # calls function
addi x11, x10, 0
li x10,1
ecall # print
j exit
sum:
add x10, x10, x11
jalr x0, 0(x1) # returns on x1
exit: