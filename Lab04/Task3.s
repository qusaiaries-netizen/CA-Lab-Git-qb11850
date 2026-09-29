.text
.globl main
main:
    addi x2, x2, -24        # 20 bytes for a[5], 4 bytes to save x1
    sw   x1, 20(x2)          # save return address

    li   x5, 40
    sw   x5, 0(x2)            # a[0] = 40
    li   x5, 10
    sw   x5, 4(x2)            # a[1] = 10
    li   x5, 30
    sw   x5, 8(x2)            # a[2] = 30
    li   x5, 20
    sw   x5, 12(x2)           # a[3] = 20
    li   x5, 50
    sw   x5, 16(x2)           # a[4] = 50

    mv   x10, x2              # x10 = a (address of array)
    li   x11, 5               # x11 = len = 5
    jal  x1, bubble           # call bubble(a, 5)

    lw   x1, 20(x2)           # restore return address
    addi x2, x2, 24           # free stack space

    li   x10, 10              # ecall id: exit
    ecall


bubble:
    beq  x10, x0, ret_b       # if a == NULL, return
    beq  x11, x0, ret_b       # if len == 0, return

    li   x5, 0                # i = 0
loop_i:
    bge  x5, x11, ret_b       # if i >= len, done

    mv   x6, x5                # j = i
loop_j:
    bge  x6, x11, next_i       # if j >= len, exit inner loop

    slli x7, x5, 2             # x7 = i * 4
    add  x7, x10, x7            # x7 = &a[i]
    lw   x29, 0(x7)             # x29 = a[i]

    slli x28, x6, 2             # x28 = j * 4
    add  x28, x10, x28          # x28 = &a[j]
    lw   x30, 0(x28)            # x30 = a[j]

    bge  x29, x30, skip         # if a[i] >= a[j], skip swap

    sw   x30, 0(x7)             # a[i] = a[j]
    sw   x29, 0(x28)            # a[j] = temp (old a[i])

skip:
    addi x6, x6, 1              # j++
    jal  x0, loop_j

next_i:
    addi x5, x5, 1               # i++
    jal  x0, loop_i

ret_b:
    jalr x0, 0(x1)                # return