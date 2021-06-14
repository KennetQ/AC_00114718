org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10              ; fila en la que se mostrará el cursor
    MOV DL, 20              ; columna en la que se mostrará el cursor
    MOV byte [200h], 12     ; fila en la que se mostrará el cursor para Iteracion2
    MOV byte [201h], 14     ; fila en la que se mostrará el cursor para Iteracion3
    MOV byte [202h], 16     ; fila en la que se mostrará el cursor para Iteracion4

    call modotexto

    Iteracion1:
        call movercursor     ; llamada a mover cursor
        MOV CL, [cadena+SI]  ; Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI               ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL               ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI               ; contador para terminar la ejecución del programa al llegar a 6d
        CMP DI, 6d           ; Comparación de DI con 6d
        JB Iteracion1        ; si DI es menor a 6d, entonces que siga iterando.
        MOV DI, 0            ; Le asigna 0 a DI
        MOV DL, 20           ; Le aigna 20 a DL
        jmp Iteracion2       ; Si DI=6d que pase a la Iteracion2.

    Iteracion2:
        MOV DH, [200h]        
        call movercursor     ; llamada a mover cursor
        MOV CL, [cadena+SI]  ; Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI               ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL               ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI               ; contador para terminar la ejecución del programa al llegar a 7d
        CMP DI, 7d           ; Comparación de DI con 7d
        JB Iteracion2        ; si DI es menor a 7d, entonces que siga iterando.
        MOV DI, 0            ; Se le asigna 0 a DI
        MOV DL, 20           ; Se le asigna 20 a DL
        jmp Iteracion3       ; Si DI=7d que pase a la Iteracion3

     Iteracion3:
        MOV DH, [201h]      
        call movercursor     ; llamada a mover cursor
        MOV CL, [cadena+SI]  ; Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI               ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL               ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI               ; contador para terminar la ejecución del programa al llegar a 6d
        CMP DI, 6d           ; Comparación de DI con 6d
        JB Iteracion3        ; si DI es menor a 6d, entonces que siga iterando.
        MOV DI, 0            ; Se le asigna 0 a DI
        MOV DL, 20           ; Se le asigna 20 a DL
        jmp Iteracion4       ; Si DI=6d que pase a la Iteracion4 .

    Iteracion4:
        MOV DH, [202h]
        call movercursor     ;llamada a mover cursor
        MOV CL, [cadena+SI]  ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI               ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL               ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI               ; contador para terminar la ejecución del programa al llegar a 8d
        CMP DI, 8d           ; Comparación de DI con 8d
        JB Iteracion4        ; si DI es menor a 8d, entonces que siga iterando.
        MOV DI, 0            ; Se le asigna 0 a DI
        MOV DL, 20           ; Se le asigna 20 a DL
        jmp esperartecla     ; Si DI=8d que salte a esperar tecla.    

     modotexto: 
        MOV AH, 0h           ; activa modo texto
        MOV AL, 03h          ; modo gráfico deseado
        INT 10h
        RET

    movercursor:
        MOV AH, 02h          ; posiciona el cursor en pantalla.
        MOV BH, 0h 
        INT 10h
        RET

    escribircaracter:
        MOV AH, 0Ah          ; escribe caracter en pantalla según posición del cursor
        MOV AL, CL           ; denotamos el caracter a escribir en pantalla, los valores deben ser según código hexadecimal de tabla ASCII
        MOV BH, 0h           ; número de página
        MOV CX, 1h           ; número de veces a escribir el caracter
        INT 10h
        RET

    esperartecla:
        MOV AH, 00h          ;espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h

    exit:
        int 20h


    section .data

    cadena DB 'James Kennet Perez Quezada'
    