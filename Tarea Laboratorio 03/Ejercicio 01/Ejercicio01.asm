
        org 100h

        section .text
        
        xor     AX, AX
        mov     CL, 8d
        mov     BX, 200h
        
        ;James Kennet Pérez Quezada  00114718
        ; suma= 0+0+1+1+4+7+1+8 = 22
        ; promedio = 22/8 = 2
        mov     byte [200h], 00
        mov     byte [201h], 00
        mov     byte [202h], 01
        mov     byte [203h], 01
        mov     byte [204h], 04
        mov     byte [205h], 07
        mov     byte [206h], 01
        mov     byte [207h], 08    

        jmp     suma 

suma:   add     AL, [BX + SI]
        inc     SI
        loop    suma 

        mov     CL, 8d
        div     CL 
        mov     byte [20Ah], AL 
        
        int     20h 