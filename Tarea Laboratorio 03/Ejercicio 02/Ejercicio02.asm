
        org     100h
        section .text

        XOR     CX, CX
        mov     CH, 00
        mov     CL, 05  
        mov     AH, 00
        mov     AL, 01
        cmp     CL, 00

        jz factorial

condic  mul CX
        loop condic

factorial  mov [20Bh], AL        

        int 20h