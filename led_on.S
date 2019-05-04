
@ 点亮LED1  

.text
.global  _start
_start:     
        LDR        R0, = 0x56000050     @ R0 设为GPFCON寄存器， 

        MOV        R1, # 0x00000100     @ 设置GPF4 对应的位为01， 配置为输出
        STR        R1, [R0]             @ STR 写内存的指令， 将R1 的值写入R0 寄存器

        LDR        R0, = 0x56000054     @ R0 设为GPFDAT寄存器
        MOV        R1, # 0x00000000     @ R0 地址的值设置为 0x0, STR 写入 ， 0b00010000--->0x 00000010 ，为灭
        STR        R1, [R0]
MAIN_LOOP:
        B          MAIN_LOOP            @ B ?死循环
