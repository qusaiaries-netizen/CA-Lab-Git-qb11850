    .text 
    .globl main
    main:

    li x10, 5

    fact:
        li   x5, 1             # acc = 1

    loop:
        bge  x0, x10, done     # if n <= 0 (0 >= n), exit loop
        mul  x5, x5, x10        # acc = acc * n
        addi x10, x10, -1       # n = n - 1
        jal  x0, loop           # repeat

    done:
        mv   x10, x5            # return value = acc
        jalr x0, 0(x1)          # return to caller