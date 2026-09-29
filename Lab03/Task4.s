.text
.globl main
main:
    addi x2, x2, -16       # make room on the stack (16 bytes)

    li   x5, 72            # 'H'
    sb   x5, 0(x2)         # y[0]
    li   x5, 101           # 'e'
    sb   x5, 1(x2)         # y[1]
    li   x5, 108           # 'l'
    sb   x5, 2(x2)         # y[2]
    li   x5, 108           # 'l'
    sb   x5, 3(x2)         # y[3]
    li   x5, 111           # 'o'
    sb   x5, 4(x2)         # y[4]
    sb   x0, 5(x2)         # y[5] = '\0' (end of string)

    addi x10, x2, 8        # x10 = x (destination, at sp + 8)
    mv   x11, x2           # x11 = y (source, at sp)
    jal  x1, strcpy        # call strcpy(x, y)

    addi x2, x2, 16        # free the stack space

    li   x17, 10           # ecall number 10 = exit
    ecall                  # end the program

strcpy:
    li   x5, 0             # i = 0

loop:
    add  x6, x5, x11       # x6 = address of y[i]
    lbu  x7, 0(x6)         # x7 = y[i]
    add  x28, x5, x10      # x28 = address of x[i]
    sb   x7, 0(x28)        # x[i] = y[i]
    beq  x7, x0, done      # if y[i] == '\0', stop
    addi x5, x5, 1         # i = i + 1
    jal  x0, loop          # repeat

done:
    jalr x0, 0(x1)         # return to main