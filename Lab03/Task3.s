.text
.globl main
main:
    addi x2, x2, -20       # make room on the stack for 5 longs (5 x 4 bytes)

    li   x5, 10            # v[0] = 10
    sw   x5, 0(x2)
    li   x5, 20            # v[1] = 20
    sw   x5, 4(x2)
    li   x5, 30            # v[2] = 30
    sw   x5, 8(x2)
    li   x5, 40            # v[3] = 40
    sw   x5, 12(x2)
    li   x5, 50            # v[4] = 50
    sw   x5, 16(x2)

    mv   x10, x2           # x10 = v (address of the array)
    li   x11, 2            # x11 = k = 2
    jal  x1, swap          # call swap(v, 2)

    addi x2, x2, 20        # free the stack space

    li   x17, 10           # ecall number 10 = exit
    ecall                  # end the program

swap:
    slli x6, x11, 2        # x6 = k * 4
    add  x6, x10, x6       # x6 = address of v[k]
    lw   x5, 0(x6)         # temp = v[k]
    lw   x7, 4(x6)         # x7 = v[k+1]
    sw   x7, 0(x6)         # v[k] = v[k+1]
    sw   x5, 4(x6)         # v[k+1] = temp
    jalr x0, 0(x1)         # return to main