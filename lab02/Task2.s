# Initialize
li x20, 2 # x = 0
li x21, 0 # a
li x22, 2 # b
li x23, 3 #c
li x1, 1
li x2, 2
li x3, 3
li x4, 4
beq x20, x1, case1
beq x20, x2, case2
beq x20, x3, case3
beq x20, x4, case4
li x21, 0
beq x0, x0, exit
case1: add x21, x22, x23
beq x0, x0, exit
case2: sub x21, x22, x23
beq x0, x0, exit
case3: slli x21, x22, 1
beq x0, x0, exit
case4: srli x21, x22, 1
exit: