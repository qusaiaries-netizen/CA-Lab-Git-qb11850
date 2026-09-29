text
.globl main
main:
    li x20, 5  #a=5
    add x21, x0, x0   #b=0
    #li x22, 2  
    #li x23, 1
    addi x20 , x21 , 32 #a=b+32
    add x6 , x20 , x21  #c=a+b
    addi x19 , x6 , -5  #d = (a + b) - 5
    sub x18 , x20, x19 # f= a - d
    sub x17 , x21, x20 # g=b-a
    add x16 , x18, x17 # h=f+g
    add x15 , x16, x19 # e= h+d
    add x14 , x19 , x15 # i=d+e
    add x15 , x6 ,  x14 # e=c+i
   
end:
    j end