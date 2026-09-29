.text
.globl main
main:
    li   x10, 6              # n = 6 (example input)
    jal  x1, fib
    mv   x11, x10            # a1 = result, to print
    li   x10, 1              # ecall id: print_int
    ecall
    li   x10, 10             # ecall id: exit
    ecall

fib:
    addi x2, x2, -12         # stack frame: save x1, n, fib(n-1)
    sw   x1, 8(x2)           # save return address
    sw   x10, 4(x2)          # save this call's n

    li   x5, 2
    blt  x10, x5, ret_f       # if n < 2, return n as-is

    addi x10, x10, -1         # arg = n - 1
    jal  x1, fib               # fib(n-1)
    sw   x10, 0(x2)            # save fib(n-1) result

    lw   x6, 4(x2)              # reload n
    addi x10, x6, -2             # arg = n - 2
    jal  x1, fib                  # fib(n-2)

    lw   x6, 0(x2)                # reload fib(n-1)
    add  x10, x10, x6              # result = fib(n-1) + fib(n-2)

ret_f:
    lw   x1, 8(x2)                 # restore return address
    addi x2, x2, 12                 # free stack frame
    jalr x0, 0(x1)                  # return