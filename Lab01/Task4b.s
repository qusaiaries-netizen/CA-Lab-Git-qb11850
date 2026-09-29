.text
.globl main
main:
   li x10, 0x100
    li x11, 0x200
    li x12, 0x300
    lb x13, 0(x10)
    lh x14, 0(x11)
    add x15, x13, x14
    sw x15, 0(x12)
    lb x13, 1(x10)
    lh x14, 2(x11)
    add x15, x13, x14
    sw x15, 4(x12)
    lb x13, 2(x10)
    lh x14, 4(x11)
    add x15, x13, x14
    sw x15, 8(x12)
    lb x13, 3(x10)
    lh x14, 6(x11)
    add x15, x13, x14
    sw x15, 12(x12)