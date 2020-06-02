;INSTITUTO TECNOLOGICO SUPERIOR DE VALLADOLID
;Lenguajes y Autonomas II
;sexto semestre Grupo A
;Lozano Mena Leonardo Daniel
;Dzib Canul Victor Jesus

.model small    ;tamanio del programa


.stack 64
.data
  
;declarando variables globales
numero1 db 0    ;primera Variable
numero2 db 0    ;segunda variable 

suma db 0               ;variable suma
resta db 0              ;variable resta
multiplicacion db 0     ;variable multiplicacion
division db 0           ;variable division

msjn1 db 10,13, "Ingrese el primer numero= ",'$';ingrese n1
msjn2 db 10,13, "Ingrese el segundo numero= ",'$';ingrese n2

;mensaje para mostrar los resultados
 
msjnS db 10,13, "La suma es= ",'$'              ;mensaje resulado suma
msjnR db 10,13, "La resta= ",'$'                ;mensaje resulado resta
msjnM db 10,13, "La Multiplicacion es= ",'$'    ;mensaje resulado multiplicacion
msjnD db 10,13, "La division es = ",'$'         ;mensaje resulado division 

.code           ;comienzo del codigo
begin proc far  ;inicio
    
    ;direccionamiento del procedimiento
    mov ax, @data
    mov ds,ax
    
    ;solicitar del teclado numero 1
    
    mov ah, 09
    lea dx, msjn1
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov numero1,al
    
    ;solicitar del teclado numero 2
    
    mov ah, 09
    lea dx, msjn2
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov numero2,al
    
    ;operaciones Basicas
                  
    ;SUMA             
    mov al,numero1
    add al,numero2
    mov suma,al  
    
    ;RESTA
    mov al,numero1
    sub al,numero2
    mov resta,al
    
    ;MULTIPLICACION
    mov al,numero1
    mul numero2
    mov multiplicacion,al
    
    ;DIVISION
    mov al,numero1
    div numero2
    mov division,al
           
    ;Mostrar los mensajes de los resultados 
    
    ;mostrando la suma
    mov ah,09
    lea dx,msjnS
    int 21h
    mov dl,suma
    add dl,30h 
    mov ah,02
    int 21h  
    
    ;mostrando la resta
    mov ah,09
    lea dx,msjnR
    int 21h
    mov dl,resta
    add dl,30h 
    mov ah,02
    int 21h
    
    ;mostrando la multiplicacion
    mov ah,09
    lea dx,msjnM
    int 21h
    mov dl,multiplicacion
    add dl,30h 
    mov ah,02
    int 21h
    
    ;mostrando la division
    mov ah,09
    lea dx,msjnD
    int 21h
    mov dl,division
    add dl,30h 
    mov ah,02
    int 21h
                
    
    ;cierre del programa
    mov ah,4ch
    int 21h
    
    begin endp
end            
    
  