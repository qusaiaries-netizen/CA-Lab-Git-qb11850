.text
.globl main
main:

addi x22, x0, 0        # i = 0
addi x24, x0, 5        # k = 5
lui  x25, 1000      # base address of save array

Loop: slli x10, x22, 2
      add  x10, x10, x25
      lw   x9, 0(x10)
      bne  x9, x24, Exit
      addi x22, x22, 1
      beq  x0, x0, Loop
Exit: