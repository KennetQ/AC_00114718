
        org     100h

        section  .text

        mov BP,  arrByte
        mov BL,  02
        call Funcion

        int     20h

        section  .data

arrByte db      01,02,03,04,05,06,07,08,09,10,0xA
len     equ     $ - arrByte   ;Indica el tamaño del arreglo

;Subrutinas
; BP = Puntero de arreglo

Funcion: ;Arreglo par en 300h
        xor     SI, SI          ;Limpiamos el registro SI
        xor     DI, DI          ;Limpiamos el registro DI
while:
        xor     AX, AX          ;Limpiamos el registro AX
        mov     AL, [BP + SI]   ;AL = [Puntero a arreglo + SI]
        inc     SI              ;Incrementa en 1 SI
        mov     CL, AL  
        cmp     SI, len         ;Verifica si SI == len
        je      End             ;Salta a End si SI == len
        div     BL              ;Se divide el valor de AL/BL
        cmp     AH, 0           ;Verifica si el residuo de la operación es igual a 0  
        je      Par             ;Si el residuo de la division es cero salta a la funcion Par
        ja      Impar           ;Si el residuo de la division es mayor que cero salta a la funcion Impar     
        

Par:    ;Arreglo par en 300h
        mov     byte [300h+DI], CL   ;[Direccion de guardado + SI] = CL
        inc     DI                   ;Incrementa en 1 SI
        jmp     while


Impar:   ;Arreglo impar en 320h
        mov     byte [320h+DI], CL   ;[Direccion de guardado + SI] = CL  
        inc     DI                   ;Incrementa en 1 SI
        jmp     while

End:
        ret                          ;Se retorna a Call