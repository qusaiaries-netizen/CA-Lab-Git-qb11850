.text
.globl main
main:
    li   x10, 5             # num = 5 (example input)
    jal  x1, ntri            # call ntri(5)

     mv   x11, x10           # a1 = result, to print
    li   x10, 1             # a0 = 1 (ecall id: print_int)
    ecall

    li   x10, 10            # a0 = 10 (ecall id: exit)
    ecall

ntri:
    addi x2, x2, -8          # allocate stack frame (2 words)
    sw   x1, 4(x2)           # save return address
    sw   x10, 0(x2)          # save this call's num

    li   x5, 1
    bgt  x10, x5, recurse    # if num > 1, go recurse
    li   x10, 1              # else return 1
    jal  x0, ntri_end

recurse:
    addi x10, x10, -1        # arg = num - 1
    jal  x1, ntri             # ntri(num - 1)
    lw   x6, 0(x2)            # restore this call's num
    add  x10, x10, x6         # result = ntri(num-1) + num

ntri_end:
    lw   x1, 4(x2)            # restore return address
    addi x2, x2, 8            # free stack frame
    jalr x0, 0(x1)            # return to caller