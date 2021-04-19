;Escribir cuatro iniciales de su nombre completo empezando en la dirección de memoria 200h 
        org     100h

        section .text

        mov      byte [200h], "J"
        mov      byte [201h], "K"
        mov      byte [202h], "P"
        mov      byte [203h], "Q"
        mov      BX, 201h
        mov      SI, 1h
            
;Copiar el valor de 200h a AX usando direccionamiento directo.
        mov      AX, [200h]

;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
        mov      CX, [BX] 

;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
        mov      DX, [BX+SI]

;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
        mov      DI, [SI + 202h]

        int      20h   