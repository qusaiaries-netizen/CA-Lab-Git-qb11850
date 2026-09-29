li x22, 0, #i
li x23, 0, #sum
li x24, 10 #limit
li x25, 0x200 #base
Loop:
bge x22, x24, hehe
slli x10, x22, 2
add x10, x10, x25
sw x22, 0(x10)
addi x22,x22,1
beq x0, x0, Loop
# x9=a[i]
hehe: li x22, 0
Loop2:
bge x22, x24, exit
slli x10, x22, 2
add x10, x10, x25
lw x5,0(x10)
add x23, x23,x5
addi x22,x22,1
beq x0, x0, Loop2

exit: