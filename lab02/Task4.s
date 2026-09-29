.text
.globl main
main:
addi x5, x0, 3 # a = 3
addi x6, x0, 2 # b = 2
addi x29, x0, 0 # j = 0 (will be overwritten by loop anyway)
addi x10, x0,1000 # base address of D = 0x1000 (arbitrary exampleaddress)
add x7, x0, x0 # i = 0
LOOP1: bge x7, x5, EXIT1 # if (i >= a) exit outer loop
add x29, x0, x0
# j = 0
LOOP2: bge x29, x6, EXIT2 # if (j >= b) exit inner loop
slli x28, x29, 4 # x28 = j * 16 (byte offset for D[4*j],word array)
add x28, x28, x10 # x28 = &D[4*j]
add x31, x7, x29 # x31 = i + j
sw x31, 0(x28) # D[4*j] = i + j
addi x29, x29, 1 # j++
jal x0, LOOP2 # repeat inner loop
EXIT2: addi x7, x7, 1 # i++
jal x0, LOOP1 # repeat outer loop
EXIT1: