global _start

section .text
_start:
    mov eax, 0x0                    ; Password array index
    mov bp, 0x0                     ; Valid passwords found


main_loop:
    movzx esi, byte [passwords + eax]       ; Int index 1

    inc eax
    movzx edi, byte [passwords + eax]       ; Int index 2

    inc eax
    mov ch, [passwords + eax]       ; Character

    cmp ch, '\0'
    je halt

    inc eax                         ; EAX is now at beginning of password string
    mov ebx, eax
    add ebx, esi                    ; BX = password + index_1
    sub ebx, 1                      ; Counting in base 1...
    mov dl, [passwords + ebx]       ; 1st char of password

    mov ebx, eax
    add ebx, edi                    ; BX = password + index_2
    sub ebx, 1                      ; Counting in base 1...
    mov dh, [passwords + ebx]       ; 2nd char of password


reach_end_of_str:
    mov cl, [passwords + eax]
    inc eax
    cmp cl, '\0'
    jne reach_end_of_str


check_password:
    inc eax
    cmp ch, dl
    je first_true
    jne first_false


first_true:
    cmp ch, dh
    je main_loop
    inc bp
    jmp main_loop


first_false:
    cmp ch, dh
    jne main_loop
    inc bp
    jmp main_loop


halt:
    jmp halt


section .data
passwords:
    db 1 ; min
    db 4 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'q', 'z', 'm', 'g', 'b', 'j', 'w', 'p', 'j', '\0'

    db 2 ; min
    db 4 ; max
    db 'w' ; chr
    db 's', 'c', 'k', 'w', 'w', 'f', '\0'

    db 1 ; min
    db 13 ; max
    db 'b' ; chr
    db 'b', 'c', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'h', 'b', 'b', '\0'

    db 10 ; min
    db 11 ; max
    db 'x' ; chr
    db 'x', 'j', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'z', 'x', 'x', 'x', '\0'

    db 13 ; min
    db 14 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', '\0'

    db 16 ; min
    db 18 ; max
    db 's' ; chr
    db 'k', 's', 't', 't', 'b', 'j', 's', 's', 't', 'p', 'n', 's', 'v', 't', 'c', 'j', 'n', 'x', '\0'

    db 3 ; min
    db 8 ; max
    db 'k' ; chr
    db 'g', 'k', 'k', 'q', 'k', 'b', 'p', 'v', 'k', 'r', 'x', '\0'

    db 3 ; min
    db 7 ; max
    db 'c' ; chr
    db 'm', 'c', 'c', 'n', 'j', 'g', 'c', 'x', 'k', 'f', 'k', 'p', '\0'

    db 3 ; min
    db 7 ; max
    db 'b' ; chr
    db 'h', 'g', 'b', 'q', 'z', 'r', 'j', 'v', 'w', 'q', 'b', 'f', 'c', '\0'

    db 8 ; min
    db 14 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'f', 'r', 'r', 'r', 't', 'r', 'r', 'r', 'r', '\0'

    db 5 ; min
    db 6 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'w', 'p', 'v', 'v', 'v', '\0'

    db 4 ; min
    db 5 ; max
    db 'b' ; chr
    db 'z', 'f', 'k', 'p', 'b', '\0'

    db 12 ; min
    db 13 ; max
    db 'n' ; chr
    db 'n', 'w', 'n', 'w', 'd', 'p', 'l', 'n', 'h', 'f', 'h', 'l', 'n', 'n', 'n', 'n', 't', 'f', 'n', '\0'

    db 9 ; min
    db 14 ; max
    db 'z' ; chr
    db 's', 'x', 'z', 'j', 'z', 'f', 'r', 'z', 'z', 't', 'c', 'z', 'l', 'w', '\0'

    db 1 ; min
    db 14 ; max
    db 'n' ; chr
    db 'v', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 4 ; min
    db 6 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 's', 'b', 'b', '\0'

    db 2 ; min
    db 7 ; max
    db 'x' ; chr
    db 'x', 'x', 's', 'j', 'x', 'p', 'x', 'x', '\0'

    db 6 ; min
    db 8 ; max
    db 'z' ; chr
    db 'w', 'z', 'f', 'q', 'z', 'z', 'z', 'z', 'n', '\0'

    db 2 ; min
    db 17 ; max
    db 'b' ; chr
    db 'c', 'b', 'b', 'm', 'w', 'q', 'm', 'j', 'x', 'h', 'k', 'v', 'j', 'n', 'f', 'b', 'x', '\0'

    db 3 ; min
    db 9 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'g', 'h', 'h', 's', 'h', 'h', '\0'

    db 3 ; min
    db 13 ; max
    db 'm' ; chr
    db 'm', 'm', 'z', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'x', 'm', 'm', 'm', 'b', '\0'

    db 2 ; min
    db 4 ; max
    db 'v' ; chr
    db 'x', 'n', 'x', 'v', '\0'

    db 3 ; min
    db 4 ; max
    db 's' ; chr
    db 't', 's', 'x', 's', 'n', 's', '\0'

    db 1 ; min
    db 11 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'z', 'v', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', '\0'

    db 3 ; min
    db 6 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'k', 'h', 'h', 'h', 'h', '\0'

    db 9 ; min
    db 10 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'z', 'n', 's', 't', 'l', 'n', '\0'

    db 9 ; min
    db 10 ; max
    db 's' ; chr
    db 's', 'v', 'r', 's', 's', 'g', 's', 's', 's', 't', 's', 's', '\0'

    db 3 ; min
    db 4 ; max
    db 'j' ; chr
    db 'j', 'j', 'v', 'd', '\0'

    db 1 ; min
    db 3 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', '\0'

    db 3 ; min
    db 5 ; max
    db 'w' ; chr
    db 'g', 'w', 'h', 'd', 'x', 'v', 'p', 'f', '\0'

    db 3 ; min
    db 10 ; max
    db 'c' ; chr
    db 'b', 'x', 'l', 'd', 'c', 'l', 'l', 'f', 'm', 'x', 'k', 'h', 'z', 'm', '\0'

    db 7 ; min
    db 9 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'n', 'j', 'b', 'v', 'v', 'q', '\0'

    db 1 ; min
    db 4 ; max
    db 'r' ; chr
    db 'b', 'r', 'r', 'j', 'b', 'r', 'r', 'r', 'r', '\0'

    db 3 ; min
    db 4 ; max
    db 'l' ; chr
    db 'l', 'l', 'v', 'l', 'f', '\0'

    db 16 ; min
    db 17 ; max
    db 'p' ; chr
    db 'p', 'l', 'd', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'q', 'p', 'f', 'p', 'p', '\0'

    db 2 ; min
    db 3 ; max
    db 'k' ; chr
    db 'g', 'b', 'k', 'l', 'k', 's', '\0'

    db 11 ; min
    db 13 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'w', 'f', 'z', 'g', '\0'

    db 1 ; min
    db 5 ; max
    db 'n' ; chr
    db 't', 'n', 'n', 'n', 'k', 'n', '\0'

    db 10 ; min
    db 13 ; max
    db 'k' ; chr
    db 'r', 'k', 'z', 'k', 'k', 'k', 'k', 'c', 'z', 'p', 'r', 'z', 'v', '\0'

    db 10 ; min
    db 13 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'x', 'p', 'p', 'p', 'p', 'v', 'p', 'p', 'n', 'p', 'p', 'p', '\0'

    db 2 ; min
    db 4 ; max
    db 'd' ; chr
    db 'z', 'j', 'v', 'f', '\0'

    db 2 ; min
    db 3 ; max
    db 'h' ; chr
    db 'h', 'h', 'p', 'k', 's', 't', 'b', 'g', 'p', 'b', '\0'

    db 10 ; min
    db 15 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', '\0'

    db 7 ; min
    db 8 ; max
    db 'w' ; chr
    db 'w', 'w', 'v', 'w', 'w', 'w', 'j', 'w', '\0'

    db 12 ; min
    db 17 ; max
    db 'p' ; chr
    db 'm', 'f', 'j', 'z', 'p', 'n', 'v', 'p', 't', 'p', 'q', 'g', 'p', 'p', 'p', 't', 'c', '\0'

    db 4 ; min
    db 6 ; max
    db 'q' ; chr
    db 'q', 'k', 'q', 'q', 'q', 's', '\0'

    db 10 ; min
    db 11 ; max
    db 'p' ; chr
    db 'v', 'k', 'b', 'f', 't', 'p', 'c', 'p', 'p', 't', 'p', '\0'

    db 6 ; min
    db 8 ; max
    db 'k' ; chr
    db 'k', 'k', 'q', 'k', 'k', 'n', 'k', 'k', 'k', '\0'

    db 8 ; min
    db 9 ; max
    db 'j' ; chr
    db 'j', 'j', 'r', 'j', 'd', 'c', 'j', 'r', 'j', '\0'

    db 14 ; min
    db 16 ; max
    db 'f' ; chr
    db 'c', 'l', 'q', 'w', 'f', 'd', 's', 'f', 'b', 'j', 'n', 'g', 'f', 'k', 'w', 'f', '\0'

    db 14 ; min
    db 18 ; max
    db 'v' ; chr
    db 'v', 'z', 'v', 'v', 'v', 's', 'v', 'v', 'v', 'v', 'k', 'l', 'v', 'j', 'c', 'v', 'v', 'v', 'v', '\0'

    db 9 ; min
    db 12 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 't', 't', 't', 't', 'w', 't', 't', 't', 't', 't', '\0'

    db 1 ; min
    db 4 ; max
    db 'q' ; chr
    db 't', 'q', 'q', 'q', 'q', '\0'

    db 7 ; min
    db 16 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'r', 'f', 'r', 'r', 'r', 't', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', '\0'

    db 7 ; min
    db 9 ; max
    db 'c' ; chr
    db 't', 'c', 'f', 'q', 'h', 'c', 'w', 'd', 'f', 'd', '\0'

    db 3 ; min
    db 4 ; max
    db 'x' ; chr
    db 'k', 'p', 'x', 'x', '\0'

    db 7 ; min
    db 9 ; max
    db 'd' ; chr
    db 'd', 'b', 'd', 'x', 'd', 'd', 'd', 'n', 'n', 'd', 'd', 'n', 'd', 'k', 'd', 'r', 'z', 'd', '\0'

    db 2 ; min
    db 4 ; max
    db 'h' ; chr
    db 'g', 's', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', '\0'

    db 11 ; min
    db 12 ; max
    db 'x' ; chr
    db 'x', 'x', 's', 'x', 'x', 'x', 'x', 'x', 'x', 'r', 'x', 't', 'x', 'x', '\0'

    db 12 ; min
    db 16 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 'p', 't', 't', 't', '\0'

    db 2 ; min
    db 8 ; max
    db 'r' ; chr
    db 'k', 'z', 't', 't', 'p', 'q', 'x', 'r', 'c', 'p', '\0'

    db 2 ; min
    db 3 ; max
    db 'm' ; chr
    db 'm', 'm', 'z', 'm', 'm', '\0'

    db 9 ; min
    db 10 ; max
    db 'c' ; chr
    db 'c', 'c', 'f', 'c', 'c', 'c', 'c', 'c', 's', 'w', 'c', '\0'

    db 6 ; min
    db 7 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', '\0'

    db 5 ; min
    db 6 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'w', 'z', 'm', 'h', 'f', 'c', '\0'

    db 1 ; min
    db 4 ; max
    db 'h' ; chr
    db 'q', 'h', 'w', 't', '\0'

    db 5 ; min
    db 13 ; max
    db 'w' ; chr
    db 'c', 'w', 'k', 'w', 'j', 'r', 'v', 'j', 'k', 'w', 'v', 'l', 'w', 'r', 'm', 'v', '\0'

    db 2 ; min
    db 10 ; max
    db 'z' ; chr
    db 't', 'm', 'n', 'r', 't', 'w', 'q', 'z', 'm', 'z', 'n', 'h', 'r', 'q', 't', 'g', 'q', 'n', 'v', '\0'

    db 9 ; min
    db 13 ; max
    db 'j' ; chr
    db 'q', 'w', 'k', 'n', 'z', 'z', 'k', 'z', 'x', 'f', 'r', 'j', 's', '\0'

    db 18 ; min
    db 19 ; max
    db 'v' ; chr
    db 'z', 'l', 'w', 'n', 'v', 't', 'x', 'l', 'v', 'b', 'w', 'w', 'v', 'j', 'l', 'l', 't', 'q', 'v', '\0'

    db 5 ; min
    db 11 ; max
    db 'd' ; chr
    db 'd', 'x', 'g', 'k', 's', 'q', 'b', 'q', 'r', 'j', 'd', 'b', '\0'

    db 3 ; min
    db 7 ; max
    db 'q' ; chr
    db 'q', 'q', 'z', 'r', 'r', 'q', 'p', 'q', 'd', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'z', 'q', 'q', 'q', '\0'

    db 1 ; min
    db 4 ; max
    db 'g' ; chr
    db 'b', 'c', 'z', 'g', 'b', 'b', 's', 'x', 'g', 'g', '\0'

    db 12 ; min
    db 13 ; max
    db 'd' ; chr
    db 'c', 'x', 'c', 'p', 'd', 'd', 'l', 'd', 'k', 'p', 'n', 'd', 'd', '\0'

    db 4 ; min
    db 13 ; max
    db 'r' ; chr
    db 'r', 'g', 'r', 'r', 'r', 'h', 'm', 'z', 'r', 'r', 'v', 'w', 'r', 'r', 'r', '\0'

    db 15 ; min
    db 18 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'x', 'z', 'd', 'n', 'd', 'd', 't', 'p', 'd', 'd', 'm', 'd', 'd', 'd', '\0'

    db 8 ; min
    db 9 ; max
    db 'z' ; chr
    db 'z', 'z', 'f', 'g', 'm', 'f', 'n', 'f', 'h', '\0'

    db 3 ; min
    db 4 ; max
    db 'l' ; chr
    db 'l', 'l', 'm', 'l', 'l', '\0'

    db 5 ; min
    db 6 ; max
    db 'w' ; chr
    db 'l', 'm', 'w', 'm', 'w', 'k', '\0'

    db 3 ; min
    db 11 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', '\0'

    db 11 ; min
    db 14 ; max
    db 'n' ; chr
    db 'n', 't', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'r', '\0'

    db 14 ; min
    db 15 ; max
    db 'h' ; chr
    db 'b', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'v', '\0'

    db 4 ; min
    db 5 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'l', 'h', 't', 'h', 'h', 'h', 'h', 'h', 'n', 'h', 'h', 'h', '\0'

    db 11 ; min
    db 14 ; max
    db 'p' ; chr
    db 't', 'x', 'p', 'h', 'n', 'n', 'x', 'w', 'z', 'p', 'k', 'p', 'm', 't', '\0'

    db 2 ; min
    db 8 ; max
    db 'c' ; chr
    db 'c', 't', 'w', 'c', 'c', 'p', 'c', 'c', 'c', 'c', 'b', 't', 'c', 't', 'c', 'k', 't', '\0'

    db 1 ; min
    db 3 ; max
    db 'z' ; chr
    db 'w', 'z', 'z', 'z', 'z', '\0'

    db 8 ; min
    db 13 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 's', 'j', 's', 's', 's', 'm', '\0'

    db 8 ; min
    db 9 ; max
    db 'v' ; chr
    db 'c', 'v', 'v', 's', 'x', 'v', 'v', 'x', 'v', 'h', 'v', 'n', 'v', 'v', 'k', '\0'

    db 12 ; min
    db 13 ; max
    db 'p' ; chr
    db 'x', 'p', 'c', 'j', 'd', 'c', 'p', 'f', 'l', 'p', 'v', 'p', 's', 'c', 'h', 'z', '\0'

    db 10 ; min
    db 15 ; max
    db 'j' ; chr
    db 'j', 'j', 'p', 'j', 'j', 't', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'v', 'j', 'z', 'c', 'j', '\0'

    db 5 ; min
    db 8 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 'q', 's', 's', 's', 'l', 's', '\0'

    db 3 ; min
    db 4 ; max
    db 's' ; chr
    db 'f', 'k', 'l', 's', 'n', 's', 'p', '\0'

    db 4 ; min
    db 6 ; max
    db 'r' ; chr
    db 'r', 'h', 'b', 'r', 'r', 'z', 'r', 'r', 'm', 's', 'm', 'w', 'm', '\0'

    db 2 ; min
    db 7 ; max
    db 'n' ; chr
    db 'n', 'h', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 8 ; min
    db 10 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'f', 'h', 'h', 'l', 'h', '\0'

    db 2 ; min
    db 3 ; max
    db 'p' ; chr
    db 'h', 'g', 'p', 'f', 'q', 'p', 'v', 'q', '\0'

    db 10 ; min
    db 18 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', '\0'

    db 7 ; min
    db 9 ; max
    db 'r' ; chr
    db 'r', 's', 'r', 'l', 'r', 'r', 'r', 'h', 'w', 'r', 'b', 'c', 'r', 'r', '\0'

    db 11 ; min
    db 12 ; max
    db 'h' ; chr
    db 'z', 'b', 'h', 'h', 'j', 'p', 'm', 'h', 'j', 'x', 'w', 'h', '\0'

    db 2 ; min
    db 4 ; max
    db 'z' ; chr
    db 'r', 'z', 'd', 'g', 'z', '\0'

    db 11 ; min
    db 17 ; max
    db 'w' ; chr
    db 'g', 'b', 'd', 'w', 'c', 't', 'w', 'w', 'c', 'j', 'w', 'j', 'w', 'w', 'w', 'k', 'k', 'p', '\0'

    db 2 ; min
    db 9 ; max
    db 'w' ; chr
    db 'v', 'x', 'r', 'r', 'm', 'w', 'c', 'x', 'k', '\0'

    db 4 ; min
    db 5 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 'p', '\0'

    db 15 ; min
    db 16 ; max
    db 's' ; chr
    db 't', 'x', 'f', 'c', 's', 'k', 'w', 'm', 'j', 'l', 't', 'z', 'l', 'r', 'j', 'h', '\0'

    db 6 ; min
    db 15 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', '\0'

    db 6 ; min
    db 15 ; max
    db 'w' ; chr
    db 'n', 'n', 'l', 'c', 'w', 'w', 'q', 'w', 'w', 'b', 'g', 'w', 'w', 's', 'w', '\0'

    db 9 ; min
    db 11 ; max
    db 'n' ; chr
    db 'k', 'z', 'n', 'f', 'n', 'n', 'q', 'n', 'v', 'n', 'd', 'n', 'n', '\0'

    db 3 ; min
    db 4 ; max
    db 'x' ; chr
    db 'x', 'x', 'v', 'm', '\0'

    db 5 ; min
    db 7 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'v', 'p', 'j', 'c', '\0'

    db 3 ; min
    db 4 ; max
    db 't' ; chr
    db 't', 't', 't', 'b', 't', '\0'

    db 2 ; min
    db 12 ; max
    db 's' ; chr
    db 'z', 's', 'h', 'l', 'p', 'k', 'z', 'f', 'q', 'r', 's', 's', '\0'

    db 5 ; min
    db 8 ; max
    db 'g' ; chr
    db 'k', 'g', 'v', 'c', 'g', 'z', 'x', 'g', '\0'

    db 6 ; min
    db 8 ; max
    db 'z' ; chr
    db 'z', 'k', 'z', 'f', 'z', 'f', 'j', 'z', '\0'

    db 5 ; min
    db 9 ; max
    db 'q' ; chr
    db 'v', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'n', 'q', '\0'

    db 3 ; min
    db 4 ; max
    db 'j' ; chr
    db 'j', 'j', 'w', 's', '\0'

    db 9 ; min
    db 10 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'c', 'g', 'r', 'w', 'l', 'd', 'z', 'l', 'g', 'g', 'v', 'z', 'g', 'c', 'g', '\0'

    db 7 ; min
    db 10 ; max
    db 's' ; chr
    db 'p', 's', 's', 'q', 's', 'g', 's', 's', 'w', 'm', 'w', 'm', 's', 'm', 'q', 'c', 'x', '\0'

    db 10 ; min
    db 12 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'l', 'm', '\0'

    db 4 ; min
    db 9 ; max
    db 'z' ; chr
    db 'f', 'z', 'k', 'z', 'r', 'x', 'z', 'c', 'j', '\0'

    db 8 ; min
    db 10 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'd', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 1 ; min
    db 6 ; max
    db 'k' ; chr
    db 'k', 'k', 'q', 'k', 't', 'f', 'j', 'k', 'k', 'k', '\0'

    db 7 ; min
    db 11 ; max
    db 't' ; chr
    db 't', 'z', 't', 'b', 't', 't', 'x', 'x', 't', 'n', 'q', 'b', 'p', '\0'

    db 4 ; min
    db 10 ; max
    db 'w' ; chr
    db 'p', 'w', 'c', 'w', 'g', 'b', 'k', 'w', 'j', 'g', 'r', '\0'

    db 10 ; min
    db 13 ; max
    db 't' ; chr
    db 'b', 'z', 't', 'g', 't', 't', 't', 't', 'w', 'x', 'q', 'd', 'j', 't', 't', 'h', 't', '\0'

    db 3 ; min
    db 5 ; max
    db 'f' ; chr
    db 'l', 'l', 'z', 'f', 'f', '\0'

    db 13 ; min
    db 14 ; max
    db 'j' ; chr
    db 'f', 'j', 'w', 'j', 'j', 'j', 'd', 'j', 'j', 'j', 'j', 'j', 'm', 't', '\0'

    db 6 ; min
    db 7 ; max
    db 'g' ; chr
    db 'm', 'g', 'g', 'g', 'x', 'g', 'g', 'r', '\0'

    db 5 ; min
    db 13 ; max
    db 'l' ; chr
    db 'f', 's', 'j', 'l', 't', 'v', 'w', 'g', 'q', 'k', 's', 'l', 'l', 't', 'g', 'l', 'd', 'j', 'q', 'l', '\0'

    db 4 ; min
    db 8 ; max
    db 'c' ; chr
    db 'c', 'p', 'c', 'g', 'c', 'c', 'z', 'g', '\0'

    db 6 ; min
    db 7 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'b', 'n', 'n', '\0'

    db 10 ; min
    db 17 ; max
    db 's' ; chr
    db 's', 'm', 'd', 'v', 's', 's', 's', 't', 'z', 'z', 's', 'x', 'd', 'k', 'f', 's', 'k', '\0'

    db 6 ; min
    db 8 ; max
    db 'p' ; chr
    db 't', 'p', 'l', 'p', 'p', 'p', 'f', 'q', '\0'

    db 11 ; min
    db 12 ; max
    db 'h' ; chr
    db 'd', 't', 'k', 'h', 't', 't', 'l', 't', 'h', 'm', 'h', 'l', '\0'

    db 8 ; min
    db 11 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'r', 'q', 'q', 'q', 'q', 'q', 'q', 'v', 'q', 'q', '\0'

    db 11 ; min
    db 18 ; max
    db 'b' ; chr
    db 'b', 'n', 'b', 'c', 'b', 'l', 'z', 'n', 'b', 'b', 'q', 'k', 'f', 'b', 'n', 'q', 'v', 'b', '\0'

    db 14 ; min
    db 16 ; max
    db 'p' ; chr
    db 'v', 'l', 'k', 'c', 'p', 'p', 'c', 'p', 'b', 'r', 'j', 'x', 'c', 'h', 'w', 'p', 'g', 't', 'b', '\0'

    db 1 ; min
    db 3 ; max
    db 'r' ; chr
    db 'r', 'x', 'r', 'j', 'n', 'r', 'h', 'r', 'n', '\0'

    db 15 ; min
    db 19 ; max
    db 'x' ; chr
    db 'x', 'r', 's', 'v', 's', 'x', 'm', 'j', 'x', 'x', 'x', 'x', 'x', 'x', 'b', 'f', 'z', 't', 'x', '\0'

    db 1 ; min
    db 4 ; max
    db 'q' ; chr
    db 'z', 'q', 'q', 'q', '\0'

    db 12 ; min
    db 15 ; max
    db 'c' ; chr
    db 'c', 'f', 'f', 'c', 'z', 'f', 'c', 'm', 'z', 's', 'c', 'd', 'p', 'm', 'c', 'x', '\0'

    db 1 ; min
    db 8 ; max
    db 'b' ; chr
    db 'j', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 't', 'b', 'b', '\0'

    db 2 ; min
    db 4 ; max
    db 'q' ; chr
    db 'd', 'v', 'd', 'q', 'w', 'w', 'q', '\0'

    db 2 ; min
    db 4 ; max
    db 'h' ; chr
    db 'j', 'l', 'h', 'h', 'n', 'f', 'q', 'z', '\0'

    db 1 ; min
    db 3 ; max
    db 'r' ; chr
    db 'l', 'r', 'w', 'q', 'r', 'w', 'x', 's', 'q', 'm', 'z', 'r', '\0'

    db 4 ; min
    db 5 ; max
    db 'z' ; chr
    db 'g', 'f', 'z', 'z', 'h', 'k', 'g', 'z', 'p', 's', 'z', 't', 'z', 'f', 'k', '\0'

    db 13 ; min
    db 14 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'j', 'm', '\0'

    db 6 ; min
    db 8 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'n', 'w', 'n', 'n', 'n', 'm', '\0'

    db 10 ; min
    db 11 ; max
    db 'h' ; chr
    db 'h', 'r', 'h', 'c', 'h', 'r', 'q', 'd', 'h', 'x', 'h', 'h', 'h', 'h', 'h', 'h', 'r', '\0'

    db 9 ; min
    db 10 ; max
    db 'f' ; chr
    db 'f', 'b', 'f', 'f', 'f', 'l', 'f', 'f', 'd', 'f', '\0'

    db 7 ; min
    db 8 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'n', 'v', 'v', '\0'

    db 5 ; min
    db 13 ; max
    db 't' ; chr
    db 't', 'f', 't', 't', 't', 'g', 't', 'f', 'v', 't', 'b', 'q', 't', 't', 'w', 't', 'd', 'm', 't', 't', '\0'

    db 1 ; min
    db 9 ; max
    db 'v' ; chr
    db 'l', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'n', 'v', 'v', '\0'

    db 5 ; min
    db 7 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'x', 'r', 't', 'j', 'j', '\0'

    db 11 ; min
    db 13 ; max
    db 's' ; chr
    db 's', 'm', 's', 's', 's', 'j', 's', 's', 's', 's', 'p', 's', 'm', 's', '\0'

    db 7 ; min
    db 9 ; max
    db 'r' ; chr
    db 'm', 'w', 'm', 'r', 'q', 'r', 'p', 'r', 'r', 'h', 'v', 'h', 'r', 't', 'p', 'b', 'f', 'p', 'c', 'b', '\0'

    db 5 ; min
    db 8 ; max
    db 's' ; chr
    db 'h', 'w', 'g', 'n', 's', 's', 'x', 'p', '\0'

    db 6 ; min
    db 8 ; max
    db 'd' ; chr
    db 'n', 'c', 'f', 't', 'q', 'n', 'd', 'x', 'm', 'r', 'h', '\0'

    db 9 ; min
    db 14 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'w', 'g', 'l', 'g', 'g', 'd', 'g', 'g', 'l', 'g', 'm', 'g', 'g', 'k', 'g', '\0'

    db 1 ; min
    db 8 ; max
    db 'w' ; chr
    db 'v', 'w', 'v', 'w', 'w', 'w', 'k', 'w', 'w', 'w', '\0'

    db 1 ; min
    db 5 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'c', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'w', '\0'

    db 5 ; min
    db 13 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'j', 's', 'v', 'p', 'p', 'w', 'p', 'p', 'x', 'p', 'p', '\0'

    db 6 ; min
    db 15 ; max
    db 'v' ; chr
    db 'c', 's', 'v', 'k', 'h', 'z', 'l', 'h', 'v', 's', 'q', 'v', 'j', 'p', 'h', '\0'

    db 2 ; min
    db 6 ; max
    db 'h' ; chr
    db 'f', 'b', 'd', 's', 'c', 'h', 'r', 'j', 'n', 'c', 'h', '\0'

    db 6 ; min
    db 8 ; max
    db 'q' ; chr
    db 'w', 'q', 't', 'f', 'p', 'h', 'k', 'q', '\0'

    db 2 ; min
    db 9 ; max
    db 'b' ; chr
    db 'n', 'v', 'n', 'm', 'd', 'b', 'b', 'l', 'k', '\0'

    db 4 ; min
    db 5 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', '\0'

    db 3 ; min
    db 4 ; max
    db 'v' ; chr
    db 'v', 'b', 'h', 'd', '\0'

    db 2 ; min
    db 4 ; max
    db 'v' ; chr
    db 'v', 'v', 'm', 'q', 'v', 'v', '\0'

    db 10 ; min
    db 13 ; max
    db 'c' ; chr
    db 'x', 'q', 'k', 'b', 'r', 'f', 'c', 'p', 'q', 'r', 'm', 'x', 'c', 'l', 'x', 'k', 'n', 'g', 'f', 'x', '\0'

    db 7 ; min
    db 8 ; max
    db 'z' ; chr
    db 'h', 'z', 'z', 'z', 'z', 'p', 'r', 'z', '\0'

    db 8 ; min
    db 9 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'n', 'm', 'm', 'm', '\0'

    db 8 ; min
    db 9 ; max
    db 'n' ; chr
    db 'n', 'n', 'x', 'n', 'n', 'n', 'g', 'n', 'f', 'g', 'n', 'z', '\0'

    db 2 ; min
    db 4 ; max
    db 't' ; chr
    db 'r', 'z', 't', 'w', 't', '\0'

    db 16 ; min
    db 17 ; max
    db 'w' ; chr
    db 'b', 's', 'w', 'z', 'w', 'w', 'q', 'k', 'c', 'q', 'w', 'r', 'm', 'w', 'd', 'w', 't', '\0'

    db 11 ; min
    db 16 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 'q', 's', 's', 's', 's', 's', 's', 's', 'x', 's', 's', 's', '\0'

    db 8 ; min
    db 11 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'g', 'd', '\0'

    db 16 ; min
    db 18 ; max
    db 's' ; chr
    db 's', 'v', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', '\0'

    db 1 ; min
    db 2 ; max
    db 'c' ; chr
    db 'g', 'c', 'c', 'c', 'l', 'x', 'k', 'l', 'r', 'c', 'q', 'v', '\0'

    db 2 ; min
    db 7 ; max
    db 'l' ; chr
    db 'g', 'b', 'w', 'l', 'l', 'l', 'l', 'f', 'l', 'k', 'l', 'l', '\0'

    db 1 ; min
    db 9 ; max
    db 'h' ; chr
    db 'h', 'q', 'n', 'h', 'h', 'h', 'h', 'h', 'b', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'p', '\0'

    db 14 ; min
    db 15 ; max
    db 'p' ; chr
    db 'l', 'm', 'd', 'p', 'p', 'r', 'l', 'c', 'b', 'r', 'p', 'p', 'm', 'p', 'p', '\0'

    db 1 ; min
    db 8 ; max
    db 'n' ; chr
    db 'n', 'r', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'k', 'f', '\0'

    db 15 ; min
    db 16 ; max
    db 'q' ; chr
    db 'h', 'p', 'q', 'r', 'j', 'q', 'w', 'j', 'q', 'x', 'n', 't', 'f', 'x', 'q', 'c', 'p', '\0'

    db 1 ; min
    db 7 ; max
    db 'h' ; chr
    db 'h', 'h', 'f', 'f', 'n', 'z', 'f', 'w', 'l', 'q', 't', 'f', 'h', 'h', '\0'

    db 1 ; min
    db 5 ; max
    db 'k' ; chr
    db 'z', 'n', 'x', 'd', 'd', 'g', 'k', 'k', 'f', 'v', 'r', 'k', 'k', 'g', 'r', 'g', 'k', '\0'

    db 2 ; min
    db 5 ; max
    db 'n' ; chr
    db 'n', 't', 'n', 'n', 'p', 'n', 'j', '\0'

    db 17 ; min
    db 19 ; max
    db 'x' ; chr
    db 'f', 'b', 'f', 'r', 'x', 'x', 'c', 't', 'r', 'n', 'b', 's', 'h', 'q', 'w', 'p', 'x', 'p', 'x', '\0'

    db 6 ; min
    db 7 ; max
    db 'z' ; chr
    db 'b', 'z', 'z', 'p', 'f', 'z', 'l', '\0'

    db 9 ; min
    db 13 ; max
    db 'n' ; chr
    db 't', 'n', 'x', 'b', 'n', 'n', 'n', 'n', 'v', 'm', 'n', 'n', 'n', 'n', 't', 'c', 'k', '\0'

    db 9 ; min
    db 12 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'b', 'z', 'g', 'z', 'v', 'v', 'c', 'q', 'v', 'z', 'v', '\0'

    db 5 ; min
    db 7 ; max
    db 'l' ; chr
    db 'l', 'c', 'r', 'p', 'l', 'm', 'w', 'l', '\0'

    db 6 ; min
    db 13 ; max
    db 'k' ; chr
    db 'l', 'k', 'k', 'k', 'd', 'k', 'g', 'z', 'w', 'l', 'l', 'm', 'k', 'f', 'k', 'k', '\0'

    db 3 ; min
    db 9 ; max
    db 'f' ; chr
    db 'q', 'p', 'f', 'v', 'f', 'f', 'd', 'g', 'p', '\0'

    db 2 ; min
    db 4 ; max
    db 't' ; chr
    db 'j', 't', 'w', 'j', '\0'

    db 5 ; min
    db 6 ; max
    db 'q' ; chr
    db 'q', 'q', 'g', 'q', 'q', 'q', 'z', '\0'

    db 1 ; min
    db 2 ; max
    db 'f' ; chr
    db 'w', 'f', 'f', 'g', 'p', 'r', 'm', 'f', '\0'

    db 8 ; min
    db 17 ; max
    db 'm' ; chr
    db 'z', 'm', 'm', 'm', 'm', 'm', 'd', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'q', 'm', 'v', '\0'

    db 1 ; min
    db 13 ; max
    db 'm' ; chr
    db 'v', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 's', 'm', 'm', 'm', 'm', '\0'

    db 1 ; min
    db 4 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', '\0'

    db 1 ; min
    db 7 ; max
    db 'n' ; chr
    db 'v', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 3 ; min
    db 7 ; max
    db 's' ; chr
    db 's', 'n', 's', 's', 's', 's', 'q', 's', 's', 's', 'r', '\0'

    db 4 ; min
    db 6 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', '\0'

    db 1 ; min
    db 4 ; max
    db 'q' ; chr
    db 'j', 'q', 'q', 'q', 'q', 'q', 'q', '\0'

    db 4 ; min
    db 7 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'h', 'z', '\0'

    db 10 ; min
    db 12 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'd', 'c', 'h', 'h', 'd', 'h', 'h', 'j', 'p', 'h', 'h', 'f', 'h', '\0'

    db 14 ; min
    db 20 ; max
    db 'c' ; chr
    db 'h', 'c', 's', 'c', 'j', 'x', 'w', 'v', 'r', 'w', 'm', 'f', 'g', 'j', 'c', 'r', 'c', 'g', 'r', 's', '\0'

    db 7 ; min
    db 8 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'j', 'b', 'b', 'b', 'b', 'b', 'b', '\0'

    db 11 ; min
    db 17 ; max
    db 'w' ; chr
    db 't', 'j', 'w', 'h', 'c', 'p', 'v', 'h', 'd', 'z', 'k', 'p', 'z', 'n', 'q', 'z', 'w', 'x', 'l', '\0'

    db 4 ; min
    db 5 ; max
    db 'n' ; chr
    db 'p', 'r', 'n', 'l', 'n', 'c', 's', '\0'

    db 4 ; min
    db 11 ; max
    db 'r' ; chr
    db 'r', 'x', 'z', 'q', 'f', 'q', 'w', 'w', 'k', 'l', 'd', '\0'

    db 9 ; min
    db 12 ; max
    db 'z' ; chr
    db 'z', 'l', 't', 'z', 'z', 'j', 'j', 'r', 't', 'v', 'c', 'p', 'w', 'h', 'z', 'd', '\0'

    db 1 ; min
    db 4 ; max
    db 'm' ; chr
    db 'r', 'h', 'j', 'm', 'z', 'v', 'k', 'm', 'j', '\0'

    db 3 ; min
    db 4 ; max
    db 'b' ; chr
    db 'b', 'l', 'x', 'j', 'b', 'b', '\0'

    db 10 ; min
    db 11 ; max
    db 'h' ; chr
    db 's', 'k', 'h', 'h', 'q', 'q', 'h', 'c', 'n', 'h', 'm', 't', 'h', 'q', '\0'

    db 10 ; min
    db 11 ; max
    db 't' ; chr
    db 'x', 't', 'r', 't', 'v', 'w', 't', 'h', 'f', 't', 'r', '\0'

    db 2 ; min
    db 3 ; max
    db 'm' ; chr
    db 'm', 'm', 'q', 'c', 'z', 'm', 'x', '\0'

    db 2 ; min
    db 4 ; max
    db 'd' ; chr
    db 'd', 'q', 'd', 'd', 'd', '\0'

    db 1 ; min
    db 4 ; max
    db 's' ; chr
    db 's', 't', 'l', 's', '\0'

    db 4 ; min
    db 5 ; max
    db 'b' ; chr
    db 'b', 'b', 'v', 'q', 'x', '\0'

    db 15 ; min
    db 17 ; max
    db 't' ; chr
    db 'h', 'v', 'f', 'n', 'w', 'l', 'j', 't', 'g', 'v', 't', 'm', 't', 'm', 'g', 't', 't', 't', '\0'

    db 6 ; min
    db 12 ; max
    db 'f' ; chr
    db 'f', 'p', 'f', 'g', 'p', 't', 'k', 'm', 'f', 'h', 'j', 'f', '\0'

    db 16 ; min
    db 17 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'c', 'r', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'v', 'c', '\0'

    db 9 ; min
    db 11 ; max
    db 'f' ; chr
    db 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'v', 'f', 'f', '\0'

    db 1 ; min
    db 6 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'x', '\0'

    db 3 ; min
    db 7 ; max
    db 'n' ; chr
    db 'x', 'n', 'n', 'n', 'g', 'j', 'h', 'n', 'n', 'n', '\0'

    db 1 ; min
    db 9 ; max
    db 'b' ; chr
    db 'b', 'n', 'j', 'h', 'b', 't', 'w', 'h', 'b', 'b', 'd', 't', 'b', 'x', '\0'

    db 4 ; min
    db 14 ; max
    db 'q' ; chr
    db 't', 'n', 's', 'p', 'f', 'd', 'f', 't', 'f', 'h', 'q', 'n', 'g', 'v', '\0'

    db 4 ; min
    db 12 ; max
    db 'h' ; chr
    db 'h', 't', 'r', 'h', 't', 'r', 's', 'f', 'q', 'h', 'z', 'h', 'm', '\0'

    db 3 ; min
    db 11 ; max
    db 'w' ; chr
    db 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'p', 'w', 'm', 'w', 'w', 'm', '\0'

    db 8 ; min
    db 9 ; max
    db 'w' ; chr
    db 'w', 'z', 'w', 'x', 'm', 'w', 'w', 'd', 'w', '\0'

    db 6 ; min
    db 10 ; max
    db 'b' ; chr
    db 'd', 'j', 'b', 'n', 'w', 'b', 'l', 'b', 'q', 'z', 'b', 'b', 'b', 'n', '\0'

    db 4 ; min
    db 10 ; max
    db 'c' ; chr
    db 'b', 'n', 'd', 'n', 'x', 'j', 'r', 'n', 'q', 'z', 't', 'c', 'x', 'v', 'l', 't', '\0'

    db 1 ; min
    db 7 ; max
    db 'j' ; chr
    db 'j', 'j', 'd', 'g', 'd', 'j', 'z', '\0'

    db 7 ; min
    db 12 ; max
    db 'd' ; chr
    db 'd', 'd', 'v', 'd', 'd', 'c', 'd', 'd', 'd', 'd', 'x', 'z', 'd', 'd', 'd', 'n', '\0'

    db 12 ; min
    db 17 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'f', 'd', 'z', 'z', 'z', 'z', 'z', 'l', '\0'

    db 5 ; min
    db 6 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'n', 'r', 'r', 'r', 'r', 'q', 'r', 'r', 'r', 'r', 'r', '\0'

    db 10 ; min
    db 13 ; max
    db 'x' ; chr
    db 'x', 'z', 'l', 'x', 'z', 'k', 'j', 'r', 'b', 't', 'v', 'p', 'z', 'h', '\0'

    db 6 ; min
    db 8 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'v', 'b', '\0'

    db 8 ; min
    db 10 ; max
    db 'q' ; chr
    db 'n', 'q', 'q', 'z', 'q', 'z', 'n', 'q', 'q', 'q', 'd', '\0'

    db 6 ; min
    db 18 ; max
    db 'p' ; chr
    db 'd', 's', 'p', 'g', 'q', 't', 'p', 'm', 'h', 'd', 'x', 'p', 'd', 'p', 'c', 'h', 'p', 'v', '\0'

    db 2 ; min
    db 5 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'b', 'j', '\0'

    db 5 ; min
    db 16 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'q', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 2 ; min
    db 8 ; max
    db 's' ; chr
    db 'f', 'g', 's', 's', 'g', 'p', 's', 'b', 's', 's', 's', 's', 'b', 's', '\0'

    db 5 ; min
    db 6 ; max
    db 'z' ; chr
    db 'z', 'z', 'l', 'm', 'z', 'v', 'd', 'q', '\0'

    db 13 ; min
    db 16 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 'b', 't', 't', 'v', 't', '\0'

    db 4 ; min
    db 18 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'z', 'k', 'z', 'k', 'k', 'k', 'k', 'f', 'k', 'k', 'k', 'k', 'k', 'k', 'j', 'k', '\0'

    db 8 ; min
    db 9 ; max
    db 'w' ; chr
    db 'w', 'w', 'p', 'w', 'w', 'q', 'x', 'w', 'w', 'n', 'w', 'p', 'v', 'c', 'w', '\0'

    db 1 ; min
    db 7 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'w', 'x', '\0'

    db 5 ; min
    db 6 ; max
    db 'v' ; chr
    db 'h', 't', 'v', 'v', 'b', 'n', '\0'

    db 2 ; min
    db 4 ; max
    db 'c' ; chr
    db 'b', 'c', 'c', 'q', 'q', 'p', '\0'

    db 14 ; min
    db 17 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 's', '\0'

    db 10 ; min
    db 11 ; max
    db 'j' ; chr
    db 't', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', '\0'

    db 9 ; min
    db 11 ; max
    db 'j' ; chr
    db 'p', 'j', 'j', 'x', 'b', 'j', 'c', 'f', 'j', 'h', 'v', 'm', 'l', 'v', 'p', 'f', 'd', 'n', '\0'

    db 5 ; min
    db 7 ; max
    db 'v' ; chr
    db 'd', 'v', 'r', 'b', 'r', 'j', 'v', 'm', 'p', 'v', 'h', 'z', 'g', 'p', 'z', 'v', 'v', 'v', '\0'

    db 2 ; min
    db 6 ; max
    db 'm' ; chr
    db 'm', 'q', 'm', 'm', 't', 'm', '\0'

    db 6 ; min
    db 9 ; max
    db 't' ; chr
    db 't', 'n', 't', 't', 't', 'l', 't', 't', 't', 't', 't', 't', 't', '\0'

    db 3 ; min
    db 6 ; max
    db 's' ; chr
    db 't', 's', 'n', 'r', 'm', 'q', 's', 's', 'q', '\0'

    db 7 ; min
    db 10 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'l', 'h', 'f', 'l', 'v', 'n', 'l', '\0'

    db 8 ; min
    db 12 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'h', 'k', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 1 ; min
    db 2 ; max
    db 'k' ; chr
    db 'k', 'c', 'k', 'k', 'k', 'v', 'j', 'k', 'k', 'c', '\0'

    db 8 ; min
    db 12 ; max
    db 'x' ; chr
    db 's', 'x', 'x', 'x', 'x', 'x', 'x', 'd', 'x', 'x', 'n', 'x', 'g', 'x', 'x', 'x', 'x', '\0'

    db 15 ; min
    db 18 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'b', 'z', 'z', 'z', 'z', 'z', 'z', 'z', '\0'

    db 3 ; min
    db 7 ; max
    db 'j' ; chr
    db 'r', 'j', 'j', 'j', 'j', 'j', 'q', '\0'

    db 13 ; min
    db 14 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'l', 'k', 'k', 'k', 'k', 'q', 'k', 'k', '\0'

    db 4 ; min
    db 5 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'q', 'h', '\0'

    db 9 ; min
    db 11 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'p', 'h', 'b', 'x', 'l', 'r', 'x', 'x', 's', 'x', 't', 's', '\0'

    db 4 ; min
    db 11 ; max
    db 'x' ; chr
    db 'g', 'j', 'l', 'm', 'm', 'v', 'x', 'd', 'h', 'f', 'x', 'v', 'j', 'h', 'x', 'b', 'q', '\0'

    db 6 ; min
    db 12 ; max
    db 'x' ; chr
    db 'x', 'g', 'z', 'c', 'q', 'x', 'j', 'm', 'p', 'v', 'z', 'm', '\0'

    db 8 ; min
    db 9 ; max
    db 's' ; chr
    db 's', 'n', 's', 's', 's', 's', 'k', 's', 's', 's', 's', 's', '\0'

    db 12 ; min
    db 17 ; max
    db 's' ; chr
    db 'g', 'n', 's', 'w', 'j', 'q', 'x', 'k', 'm', 'r', 's', 's', 's', 'n', 's', 'b', 'l', 'd', 'b', '\0'

    db 7 ; min
    db 8 ; max
    db 'g' ; chr
    db 'g', 'g', 'z', 'z', 'g', 'f', 'g', 'l', '\0'

    db 10 ; min
    db 11 ; max
    db 'f' ; chr
    db 'n', 'p', 'p', 'd', 'z', 'q', 'k', 'f', 'j', 'f', 'b', 'j', 'h', 'd', 'k', 'x', '\0'

    db 5 ; min
    db 7 ; max
    db 'f' ; chr
    db 'b', 'r', 'c', 'm', 'f', 's', 'k', '\0'

    db 7 ; min
    db 11 ; max
    db 't' ; chr
    db 't', 't', 'l', 't', 'f', 't', 'h', 't', 't', 't', 't', 't', 'j', 't', 't', '\0'

    db 3 ; min
    db 4 ; max
    db 'f' ; chr
    db 'z', 'l', 'f', 'f', 'k', 'd', 'c', 'n', 's', 'v', 'm', '\0'

    db 2 ; min
    db 4 ; max
    db 'f' ; chr
    db 'g', 'g', 'f', 'r', '\0'

    db 13 ; min
    db 16 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'g', 'x', 'x', 'k', 'x', '\0'

    db 9 ; min
    db 10 ; max
    db 'p' ; chr
    db 'j', 'x', 't', 'l', 'z', 'q', 'p', 'p', 't', 'p', 'x', 'p', 'z', 'j', 'x', 'h', '\0'

    db 1 ; min
    db 6 ; max
    db 'k' ; chr
    db 'g', 'j', 'k', 'z', 'k', 'k', 'k', 'k', 'k', '\0'

    db 5 ; min
    db 6 ; max
    db 't' ; chr
    db 't', 't', 't', 'v', 'g', 't', 'j', 't', 't', '\0'

    db 1 ; min
    db 15 ; max
    db 'd' ; chr
    db 'v', 'd', 'd', 'j', 'd', 'd', 'd', 'v', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', '\0'

    db 8 ; min
    db 13 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'f', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', '\0'

    db 1 ; min
    db 6 ; max
    db 'x' ; chr
    db 'k', 'x', 'x', 'x', 'x', 'p', 'x', 'x', 'x', '\0'

    db 4 ; min
    db 10 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'j', 'm', 'z', 'l', 'c', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'j', 'm', '\0'

    db 1 ; min
    db 2 ; max
    db 'k' ; chr
    db 'k', 's', 'b', 'm', 'k', 'd', 'v', 'w', 'k', '\0'

    db 1 ; min
    db 2 ; max
    db 'x' ; chr
    db 'd', 'x', 'x', 'x', 'h', '\0'

    db 4 ; min
    db 10 ; max
    db 't' ; chr
    db 'z', 'v', 'n', 'v', 's', 'f', 'v', 'w', 'c', 't', 'r', 'l', 'v', 's', '\0'

    db 5 ; min
    db 10 ; max
    db 'b' ; chr
    db 'b', 'b', 'r', 'q', 'b', 'b', 'p', 'b', 'n', 'b', '\0'

    db 4 ; min
    db 5 ; max
    db 'n' ; chr
    db 'n', 'n', 'm', 'k', 'n', 'z', 'n', 'n', '\0'

    db 5 ; min
    db 9 ; max
    db 'b' ; chr
    db 'b', 'n', 'c', 'h', 'b', 'm', 'b', 'b', 'b', 'w', 'b', 'f', 'p', '\0'

    db 6 ; min
    db 8 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'c', 'j', 'j', 'j', 'j', 'j', '\0'

    db 4 ; min
    db 6 ; max
    db 'k' ; chr
    db 'k', 'w', 'k', 'b', 'k', 'k', 'k', 'k', '\0'

    db 5 ; min
    db 7 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 't', 'm', 'z', 'h', 'm', '\0'

    db 12 ; min
    db 15 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'j', '\0'

    db 11 ; min
    db 14 ; max
    db 't' ; chr
    db 'l', 'q', 's', 't', 'p', 'f', 'w', 'c', 'k', 'g', 't', 'r', 'p', 't', '\0'

    db 11 ; min
    db 14 ; max
    db 'z' ; chr
    db 'w', 'f', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'v', 'z', 'z', 'z', '\0'

    db 4 ; min
    db 14 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'b', 'c', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 18 ; min
    db 19 ; max
    db 'q' ; chr
    db 'q', 'v', 'k', 'm', 't', 'q', 'q', 'q', 'q', 'q', 'k', 'q', 'b', 'q', 'q', 'q', 'q', 'g', 'q', 'd', '\0'

    db 3 ; min
    db 4 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'r', 'k', 'm', 'm', 'm', 's', 'm', 'm', 'm', 'v', 'z', 'm', 'z', 'm', 'r', 'm', 'm', '\0'

    db 4 ; min
    db 5 ; max
    db 'm' ; chr
    db 'h', 'c', 'g', 'm', 'm', '\0'

    db 2 ; min
    db 4 ; max
    db 'v' ; chr
    db 'v', 'm', 'f', 'c', '\0'

    db 8 ; min
    db 11 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'v', 'm', 'm', '\0'

    db 1 ; min
    db 7 ; max
    db 'f' ; chr
    db 'f', 'f', 't', 'f', 'f', 'q', 'h', 'f', 'f', '\0'

    db 14 ; min
    db 15 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'm', 'n', 'j', 'j', 'j', 'h', 'j', 'h', 'j', 'z', 'd', 'j', 'j', '\0'

    db 16 ; min
    db 17 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'w', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'r', 'd', 't', 'n', 'd', '\0'

    db 5 ; min
    db 11 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'c', 'd', 't', 'r', 'd', 'd', 'q', 'd', 'd', 'd', '\0'

    db 7 ; min
    db 11 ; max
    db 'm' ; chr
    db 'x', 'f', 'h', 'm', 'l', 'm', 'k', 'm', 'm', 'p', 'm', 'm', '\0'

    db 13 ; min
    db 14 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 'g', 's', 's', 's', 's', 's', 's', 's', '\0'

    db 7 ; min
    db 11 ; max
    db 'v' ; chr
    db 'v', 'k', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'r', 'v', 'v', 'v', 'v', 'x', 'f', '\0'

    db 2 ; min
    db 3 ; max
    db 'z' ; chr
    db 'z', 's', 'j', 'z', 'z', '\0'

    db 1 ; min
    db 2 ; max
    db 'z' ; chr
    db 'z', 'q', 'd', 'g', 'v', 'z', '\0'

    db 3 ; min
    db 9 ; max
    db 'z' ; chr
    db 'z', 'z', 'k', 'z', 'z', 'z', 'z', 'z', 'd', 'z', '\0'

    db 5 ; min
    db 8 ; max
    db 'd' ; chr
    db 'h', 'n', 'j', 't', 'd', 'd', 'w', 'd', '\0'

    db 10 ; min
    db 16 ; max
    db 'k' ; chr
    db 'l', 'k', 'w', 'b', 'f', 'k', 'b', 'r', 'c', 'h', 'f', 'k', 'k', 'k', 'k', 'k', 'c', '\0'

    db 2 ; min
    db 3 ; max
    db 'm' ; chr
    db 'k', 'm', 'm', 'q', 'b', '\0'

    db 4 ; min
    db 5 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'g', 'q', '\0'

    db 10 ; min
    db 11 ; max
    db 'z' ; chr
    db 'r', 'j', 'n', 'p', 'z', 'z', 'l', 'b', 'v', 'r', 'f', 'z', 'x', 't', 'h', 'z', 'j', '\0'

    db 6 ; min
    db 7 ; max
    db 'q' ; chr
    db 'w', 'q', 'z', 'r', 'z', 'g', 'q', 'l', '\0'

    db 6 ; min
    db 7 ; max
    db 'z' ; chr
    db 'm', 'z', 'b', 'z', 'v', 'g', 'z', '\0'

    db 2 ; min
    db 3 ; max
    db 'p' ; chr
    db 's', 'p', 'f', 'd', '\0'

    db 14 ; min
    db 15 ; max
    db 'p' ; chr
    db 'j', 'p', 'p', 'p', 't', 'j', 'p', 'p', 'b', 'p', 't', 'p', 's', 'p', 'v', '\0'

    db 3 ; min
    db 8 ; max
    db 'b' ; chr
    db 'c', 'b', 'b', 'b', 'b', 'k', 'k', 'b', 'g', 't', '\0'

    db 9 ; min
    db 11 ; max
    db 'k' ; chr
    db 'h', 'k', 'v', 'n', 'k', 'g', 'k', 'k', 'p', 'k', 'k', 'l', '\0'

    db 6 ; min
    db 8 ; max
    db 'f' ; chr
    db 'f', 'f', 'c', 'f', 'f', 'p', 'f', 'f', '\0'

    db 4 ; min
    db 11 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'n', 'b', 'h', 'r', 'b', 'r', 'p', 'd', 'f', 'r', 'r', 'r', 'r', 'r', '\0'

    db 12 ; min
    db 15 ; max
    db 'g' ; chr
    db 'd', 'g', 'd', 'g', 'd', 'g', 'g', 'h', 'z', 'l', 'g', 'r', 'd', 'g', 'g', 'g', '\0'

    db 15 ; min
    db 16 ; max
    db 'r' ; chr
    db 'n', 'p', 'd', 'm', 'n', 'z', 's', 'p', 'x', 'j', 'm', 'b', 'm', 'f', 'w', 'p', '\0'

    db 1 ; min
    db 4 ; max
    db 'c' ; chr
    db 'x', 'q', 'c', 'r', 'k', 'c', '\0'

    db 3 ; min
    db 9 ; max
    db 'l' ; chr
    db 'l', 'd', 'c', 'f', 'd', 'l', 'z', 'h', 'b', 'k', '\0'

    db 5 ; min
    db 15 ; max
    db 's' ; chr
    db 's', 's', 'r', 's', 'c', 'c', 's', 's', 'q', 's', 'c', 's', 's', 'n', 's', 'm', '\0'

    db 5 ; min
    db 8 ; max
    db 'l' ; chr
    db 'b', 'k', 'd', 'b', 'l', 'b', 'x', 'h', 's', 'm', 't', 'l', 'q', 'h', 'z', 'w', 'q', 'j', '\0'

    db 2 ; min
    db 3 ; max
    db 'j' ; chr
    db 'q', 'q', 'n', 'n', 'p', 'm', 'n', 'b', 'j', 's', 'h', 'b', 'b', '\0'

    db 15 ; min
    db 17 ; max
    db 'f' ; chr
    db 'g', 'f', 'f', 'k', 'k', 'f', 'f', 'v', 'f', 'f', 'd', 'n', 's', 'c', 'f', 'f', 'f', 'f', '\0'

    db 3 ; min
    db 14 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'm', 'x', '\0'

    db 11 ; min
    db 15 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 's', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'r', 'p', 'p', 'd', '\0'

    db 3 ; min
    db 5 ; max
    db 's' ; chr
    db 'w', 'x', 'j', 'k', 's', '\0'

    db 8 ; min
    db 15 ; max
    db 'd' ; chr
    db 'd', 'g', 'd', 's', 'd', 'b', 'd', 'd', 'l', 'd', 'c', 'h', 'd', 'v', 'd', 'd', 'd', 'd', '\0'

    db 14 ; min
    db 15 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'b', 'c', 'k', 'k', '\0'

    db 9 ; min
    db 17 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'b', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'q', 'z', '\0'

    db 4 ; min
    db 10 ; max
    db 'b' ; chr
    db 'h', 'b', 'z', 'k', 'f', 'b', 'k', 'm', 'g', 'b', '\0'

    db 2 ; min
    db 4 ; max
    db 'w' ; chr
    db 'b', 'w', 'g', 'w', 'w', 'n', '\0'

    db 3 ; min
    db 4 ; max
    db 'r' ; chr
    db 'k', 'n', 'r', 'r', '\0'

    db 9 ; min
    db 14 ; max
    db 'p' ; chr
    db 't', 'p', 'c', 'w', 'n', 'f', 't', 'j', 'p', 'p', 'v', 'd', 'q', 'd', 'd', 'p', 'r', 'w', '\0'

    db 1 ; min
    db 2 ; max
    db 'd' ; chr
    db 'd', 'p', 'p', 'd', 'd', '\0'

    db 1 ; min
    db 5 ; max
    db 'n' ; chr
    db 'p', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 6 ; min
    db 7 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 's', '\0'

    db 8 ; min
    db 13 ; max
    db 'h' ; chr
    db 'h', 'g', 'd', 'n', 'h', 'n', 'h', 'l', 't', 'b', 'h', 'b', 'h', 'h', 'd', 'h', 's', 'z', 'w', '\0'

    db 6 ; min
    db 12 ; max
    db 'w' ; chr
    db 'r', 't', 's', 'w', 's', 'l', 'j', 'c', 'x', 'z', 'j', 'w', 'j', 'h', 'b', 'c', 'd', 'n', 'g', '\0'

    db 1 ; min
    db 2 ; max
    db 'h' ; chr
    db 'h', 'h', 'd', 'd', 'c', 'v', 'j', 'h', 'r', 'r', 'q', 'p', 'q', 'q', '\0'

    db 9 ; min
    db 12 ; max
    db 'r' ; chr
    db 'c', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'd', 'r', '\0'

    db 9 ; min
    db 12 ; max
    db 'k' ; chr
    db 'k', 'w', 'k', 'k', 'k', 'k', 'k', 'k', 'c', 'b', 'k', 'p', 'k', '\0'

    db 2 ; min
    db 5 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 't', '\0'

    db 1 ; min
    db 4 ; max
    db 'g' ; chr
    db 'n', 'g', 'g', 'l', '\0'

    db 3 ; min
    db 6 ; max
    db 'r' ; chr
    db 'l', 'r', 'r', 't', 'r', 'd', 'r', 'f', 'v', 'g', '\0'

    db 6 ; min
    db 7 ; max
    db 'r' ; chr
    db 'r', 'z', 'r', 'g', 'l', 'r', 'w', 'r', 'v', '\0'

    db 1 ; min
    db 2 ; max
    db 'l' ; chr
    db 'h', 'g', 'l', 'l', 'l', 'l', '\0'

    db 2 ; min
    db 4 ; max
    db 'z' ; chr
    db 'z', 'v', 'b', 'z', '\0'

    db 6 ; min
    db 7 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'n', 'c', 'c', 'c', 'c', 'c', '\0'

    db 3 ; min
    db 4 ; max
    db 'w' ; chr
    db 'g', 'l', 'w', 'm', 'm', '\0'

    db 8 ; min
    db 11 ; max
    db 'z' ; chr
    db 'v', 'j', 'z', 's', 'z', 'z', 'z', 'z', 'n', 'z', 'z', 'l', 'z', 'z', 's', '\0'

    db 6 ; min
    db 8 ; max
    db 'z' ; chr
    db 'p', 'z', 'z', 'f', 'q', 'p', 'z', 'z', 'x', 'z', 'f', 'z', '\0'

    db 6 ; min
    db 11 ; max
    db 'p' ; chr
    db 'v', 'w', 'p', 'p', 'p', 'g', 'h', 'p', 'r', 'p', 'm', 'r', 'd', 'v', '\0'

    db 9 ; min
    db 13 ; max
    db 'p' ; chr
    db 'm', 'z', 'k', 'p', 'j', 'p', 'v', 'j', 'h', 'p', 'p', 'k', 'j', 'k', 'w', 'x', '\0'

    db 9 ; min
    db 14 ; max
    db 'j' ; chr
    db 'j', 'w', 'h', 'w', 'j', 'k', 'v', 's', 'z', 'j', 'w', 'd', 'z', 'g', 'l', 'b', '\0'

    db 1 ; min
    db 4 ; max
    db 'r' ; chr
    db 'n', 'r', 'r', 'l', 'n', 'p', 'v', 'd', 'g', 'f', 'x', 'k', '\0'

    db 8 ; min
    db 9 ; max
    db 'j' ; chr
    db 'g', 'g', 'j', 's', 'd', 'm', 'z', 'j', 'k', 's', 'x', 'j', 'c', 'j', 'g', 't', 'w', '\0'

    db 3 ; min
    db 5 ; max
    db 'w' ; chr
    db 'q', 'j', 'w', 'w', 'x', 'w', '\0'

    db 7 ; min
    db 9 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'v', 'g', 'v', 'v', 'v', '\0'

    db 11 ; min
    db 15 ; max
    db 'v' ; chr
    db 'v', 'v', 'l', 'g', 'p', 'v', 'x', 'v', 'v', 'p', 'v', 'k', 'v', 'v', 'f', 'b', '\0'

    db 5 ; min
    db 8 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'j', 'p', 'j', 'k', '\0'

    db 2 ; min
    db 4 ; max
    db 'l' ; chr
    db 'l', 'd', 'l', 'z', '\0'

    db 2 ; min
    db 8 ; max
    db 'w' ; chr
    db 'j', 'l', 'j', 'w', 'w', 'w', 'w', 'w', 'b', 'w', 'w', 'f', 'w', '\0'

    db 6 ; min
    db 7 ; max
    db 'r' ; chr
    db 's', 'w', 'w', 'r', 'z', 'r', 'r', '\0'

    db 9 ; min
    db 11 ; max
    db 'm' ; chr
    db 'm', 'r', 'w', 'm', 'm', 'm', 'm', 'm', 'z', 'n', 'm', 'c', 'm', '\0'

    db 12 ; min
    db 14 ; max
    db 'k' ; chr
    db 'n', 'k', 'k', 'k', 'k', 'k', 'z', 'k', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 3 ; min
    db 4 ; max
    db 'z' ; chr
    db 'z', 'k', 't', 'z', '\0'

    db 3 ; min
    db 6 ; max
    db 'r' ; chr
    db 'r', 'x', 'c', 'r', 'k', 'r', 'z', 'g', 'r', 'r', 'r', 'q', 'f', 'l', '\0'

    db 4 ; min
    db 7 ; max
    db 'q' ; chr
    db 'k', 'q', 'w', 'q', 'p', 'c', 'q', 'z', 'q', '\0'

    db 4 ; min
    db 7 ; max
    db 'd' ; chr
    db 'd', 'n', 'd', 'x', 'p', 'd', 'd', '\0'

    db 4 ; min
    db 15 ; max
    db 'd' ; chr
    db 's', 'r', 'd', 'd', 'q', 'h', 'b', 'c', 'p', 't', 'n', 'j', 'h', 's', 'd', 'f', 'g', 't', '\0'

    db 4 ; min
    db 13 ; max
    db 'q' ; chr
    db 'x', 'q', 'q', 'v', 'j', 'v', 'd', 'b', 'v', 'h', 'q', 'f', 'q', 'g', '\0'

    db 10 ; min
    db 12 ; max
    db 'p' ; chr
    db 'r', 'g', 'm', 'v', 't', 'p', 'h', 'z', 'z', 'p', 'z', 'p', '\0'

    db 1 ; min
    db 6 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', '\0'

    db 9 ; min
    db 10 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'p', 'q', 'q', '\0'

    db 11 ; min
    db 12 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'w', 'd', 'd', 'm', 'd', 'd', 'm', 'v', 'd', 't', 'n', 'h', 'd', '\0'

    db 3 ; min
    db 13 ; max
    db 's' ; chr
    db 'p', 'f', 'x', 'n', 'k', 'k', 't', 't', 'n', 'b', 'q', 'q', 'b', 'c', 'f', 'm', 'h', 'k', 'l', 's', '\0'

    db 1 ; min
    db 8 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', '\0'

    db 3 ; min
    db 4 ; max
    db 'f' ; chr
    db 'l', 'k', 'f', 'n', '\0'

    db 8 ; min
    db 14 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'k', 'c', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'r', 'n', 'm', 'x', 'x', '\0'

    db 5 ; min
    db 10 ; max
    db 'd' ; chr
    db 'z', 'j', 'b', 'h', 'd', 'r', 'p', 'd', 'k', 's', 's', 'b', 'p', '\0'

    db 3 ; min
    db 12 ; max
    db 'f' ; chr
    db 'f', 'f', 'f', 'f', 'f', 'b', 'f', 'f', 'f', 'f', 'f', 'g', 'f', '\0'

    db 6 ; min
    db 7 ; max
    db 's' ; chr
    db 't', 'k', 'r', 'w', 'h', 's', 'f', '\0'

    db 15 ; min
    db 19 ; max
    db 'w' ; chr
    db 'd', 'w', 'w', 'j', 'x', 'w', 'w', 'k', 'w', 'w', 'w', 'w', 'c', 'w', 's', 'q', 'w', 'w', 'x', '\0'

    db 3 ; min
    db 4 ; max
    db 'd' ; chr
    db 'd', 'd', 'h', 'n', '\0'

    db 3 ; min
    db 4 ; max
    db 'c' ; chr
    db 'c', 'c', 'j', 't', 'c', '\0'

    db 6 ; min
    db 10 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'c', 'd', 'z', 'v', 'z', 'z', 'z', 'z', '\0'

    db 5 ; min
    db 6 ; max
    db 'p' ; chr
    db 'j', 'l', 'p', 'p', 'z', 'p', 'w', 'p', 'r', 'p', '\0'

    db 1 ; min
    db 7 ; max
    db 'x' ; chr
    db 'z', 'x', 'x', 'x', 'x', 'm', 'x', 'x', 'x', '\0'

    db 12 ; min
    db 17 ; max
    db 'n' ; chr
    db 'n', 'v', 'z', 's', 'n', 'r', 'r', 'n', 'n', 'b', 'n', 'w', 'g', 'm', 'w', 'x', 'v', 'n', 'z', 't', '\0'

    db 11 ; min
    db 12 ; max
    db 'r' ; chr
    db 'r', 'm', 'r', 'r', 'q', 'r', 'v', 'l', 'n', 'q', 'r', 'r', '\0'

    db 6 ; min
    db 12 ; max
    db 'f' ; chr
    db 'v', 'c', 'q', 'w', 'f', 'c', 'r', 'w', 'g', 'x', 'b', 'f', 'b', 'b', 's', 's', 'x', 'p', '\0'

    db 7 ; min
    db 9 ; max
    db 'p' ; chr
    db 'w', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', '\0'

    db 1 ; min
    db 4 ; max
    db 's' ; chr
    db 's', 's', 's', 'r', 's', 's', 's', '\0'

    db 5 ; min
    db 6 ; max
    db 'q' ; chr
    db 'f', 'q', 'q', 'q', 'h', 'q', 'b', 'q', '\0'

    db 6 ; min
    db 10 ; max
    db 'f' ; chr
    db 'n', 'f', 'h', 'f', 'p', 'f', 'f', 'f', 'f', 'm', '\0'

    db 3 ; min
    db 6 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', '\0'

    db 10 ; min
    db 12 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'w', 'm', 'b', 'q', 'v', 'x', 'r', 'b', 'b', 'f', 'd', 'p', 'r', '\0'

    db 19 ; min
    db 20 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 't', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'b', 'g', '\0'

    db 8 ; min
    db 10 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'q', 'r', '\0'

    db 2 ; min
    db 12 ; max
    db 's' ; chr
    db 'p', 's', 'q', 'b', 's', 'j', 'v', 'j', 't', 'q', 'x', 'r', 'x', 'f', 'm', 'm', '\0'

    db 5 ; min
    db 7 ; max
    db 'h' ; chr
    db 'q', 'h', 'x', 'l', 'm', 'g', 'h', '\0'

    db 4 ; min
    db 5 ; max
    db 'b' ; chr
    db 'z', 'k', 'b', 'n', 'b', '\0'

    db 7 ; min
    db 9 ; max
    db 'c' ; chr
    db 'z', 'g', 'f', 'g', 'z', 'f', 'c', 'b', 'x', 'b', 'p', 'w', 'g', 'm', 'q', 'p', '\0'

    db 2 ; min
    db 5 ; max
    db 'z' ; chr
    db 'z', 'b', 'z', 'z', 'z', 'z', 'z', 'z', '\0'

    db 12 ; min
    db 15 ; max
    db 'v' ; chr
    db 't', 'v', 'r', 's', 'x', 't', 'k', 't', 'p', 'j', 'v', 'k', 'n', 'k', 'v', '\0'

    db 4 ; min
    db 5 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 1 ; min
    db 2 ; max
    db 'h' ; chr
    db 'v', 'x', 'h', 'h', 'h', 'f', '\0'

    db 13 ; min
    db 17 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 't', 'x', 'x', 'x', 'x', 'x', 'x', '\0'

    db 3 ; min
    db 5 ; max
    db 'f' ; chr
    db 'h', 'z', 'q', 'h', 'f', 'j', 'x', 'r', 'b', 'j', 'f', 'v', 'k', 'l', 'd', 'f', 'q', 'q', 'd', '\0'

    db 3 ; min
    db 10 ; max
    db 'h' ; chr
    db 'z', 'h', 'h', 'q', 'd', 'b', 'g', 'm', 'x', 'h', '\0'

    db 12 ; min
    db 13 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 't', 't', 't', 't', 'w', 't', 't', 'm', 't', '\0'

    db 1 ; min
    db 8 ; max
    db 'm' ; chr
    db 'w', 'm', 'd', 'm', 's', 'm', 'm', 'm', 'm', 'm', 'm', 'm', '\0'

    db 16 ; min
    db 17 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'v', 'l', 'l', '\0'

    db 3 ; min
    db 15 ; max
    db 'z' ; chr
    db 'd', 'n', 'z', 'r', 't', 'b', 'j', 'r', 'l', 'g', 'f', 'h', 'l', 'j', 'z', 's', 'w', '\0'

    db 3 ; min
    db 10 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'n', 'p', '\0'

    db 2 ; min
    db 12 ; max
    db 'j' ; chr
    db 'z', 'j', 'p', 'd', 'z', 'q', 'n', 'f', 'v', 'd', 'd', 'm', 'c', 't', 'l', 'b', 's', 'n', 'j', '\0'

    db 5 ; min
    db 13 ; max
    db 'f' ; chr
    db 'f', 'v', 'g', 'h', 'f', 'm', 'f', 'q', 'm', 'n', 'b', 'f', 'f', '\0'

    db 3 ; min
    db 7 ; max
    db 'v' ; chr
    db 's', 'c', 'v', 'v', 's', 'h', 'j', '\0'

    db 2 ; min
    db 5 ; max
    db 'v' ; chr
    db 'v', 'v', 'z', 'v', 'c', '\0'

    db 3 ; min
    db 16 ; max
    db 'c' ; chr
    db 'm', 'z', 'f', 'h', 'w', 'g', 'p', 'l', 'c', 'b', 'r', 'k', 'x', 'g', 'b', 'c', '\0'

    db 3 ; min
    db 4 ; max
    db 'b' ; chr
    db 'p', 'p', 'c', 'b', 'n', 'z', 'r', 'b', 'p', 'c', 'd', 'n', '\0'

    db 1 ; min
    db 6 ; max
    db 'q' ; chr
    db 'n', 'n', 'q', 'n', 'z', 'q', '\0'

    db 11 ; min
    db 13 ; max
    db 'w' ; chr
    db 'w', 'm', 's', 'w', 'n', 't', 'w', 'b', 'r', 'd', 'w', 'v', 'h', 'h', '\0'

    db 1 ; min
    db 12 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'r', 'w', 'r', 'l', 'r', 'r', 'r', 'r', 'r', 'r', 'r', '\0'

    db 3 ; min
    db 9 ; max
    db 'q' ; chr
    db 'l', 'j', 'x', 'l', 'w', 's', 'q', 'r', 'q', '\0'

    db 5 ; min
    db 6 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'l', 'm', '\0'

    db 10 ; min
    db 12 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'p', 'h', '\0'

    db 14 ; min
    db 19 ; max
    db 'f' ; chr
    db 'f', 'f', 'n', 'f', 'f', 'r', 'm', 'z', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'g', 'f', 'f', 'h', '\0'

    db 2 ; min
    db 3 ; max
    db 'j' ; chr
    db 'j', 'v', 'j', 'j', '\0'

    db 3 ; min
    db 10 ; max
    db 't' ; chr
    db 't', 'g', 't', 'w', 'j', 't', 't', 'j', 'c', 'j', 'b', 'k', 't', 'n', '\0'

    db 1 ; min
    db 2 ; max
    db 'l' ; chr
    db 'l', 'n', 'l', 'n', 'w', 'l', 'f', 'l', 'b', 'l', 'l', 'z', 'n', 'l', 'l', 'z', 'l', 'r', '\0'

    db 8 ; min
    db 10 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'f', 'h', 'k', '\0'

    db 11 ; min
    db 12 ; max
    db 'q' ; chr
    db 'j', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'm', 'q', '\0'

    db 1 ; min
    db 3 ; max
    db 'm' ; chr
    db 'm', 'k', 'm', 'm', 'r', '\0'

    db 12 ; min
    db 13 ; max
    db 'z' ; chr
    db 'w', 'x', 'p', 'z', 'l', 'z', 'c', 'z', 'm', 's', 'f', 'z', 'c', '\0'

    db 12 ; min
    db 14 ; max
    db 't' ; chr
    db 't', 't', 't', 'q', 'w', 't', 'v', 't', 'k', 'k', 'w', 'k', 'r', 't', '\0'

    db 8 ; min
    db 12 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'w', 'x', 'x', 'x', 'b', 'x', 'x', 'x', 'r', 't', 'j', 'x', 'p', 't', '\0'

    db 4 ; min
    db 7 ; max
    db 'g' ; chr
    db 'g', 'g', 't', 'x', 'g', 'g', 'g', 'g', '\0'

    db 3 ; min
    db 5 ; max
    db 'g' ; chr
    db 'q', 'z', 'c', 'd', 'w', 'g', '\0'

    db 10 ; min
    db 11 ; max
    db 'g' ; chr
    db 'z', 'g', 'b', 'z', 'f', 'r', 'g', 's', 'g', 'g', 'p', '\0'

    db 2 ; min
    db 5 ; max
    db 'g' ; chr
    db 'g', 'n', 'g', 'g', 'd', 'g', '\0'

    db 14 ; min
    db 15 ; max
    db 'n' ; chr
    db 'r', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'q', 'n', 'n', 's', 'n', 'c', 'n', '\0'

    db 14 ; min
    db 15 ; max
    db 'g' ; chr
    db 'w', 'g', 'g', 'g', 'g', 'm', 'g', 'g', 'g', 'g', 'w', 'k', 'g', 'g', 'd', 'g', '\0'

    db 13 ; min
    db 18 ; max
    db 'p' ; chr
    db 'p', 'h', 'g', 'p', 'j', 'b', 'p', 'g', 't', 'g', 'k', 'p', 'c', 'r', 'c', 'p', 'd', 'f', 'p', 'p', '\0'

    db 5 ; min
    db 7 ; max
    db 'v' ; chr
    db 'v', 'l', 'r', 'm', 'v', 'p', 'd', 'w', '\0'

    db 6 ; min
    db 7 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'z', 'v', 'v', '\0'

    db 10 ; min
    db 11 ; max
    db 'v' ; chr
    db 'n', 'r', 'd', 'p', 'd', 'c', 's', 'b', 'f', 'v', 'v', 'b', 'f', 'z', 'x', 'v', 'm', '\0'

    db 1 ; min
    db 2 ; max
    db 'd' ; chr
    db 'd', 'd', 'b', 'j', 'v', 'q', 'h', 'd', '\0'

    db 8 ; min
    db 10 ; max
    db 'w' ; chr
    db 'w', 'w', 'v', 'w', 'w', 'k', 'v', 'x', 'w', 'b', 'w', 'w', 'w', 'w', '\0'

    db 3 ; min
    db 6 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'd', 'k', 'j', 'z', 'w', 'j', 'n', '\0'

    db 10 ; min
    db 12 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 's', 'x', 'x', '\0'

    db 13 ; min
    db 14 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'l', 'm', 'm', 'm', 'm', '\0'

    db 5 ; min
    db 7 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 'd', 's', 's', 's', 's', 's', 's', 's', '\0'

    db 3 ; min
    db 4 ; max
    db 'p' ; chr
    db 'p', 'h', 'l', 'p', 'p', '\0'

    db 6 ; min
    db 16 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'h', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'f', '\0'

    db 7 ; min
    db 8 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'b', 'j', 'v', '\0'

    db 1 ; min
    db 4 ; max
    db 'p' ; chr
    db 'f', 'w', 'p', 'x', 'p', 'k', 'p', '\0'

    db 4 ; min
    db 8 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'v', 'p', '\0'

    db 1 ; min
    db 2 ; max
    db 'w' ; chr
    db 'c', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'k', '\0'

    db 13 ; min
    db 18 ; max
    db 'g' ; chr
    db 'g', 'r', 'g', 's', 'k', 'r', 'g', 'd', 'g', 'z', 'g', 'g', 'b', 'b', 'q', 'h', 'q', 'b', 'g', '\0'

    db 2 ; min
    db 9 ; max
    db 's' ; chr
    db 'r', 'h', 'n', 'z', 't', 'n', 'f', 's', 's', 'm', 'r', 's', 'r', '\0'

    db 1 ; min
    db 6 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 'v', '\0'

    db 2 ; min
    db 7 ; max
    db 'd' ; chr
    db 'b', 'd', 'p', 'c', 'x', 'g', 'w', 'd', 'q', 'g', 'q', 'z', 'g', 's', 'f', 'v', 'b', 'm', '\0'

    db 9 ; min
    db 11 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'b', 'd', 'd', '\0'

    db 7 ; min
    db 17 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'b', 'h', 'h', 'm', 'h', 'b', 'h', 'h', 'h', 's', 'v', 'h', 'h', 'h', '\0'

    db 7 ; min
    db 16 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'l', 't', 'n', 'v', 'v', 'm', 'c', 'r', 'q', 'v', 'v', 'd', 'm', 'z', 'm', 'h', 'c', '\0'

    db 1 ; min
    db 10 ; max
    db 'j' ; chr
    db 'b', 'q', 'j', 'j', 'l', 'x', 'd', 'c', 'h', 'w', 'm', 'b', 'm', '\0'

    db 11 ; min
    db 12 ; max
    db 'b' ; chr
    db 'm', 'j', 'w', 'b', 'w', 'b', 'c', 'j', 'b', 'd', 'b', 's', '\0'

    db 4 ; min
    db 5 ; max
    db 'x' ; chr
    db 'b', 'z', 'l', 'x', 'c', '\0'

    db 4 ; min
    db 9 ; max
    db 's' ; chr
    db 'd', 's', 's', 's', 's', 's', 's', 'v', 'b', 'l', 's', 'q', 's', 't', 's', 's', 't', 's', '\0'

    db 5 ; min
    db 6 ; max
    db 'b' ; chr
    db 'b', 'b', 'm', 'b', 't', 'b', 'b', 'w', 'b', '\0'

    db 11 ; min
    db 12 ; max
    db 'b' ; chr
    db 'g', 'h', 't', 'g', 'f', 'b', 'n', 'j', 't', 'q', 'x', 'b', '\0'

    db 3 ; min
    db 6 ; max
    db 'j' ; chr
    db 'j', 'j', 'r', 'j', 'j', 'j', 'j', 'j', 'j', '\0'

    db 3 ; min
    db 4 ; max
    db 'w' ; chr
    db 'w', 'w', 'w', 'w', 'w', 'w', '\0'

    db 11 ; min
    db 13 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'h', 'm', '\0'

    db 8 ; min
    db 11 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 'p', 's', 's', 'p', 's', 's', 's', '\0'

    db 2 ; min
    db 4 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'k', '\0'

    db 3 ; min
    db 6 ; max
    db 'p' ; chr
    db 'x', 'p', 'm', 'p', 'p', 'v', 'z', 'p', '\0'

    db 6 ; min
    db 8 ; max
    db 'l' ; chr
    db 'q', 'w', 't', 'b', 'j', 'z', 'h', 'l', 'd', '\0'

    db 2 ; min
    db 3 ; max
    db 'n' ; chr
    db 'n', 'x', 't', 'n', '\0'

    db 5 ; min
    db 8 ; max
    db 'w' ; chr
    db 'q', 'n', 'w', 'p', 'w', 'w', 'w', 'w', 'j', 'b', 'c', 't', 'p', '\0'

    db 6 ; min
    db 7 ; max
    db 'n' ; chr
    db 'd', 'n', 'w', 'l', 'n', 'n', 'n', '\0'

    db 3 ; min
    db 4 ; max
    db 'g' ; chr
    db 'b', 'f', 'm', 'g', 'w', 'd', 'g', '\0'

    db 10 ; min
    db 12 ; max
    db 'n' ; chr
    db 'q', 's', 'h', 'v', 't', 'p', 'h', 'v', 'n', 'w', 'm', 'n', '\0'

    db 4 ; min
    db 7 ; max
    db 'f' ; chr
    db 'z', 'g', 'f', 'n', 'k', 'f', 'j', '\0'

    db 3 ; min
    db 15 ; max
    db 's' ; chr
    db 'z', 'v', 's', 'l', 'm', 'f', 'q', 'c', 'm', 'x', 'v', 's', 'g', 'v', 'v', '\0'

    db 15 ; min
    db 18 ; max
    db 'q' ; chr
    db 'q', 'q', 'h', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'v', 'q', 'q', 'm', 'q', 'q', 'w', 'q', '\0'

    db 4 ; min
    db 6 ; max
    db 'w' ; chr
    db 'd', 'l', 'w', 'w', 'x', 'c', 'p', 'm', 'q', '\0'

    db 4 ; min
    db 9 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'l', 'k', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 8 ; min
    db 10 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'c', 'd', 'w', 'c', 'c', 'r', '\0'

    db 1 ; min
    db 4 ; max
    db 'z' ; chr
    db 'j', 'c', 'z', 'z', 'z', 'z', 'g', 'z', 'm', 'z', 'z', 'z', 'r', 'z', 'z', 'z', 'z', '\0'

    db 8 ; min
    db 9 ; max
    db 'r' ; chr
    db 'j', 'v', 't', 'r', 'k', 't', 'd', 'v', 'd', 'f', 'r', '\0'

    db 2 ; min
    db 8 ; max
    db 'v' ; chr
    db 'v', 'z', 'v', 'v', 'v', 'v', 'v', 'v', '\0'

    db 2 ; min
    db 3 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', '\0'

    db 11 ; min
    db 14 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'k', 'c', 'c', 'c', 'c', 't', 'c', '\0'

    db 3 ; min
    db 4 ; max
    db 'b' ; chr
    db 'w', 'x', 'c', 'r', 'h', 'b', 'k', 'p', 'b', 't', 'k', 'q', 'b', 'b', '\0'

    db 5 ; min
    db 7 ; max
    db 't' ; chr
    db 'z', 'g', 'p', 't', 't', 't', 'r', '\0'

    db 1 ; min
    db 7 ; max
    db 'm' ; chr
    db 'f', 'm', 'm', 'm', 'm', 't', 'm', 'm', 'm', 'm', '\0'

    db 3 ; min
    db 7 ; max
    db 'p' ; chr
    db 'h', 'v', 'c', 'p', 'k', 'b', 'p', '\0'

    db 4 ; min
    db 5 ; max
    db 'v' ; chr
    db 'p', 'g', 'v', 'h', 'c', '\0'

    db 19 ; min
    db 20 ; max
    db 't' ; chr
    db 't', 'n', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 'l', 't', 't', 't', 't', 't', '\0'

    db 3 ; min
    db 6 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'c', 'c', '\0'

    db 12 ; min
    db 19 ; max
    db 's' ; chr
    db 'j', 'b', 'p', 's', 's', 'h', 'p', 's', 'n', 'v', 'n', 'z', 's', 's', 'd', 's', 'h', 's', 's', '\0'

    db 3 ; min
    db 7 ; max
    db 'n' ; chr
    db 'n', 'p', 'q', 'n', 'n', 'v', 'n', '\0'

    db 2 ; min
    db 5 ; max
    db 'p' ; chr
    db 'n', 'p', 'p', 'c', 'v', '\0'

    db 2 ; min
    db 6 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'd', '\0'

    db 2 ; min
    db 14 ; max
    db 'c' ; chr
    db 'c', 'h', 'c', 'l', 'n', 'c', 'g', 'r', 'h', 'q', 'q', 'c', 'c', 'b', 't', 'c', 'f', 'c', '\0'

    db 6 ; min
    db 8 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', '\0'

    db 7 ; min
    db 14 ; max
    db 'n' ; chr
    db 'n', 'j', 'n', 'n', 'n', 'k', 'n', 'l', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 13 ; min
    db 17 ; max
    db 'q' ; chr
    db 'q', 'w', 'v', 'z', 'j', 'w', 'g', 'q', 'k', 's', 'h', 'x', 'q', 'l', 'q', 'f', 'q', 'h', '\0'

    db 9 ; min
    db 12 ; max
    db 'v' ; chr
    db 'v', 'b', 'v', 'c', 'v', 'v', 'q', 'v', 'p', 'v', 'v', 'v', 'v', 'v', 'b', 'v', '\0'

    db 6 ; min
    db 7 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'g', 'v', '\0'

    db 3 ; min
    db 5 ; max
    db 'v' ; chr
    db 'g', 'v', 'g', 'f', 'v', 'v', 'x', 'r', 'c', 'd', 'v', 'v', 'v', 'v', 'm', 'r', 'v', 'v', '\0'

    db 11 ; min
    db 16 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'n', 'z', 'l', 'c', 'j', 'z', 'z', 'c', 'j', 'z', 'w', 'f', 'l', '\0'

    db 1 ; min
    db 4 ; max
    db 'w' ; chr
    db 'w', 'l', 'w', 'w', 'q', 'w', 'w', 'w', 'r', '\0'

    db 15 ; min
    db 17 ; max
    db 'r' ; chr
    db 'm', 'r', 'r', 'b', 'x', 'p', 'r', 's', 'x', 'c', 'l', 'p', 'r', 'f', 's', 'l', 'c', 'd', '\0'

    db 10 ; min
    db 11 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 's', 's', 'd', 's', '\0'

    db 9 ; min
    db 13 ; max
    db 'p' ; chr
    db 'q', 'j', 'm', 'd', 'l', 'l', 'p', 't', 'p', 'p', 's', 'z', 'p', 'l', '\0'

    db 12 ; min
    db 13 ; max
    db 'n' ; chr
    db 'n', 'v', 'n', 'g', 'p', 'n', 'n', 'n', 'n', 'n', 'n', 's', 'n', '\0'

    db 8 ; min
    db 15 ; max
    db 'n' ; chr
    db 'm', 'n', 's', 'n', 'n', 'b', 'd', 'n', 'n', 'n', 'n', 'g', 'f', 'h', 'n', '\0'

    db 1 ; min
    db 18 ; max
    db 'b' ; chr
    db 'k', 'b', 'b', 'b', 'd', 'b', 'b', 'b', 'b', 'b', 'z', 'b', 'g', 'n', 'b', 'b', 'b', 'b', '\0'

    db 2 ; min
    db 8 ; max
    db 'b' ; chr
    db 'b', 'j', 'b', 'm', 'b', 'j', 'p', 'b', 'b', 'm', 'h', 'b', 's', 'x', 'b', 'b', 'v', '\0'

    db 7 ; min
    db 17 ; max
    db 'f' ; chr
    db 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'v', 'f', 'f', 'f', '\0'

    db 10 ; min
    db 13 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 't', 'q', 'q', 'q', '\0'

    db 5 ; min
    db 6 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 'r', 't', 's', '\0'

    db 9 ; min
    db 20 ; max
    db 't' ; chr
    db 't', 'x', 'p', 'l', 'r', 'p', 'h', 'b', 'w', 'n', 'v', 'n', 'v', 'k', 'f', 't', 'm', 'n', 'c', 't', '\0'

    db 6 ; min
    db 7 ; max
    db 'f' ; chr
    db 'f', 'f', 'r', 'f', 'b', 'f', 'f', 'f', 'n', 'f', '\0'

    db 10 ; min
    db 13 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 'f', 'v', 'l', 's', 's', 's', 'n', 's', 'v', '\0'

    db 4 ; min
    db 5 ; max
    db 'l' ; chr
    db 'q', 'w', 'r', 'h', 'l', 'l', 'z', 'm', 'l', 'r', 'z', '\0'

    db 12 ; min
    db 18 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'r', 'n', 'n', 'z', 'n', 'c', 'n', 'x', 'n', 'n', 'w', '\0'

    db 14 ; min
    db 15 ; max
    db 'k' ; chr
    db 'l', 's', 'r', 'k', 'n', 'l', 's', 'k', 'c', 'n', 'b', 'b', 'd', 'k', 'n', 'f', 'j', 'j', '\0'

    db 3 ; min
    db 5 ; max
    db 'z' ; chr
    db 'w', 'z', 'z', 'z', 'z', 'h', '\0'

    db 1 ; min
    db 3 ; max
    db 'j' ; chr
    db 'q', 'j', 'v', 'j', 'j', 'j', 'w', '\0'

    db 5 ; min
    db 6 ; max
    db 'n' ; chr
    db 'n', 'c', 't', 'x', 'h', 'n', '\0'

    db 8 ; min
    db 19 ; max
    db 'r' ; chr
    db 'k', 'r', 'r', 'k', 'h', 'x', 'r', 'f', 'f', 'l', 'x', 'h', 'r', 'p', 'h', 'r', 'z', 'v', 'r', 'w', '\0'

    db 9 ; min
    db 10 ; max
    db 'r' ; chr
    db 't', 'q', 'r', 'k', 'r', 'r', 'r', 's', 'r', 'v', 'r', 'r', 'q', 'r', 'r', 'p', '\0'

    db 6 ; min
    db 12 ; max
    db 'l' ; chr
    db 'l', 'd', 'l', 'n', 'x', 'r', 'l', 'l', 'l', 'v', 'l', 'k', 'l', 'l', 'k', 'l', '\0'

    db 3 ; min
    db 6 ; max
    db 'p' ; chr
    db 'j', 'p', 'w', 'w', 'z', 'p', 'c', 'p', 'p', 'w', 't', 's', 'p', 'p', '\0'

    db 12 ; min
    db 13 ; max
    db 'p' ; chr
    db 'p', 't', 'p', 't', 'p', 'p', 'p', 'k', 'p', 'z', 'p', 'p', 'g', 'p', 'p', 'p', 'd', '\0'

    db 5 ; min
    db 6 ; max
    db 'w' ; chr
    db 'w', 'w', 'w', 'w', 't', 'w', 'w', 'w', 'w', '\0'

    db 12 ; min
    db 14 ; max
    db 'p' ; chr
    db 'm', 'k', 'q', 'w', 'v', 'm', 'p', 't', 'p', 'x', 's', 'l', 'f', 'p', 'p', 'k', '\0'

    db 2 ; min
    db 5 ; max
    db 'f' ; chr
    db 'b', 'x', 'f', 'v', 'f', '\0'

    db 4 ; min
    db 7 ; max
    db 'v' ; chr
    db 'q', 'v', 'v', 'w', 'v', 'x', 'v', 'v', 'v', 'v', 'v', 'v', 'v', '\0'

    db 8 ; min
    db 9 ; max
    db 't' ; chr
    db 'm', 'x', 't', 'h', 'g', 'r', 'l', 't', 'h', '\0'

    db 5 ; min
    db 6 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 8 ; min
    db 11 ; max
    db 'q' ; chr
    db 'h', 'q', 'q', 'f', 'q', 'q', 'q', 'n', 'q', 'q', 'w', '\0'

    db 11 ; min
    db 14 ; max
    db 'w' ; chr
    db 'w', 'f', 'w', 'w', 'w', 's', 'w', 'w', 't', 'w', 'v', 'w', 'w', 'g', 'w', 'j', 'w', 'w', '\0'

    db 10 ; min
    db 12 ; max
    db 'n' ; chr
    db 'q', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'p', 'r', 'n', 'n', 'n', 'n', '\0'

    db 4 ; min
    db 6 ; max
    db 'g' ; chr
    db 'f', 'd', 'v', 'g', 'f', 'h', 'g', 'j', 'z', 'g', 'g', '\0'

    db 3 ; min
    db 4 ; max
    db 'p' ; chr
    db 'h', 'd', 'p', 'p', '\0'

    db 2 ; min
    db 5 ; max
    db 'l' ; chr
    db 'l', 'f', 'l', 'l', 'l', 'l', 'l', 'l', '\0'

    db 13 ; min
    db 17 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'j', 'z', 'z', 'z', 'z', 'z', 'x', 'z', 'g', 'z', 'z', 'z', '\0'

    db 12 ; min
    db 15 ; max
    db 'm' ; chr
    db 'l', 'z', 'm', 'x', 'c', 'r', 'k', 'q', 'f', 'c', 'v', 'm', 'b', 'b', 'm', 't', 'x', 'r', 's', '\0'

    db 14 ; min
    db 15 ; max
    db 'd' ; chr
    db 'n', 'j', 'd', 'w', 'b', 'b', 'h', 'b', 'z', 'v', 't', 's', 'd', 't', 'v', 'n', '\0'

    db 7 ; min
    db 8 ; max
    db 'x' ; chr
    db 'x', 'm', 'x', 'r', 'x', 'x', 'm', 'z', '\0'

    db 8 ; min
    db 15 ; max
    db 'p' ; chr
    db 'g', 'f', 'z', 'n', 'j', 'b', 'f', 'b', 'q', 'p', 'b', 'p', 'm', 's', 'p', 'p', '\0'

    db 9 ; min
    db 20 ; max
    db 'z' ; chr
    db 'w', 'd', 'r', 'z', 'l', 'm', 'l', 't', 'k', 'd', 'd', 'z', 'l', 'q', 'g', 'z', 's', 'v', 'p', 'z', '\0'

    db 5 ; min
    db 6 ; max
    db 'f' ; chr
    db 'q', 'q', 'g', 'x', 'p', 'z', 'b', 'n', 'b', '\0'

    db 7 ; min
    db 9 ; max
    db 'l' ; chr
    db 'j', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'c', '\0'

    db 1 ; min
    db 6 ; max
    db 'x' ; chr
    db 'x', 'm', 'b', 'x', 'x', 'j', 'x', 'd', '\0'

    db 4 ; min
    db 5 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'd', 'p', '\0'

    db 5 ; min
    db 6 ; max
    db 'f' ; chr
    db 'f', 'f', 'f', 'f', 'z', 'f', 'f', '\0'

    db 2 ; min
    db 4 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'x', 'r', '\0'

    db 3 ; min
    db 6 ; max
    db 's' ; chr
    db 'v', 'p', 's', 'b', 's', 'v', '\0'

    db 7 ; min
    db 10 ; max
    db 'c' ; chr
    db 's', 'p', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'l', '\0'

    db 3 ; min
    db 6 ; max
    db 'h' ; chr
    db 's', 's', 'h', 'h', 'k', 'h', 'c', 'r', '\0'

    db 10 ; min
    db 15 ; max
    db 'f' ; chr
    db 'f', 'n', 'f', 'j', 'f', 'p', 'f', 'm', 'f', 'r', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'j', '\0'

    db 15 ; min
    db 16 ; max
    db 'z' ; chr
    db 't', 'z', 'z', 'z', 'g', 's', 'h', 'v', 'm', 'd', 'g', 'z', 'n', 'd', 'g', 's', '\0'

    db 5 ; min
    db 15 ; max
    db 's' ; chr
    db 's', 'k', 's', 's', 's', 'q', 'c', 's', 'b', 'j', 'd', 's', 'm', 'v', 'f', 'x', 't', '\0'

    db 8 ; min
    db 9 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'p', 'j', 'r', 'p', 'v', 'p', '\0'

    db 8 ; min
    db 12 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'g', 'v', 'v', 'v', 'v', 'v', 'v', '\0'

    db 2 ; min
    db 3 ; max
    db 'k' ; chr
    db 'k', 'z', 'k', 'k', '\0'

    db 13 ; min
    db 17 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 'r', 't', '\0'

    db 6 ; min
    db 10 ; max
    db 'l' ; chr
    db 's', 'w', 't', 'v', 'l', 'w', 'r', 'l', 's', 'l', 'g', 'h', '\0'

    db 1 ; min
    db 3 ; max
    db 'r' ; chr
    db 'w', 'r', 'n', 'r', '\0'

    db 3 ; min
    db 4 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'f', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'q', 'k', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 8 ; min
    db 9 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'f', 'k', 'k', 'z', 'k', '\0'

    db 5 ; min
    db 9 ; max
    db 'p' ; chr
    db 'v', 'p', 'l', 'b', 'w', 'p', 'p', 'w', 'f', 'g', 'f', 'p', 'c', 'h', 'j', 'l', 'c', 'f', '\0'

    db 1 ; min
    db 2 ; max
    db 't' ; chr
    db 's', 'k', 't', 't', 'r', 't', 't', 's', '\0'

    db 2 ; min
    db 6 ; max
    db 'h' ; chr
    db 'b', 'h', 'q', 'z', 'n', 'h', '\0'

    db 13 ; min
    db 14 ; max
    db 'k' ; chr
    db 'k', 'c', 's', 'k', 'm', 'k', 'k', 'k', 'w', 'l', 'p', 'q', 'q', 'c', 'k', '\0'

    db 14 ; min
    db 15 ; max
    db 's' ; chr
    db 'j', 's', 's', 'h', 'd', 's', 's', 'x', 's', 'q', 's', 's', 'j', 'k', 'm', '\0'

    db 5 ; min
    db 13 ; max
    db 't' ; chr
    db 't', 'g', 'c', 'h', 'h', 'z', 'c', 't', 't', 'x', 'l', 't', 't', 'w', 't', 'k', 't', '\0'

    db 5 ; min
    db 10 ; max
    db 'l' ; chr
    db 'l', 's', 'l', 'n', 'b', 'l', 'l', 'm', 'l', 'w', '\0'

    db 3 ; min
    db 4 ; max
    db 'k' ; chr
    db 'x', 'k', 'q', 'q', 'f', '\0'

    db 2 ; min
    db 11 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'v', 'q', 'p', 'p', 'j', 'p', 'x', '\0'

    db 6 ; min
    db 12 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'j', 'h', 'h', 'h', '\0'

    db 4 ; min
    db 6 ; max
    db 'k' ; chr
    db 'f', 'k', 'p', 'm', 'n', 'f', 'h', 'r', 'm', '\0'

    db 8 ; min
    db 11 ; max
    db 't' ; chr
    db 'x', 'w', 'z', 'g', 't', 'l', 'v', 's', 'w', 'r', 't', '\0'

    db 4 ; min
    db 11 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'd', 'r', 'n', 'r', 'r', 'r', 'r', 'b', 'g', '\0'

    db 5 ; min
    db 7 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'h', 'k', '\0'

    db 1 ; min
    db 6 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'k', 'l', '\0'

    db 18 ; min
    db 19 ; max
    db 'f' ; chr
    db 'f', 'r', 't', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'x', 'm', 'f', 'f', 'f', 'd', 'v', 'f', 'c', '\0'

    db 5 ; min
    db 7 ; max
    db 'h' ; chr
    db 'n', 'z', 'h', 'h', 'n', 'g', 'r', 'h', 'h', 'h', 'h', '\0'

    db 7 ; min
    db 8 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 's', 'j', 'j', 'j', 'j', 'n', 'j', 'j', 'j', 'j', 'j', '\0'

    db 6 ; min
    db 7 ; max
    db 'v' ; chr
    db 'v', 'v', 'k', 'b', 'v', 'r', 'q', 'v', 'g', '\0'

    db 4 ; min
    db 10 ; max
    db 's' ; chr
    db 's', 's', 's', 'g', 's', 's', 's', 'x', 'x', 's', 's', 's', 's', '\0'

    db 1 ; min
    db 3 ; max
    db 'h' ; chr
    db 'h', 'h', 'g', 'r', 'w', 'f', 'n', '\0'

    db 1 ; min
    db 5 ; max
    db 'c' ; chr
    db 'c', 'c', 'j', 'g', 'c', 'b', 'c', 'c', '\0'

    db 7 ; min
    db 10 ; max
    db 'p' ; chr
    db 'c', 'p', 'n', 'n', 'p', 'g', 'p', 'p', 'r', 'p', 'p', 'p', 'p', 'x', 'p', 'j', 'p', '\0'

    db 9 ; min
    db 10 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'c', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', '\0'

    db 10 ; min
    db 12 ; max
    db 'c' ; chr
    db 'c', 'c', 'f', 'c', 'z', 'q', 'c', 'g', 'c', 'c', 'd', 'c', 'f', '\0'

    db 3 ; min
    db 5 ; max
    db 'j' ; chr
    db 'v', 'w', 'j', 'd', 'v', '\0'

    db 10 ; min
    db 13 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'p', 'b', 'l', 'v', 'c', 'l', 'n', 'l', 'w', 'l', 'l', 'x', '\0'

    db 3 ; min
    db 4 ; max
    db 'n' ; chr
    db 'n', 'n', 'c', 't', 'n', 'p', '\0'

    db 4 ; min
    db 5 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'm', 'z', 'z', 'z', 'z', '\0'

    db 4 ; min
    db 5 ; max
    db 's' ; chr
    db 'm', 'c', 's', 's', 'l', 'b', 'g', 's', 't', '\0'

    db 7 ; min
    db 9 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'd', 'b', 'p', 'w', 'm', 'p', 'p', 'p', 'k', 'p', 'p', 's', 'p', '\0'

    db 7 ; min
    db 13 ; max
    db 'd' ; chr
    db 'v', 'd', 'n', 'm', 'p', 'v', 'd', 'v', 't', 'v', 'd', 'c', 'd', 'd', 'q', 'k', '\0'

    db 4 ; min
    db 6 ; max
    db 'x' ; chr
    db 't', 'p', 'c', 'x', 'l', 'x', '\0'

    db 2 ; min
    db 4 ; max
    db 'c' ; chr
    db 'c', 'm', 'c', 'q', 'c', 'r', 'c', 'c', 'c', 'c', 'l', 'c', 'c', 'x', '\0'

    db 6 ; min
    db 8 ; max
    db 'k' ; chr
    db 'k', 'z', 'v', 'p', 'v', 'h', 'l', 'w', 'd', 'r', 'h', 't', 'c', 's', 'l', '\0'

    db 6 ; min
    db 9 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', '\0'

    db 3 ; min
    db 15 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', '\0'

    db 7 ; min
    db 9 ; max
    db 'f' ; chr
    db 'f', 'p', 'f', 'f', 'v', 'm', 'd', 'j', 'j', 'f', 'f', 'x', 'f', '\0'

    db 3 ; min
    db 4 ; max
    db 'z' ; chr
    db 'z', 'z', 'q', 'z', 'g', '\0'

    db 2 ; min
    db 3 ; max
    db 'p' ; chr
    db 'k', 'r', 'p', 'p', '\0'

    db 9 ; min
    db 10 ; max
    db 'v' ; chr
    db 'c', 'j', 'v', 'q', 'z', 'v', 'l', 'v', 'x', 'v', 'v', 'v', '\0'

    db 11 ; min
    db 17 ; max
    db 'r' ; chr
    db 'j', 'r', 'n', 'r', 'r', 'r', 'k', 'r', 'l', 'z', 'q', 'r', 'j', 'r', 'r', 'r', 'r', 'd', 'j', '\0'

    db 11 ; min
    db 12 ; max
    db 'q' ; chr
    db 'h', 'z', 'x', 't', 'k', 's', 'q', 'm', 't', 'j', 'b', 'q', '\0'

    db 2 ; min
    db 15 ; max
    db 'j' ; chr
    db 'l', 'x', 'r', 'l', 'v', 'n', 'q', 'k', 'b', 'n', 'm', 'k', 'n', 'f', 'd', 'm', 'l', '\0'

    db 9 ; min
    db 10 ; max
    db 'x' ; chr
    db 'x', 's', 'f', 'z', 'm', 'g', 'l', 'g', 'l', 'x', 'r', 't', 'x', 'n', 'w', 'w', 'x', 'r', '\0'

    db 2 ; min
    db 3 ; max
    db 't' ; chr
    db 't', 'g', 't', 'l', 'h', 's', 't', 'c', 'f', 't', '\0'

    db 19 ; min
    db 20 ; max
    db 'q' ; chr
    db 'p', 'q', 'f', 'd', 'q', 'q', 'q', 'v', 'x', 's', 'q', 'q', 'q', 'q', 't', 'r', 'x', 's', 'q', 'p', '\0'

    db 9 ; min
    db 10 ; max
    db 'q' ; chr
    db 'l', 'k', 'j', 'x', 'd', 'q', 'q', 'q', 'h', 'q', 'q', 'w', '\0'

    db 3 ; min
    db 4 ; max
    db 'w' ; chr
    db 'h', 'w', 'f', 'd', '\0'

    db 1 ; min
    db 3 ; max
    db 'g' ; chr
    db 'j', 'g', 'j', 'r', 'g', 'j', 'g', 'w', '\0'

    db 10 ; min
    db 11 ; max
    db 'r' ; chr
    db 'l', 'r', 'q', 'r', 'f', 'd', 't', 't', 'r', 'f', 'r', '\0'

    db 15 ; min
    db 16 ; max
    db 'k' ; chr
    db 'h', 'k', 'k', 'k', 'k', 'k', 's', 'k', 'k', 'k', 'k', 'f', 'k', 'k', 'k', 'j', '\0'

    db 1 ; min
    db 4 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 's', '\0'

    db 18 ; min
    db 20 ; max
    db 'b' ; chr
    db 'v', 'q', 'w', 'x', 'b', 'b', 'w', 'b', 'b', 'k', 's', 'b', 'x', 'c', 't', 'k', 'l', 'b', 'b', 'b', '\0'

    db 1 ; min
    db 11 ; max
    db 'w' ; chr
    db 'c', 'l', 'z', 'r', 'd', 'z', 'w', 'h', 'l', 'k', 'w', 'b', 'g', 'j', 'w', 'w', 'w', 'w', 'h', '\0'

    db 5 ; min
    db 12 ; max
    db 'b' ; chr
    db 'c', 'j', 'b', 'v', 'n', 'b', 't', 'v', 'h', 'l', 'p', 'z', '\0'

    db 17 ; min
    db 19 ; max
    db 's' ; chr
    db 's', 's', 'x', 's', 's', 's', 'p', 'j', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 'h', 's', '\0'

    db 2 ; min
    db 8 ; max
    db 'q' ; chr
    db 'w', 'r', 'j', 'b', 'v', 'q', 'l', 'f', 'q', 'q', '\0'

    db 7 ; min
    db 10 ; max
    db 'v' ; chr
    db 'x', 'g', 'n', 'z', 'v', 's', 'v', 'j', 'j', 'z', 't', 'v', '\0'

    db 2 ; min
    db 6 ; max
    db 'd' ; chr
    db 'g', 'g', 'j', 'g', 'j', 'd', 's', 'd', 's', 'b', 'w', 'l', '\0'

    db 3 ; min
    db 4 ; max
    db 'w' ; chr
    db 'w', 'w', 'c', 'w', 'w', 'w', 'w', '\0'

    db 9 ; min
    db 10 ; max
    db 'l' ; chr
    db 'l', 'r', 'l', 'l', 'l', 'l', 'l', 'l', 'k', 'l', 'n', '\0'

    db 9 ; min
    db 11 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'l', 'd', 't', 'd', 'd', '\0'

    db 2 ; min
    db 6 ; max
    db 'g' ; chr
    db 'w', 'r', 'g', 'g', 'c', 'g', 'w', '\0'

    db 2 ; min
    db 6 ; max
    db 't' ; chr
    db 's', 't', 't', 'm', 't', 't', 'v', 'k', 'b', 'd', 'f', 'h', 'r', '\0'

    db 2 ; min
    db 4 ; max
    db 'h' ; chr
    db 'j', 'h', 'm', 'x', '\0'

    db 9 ; min
    db 11 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 6 ; min
    db 18 ; max
    db 's' ; chr
    db 'h', 's', 'n', 's', 'q', 's', 'j', 's', 'j', 'j', 'c', 't', 'p', 'l', 't', 'k', 'm', 's', '\0'

    db 12 ; min
    db 13 ; max
    db 't' ; chr
    db 'w', 'c', 't', 'j', 'k', 's', 't', 'v', 'x', 'w', 'g', 'g', 'v', 'q', '\0'

    db 1 ; min
    db 11 ; max
    db 'l' ; chr
    db 'l', 'f', 'r', 'z', 't', 'k', 'n', 's', 'g', 'n', 'd', 'v', 'l', 'n', 'q', 'b', 's', 'q', '\0'

    db 3 ; min
    db 4 ; max
    db 'w' ; chr
    db 'w', 'w', 'f', 's', 'w', 'w', '\0'

    db 6 ; min
    db 7 ; max
    db 'w' ; chr
    db 'p', 'l', 'l', 'w', 'l', 'w', 'm', '\0'

    db 2 ; min
    db 11 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'w', 'j', 'j', 'l', 'j', 'j', 'c', '\0'

    db 14 ; min
    db 15 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'g', 'p', 'p', 'p', 'm', 'p', 't', 'p', 'p', 'c', 'p', 'z', 'p', '\0'

    db 13 ; min
    db 14 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'n', 'q', 'l', 'l', '\0'

    db 12 ; min
    db 13 ; max
    db 'w' ; chr
    db 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'c', 'x', '\0'

    db 6 ; min
    db 7 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'f', 'c', 'c', 'c', 'q', '\0'

    db 6 ; min
    db 13 ; max
    db 'j' ; chr
    db 'r', 's', 'r', 'k', 'q', 'b', 'j', 'h', 'm', 'z', 'j', 'w', 'p', 'c', 'j', 'z', 'n', 'z', '\0'

    db 3 ; min
    db 4 ; max
    db 'd' ; chr
    db 'j', 'd', 'd', 'b', '\0'

    db 6 ; min
    db 12 ; max
    db 'r' ; chr
    db 'j', 'r', 'r', 'r', 'r', 'j', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', '\0'

    db 5 ; min
    db 6 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 'r', 't', '\0'

    db 7 ; min
    db 19 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'c', 'v', 'n', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 't', 'q', 's', 'q', 'q', '\0'

    db 6 ; min
    db 8 ; max
    db 'w' ; chr
    db 'x', 'g', 'w', 'z', 'c', 'w', 'v', 'k', 'v', 's', '\0'

    db 8 ; min
    db 15 ; max
    db 'h' ; chr
    db 'x', 'n', 'p', 'h', 'x', 'h', 't', 'r', 'd', 's', 't', 'n', 'p', 'h', 'h', 'v', 'h', 'w', '\0'

    db 1 ; min
    db 5 ; max
    db 'v' ; chr
    db 'k', 'v', 'v', 'v', 'v', 'v', '\0'

    db 4 ; min
    db 6 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'm', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', '\0'

    db 1 ; min
    db 3 ; max
    db 'j' ; chr
    db 'q', 'j', 'j', 'j', '\0'

    db 4 ; min
    db 5 ; max
    db 'j' ; chr
    db 'h', 'f', 'z', 'j', 'j', '\0'

    db 6 ; min
    db 7 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'c', 'x', 'v', 'v', 'v', '\0'

    db 4 ; min
    db 13 ; max
    db 'f' ; chr
    db 'v', 's', 'r', 'f', 'c', 's', 'v', 'v', 's', 'z', 'p', 'f', 'f', 'm', '\0'

    db 7 ; min
    db 8 ; max
    db 'h' ; chr
    db 'z', 'l', 'j', 'n', 'd', 'n', 'c', 's', 'h', 'n', 'k', 'n', 'z', 'b', 'h', 'b', 'w', 'q', 'h', 'l', '\0'

    db 7 ; min
    db 10 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'g', 'c', 'g', 'g', 'g', 'g', 'g', '\0'

    db 10 ; min
    db 13 ; max
    db 'p' ; chr
    db 'p', 'p', 'f', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'k', 'l', 'p', 's', 'p', 'p', 'p', 'z', 'p', '\0'

    db 3 ; min
    db 4 ; max
    db 'l' ; chr
    db 's', 'p', 'v', 'w', 'l', '\0'

    db 4 ; min
    db 5 ; max
    db 'q' ; chr
    db 'c', 'r', 'q', 'q', 'n', 't', 'b', 'v', 'q', 'k', 'z', 'w', 'm', 'v', 'q', 'p', 'b', 'x', '\0'

    db 6 ; min
    db 10 ; max
    db 'q' ; chr
    db 'b', 'q', 'q', 'q', 'j', 'q', 'q', 's', 'd', 'k', '\0'

    db 14 ; min
    db 15 ; max
    db 'k' ; chr
    db 'b', 'b', 'l', 'x', 'v', 's', 'p', 'k', 'q', 'm', 'r', 'n', 'd', 'f', 'k', 'k', 'p', '\0'

    db 1 ; min
    db 3 ; max
    db 'b' ; chr
    db 'b', 'b', 'd', 'b', '\0'

    db 14 ; min
    db 19 ; max
    db 'q' ; chr
    db 'j', 'w', 't', 't', 'k', 'v', 'n', 'r', 'b', 'f', 's', 't', 'q', 'l', 's', 'r', 'b', 't', 'q', '\0'

    db 18 ; min
    db 19 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'n', 'f', '\0'

    db 4 ; min
    db 11 ; max
    db 'd' ; chr
    db 'r', 'd', 'k', 'd', 'n', 'p', 'd', 'v', 'j', 'j', 't', 'x', '\0'

    db 11 ; min
    db 12 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'v', 'k', 'v', 'v', 'v', 'n', 'r', '\0'

    db 10 ; min
    db 12 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'd', 'd', 'k', 'j', '\0'

    db 4 ; min
    db 5 ; max
    db 'l' ; chr
    db 'x', 'l', 'l', 'l', 'l', 'p', 'l', 'k', 's', 'n', '\0'

    db 10 ; min
    db 12 ; max
    db 'x' ; chr
    db 'p', 'x', 'g', 'x', 'x', 'x', 'x', 'x', 'x', 'k', 'x', 'n', 'x', '\0'

    db 13 ; min
    db 16 ; max
    db 'l' ; chr
    db 's', 'j', 'l', 'l', 'l', 'f', 'r', 'k', 'b', 'l', 'c', 'c', 'j', 'r', 'l', 'l', 'q', '\0'

    db 4 ; min
    db 6 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 't', 'l', 'p', 'p', 'p', '\0'

    db 4 ; min
    db 14 ; max
    db 'v' ; chr
    db 'n', 'v', 'v', 'v', 'v', 'v', 'w', 'v', 'v', 's', 'v', 'p', 'v', 'r', 'v', 'v', 'v', 'q', '\0'

    db 8 ; min
    db 9 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'k', 'v', 'v', 'v', 'd', 'v', 'v', 'v', 'v', 'v', 'v', '\0'

    db 12 ; min
    db 16 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'l', 'z', 'z', 'z', 'z', 'k', 'z', 'm', '\0'

    db 4 ; min
    db 7 ; max
    db 's' ; chr
    db 'z', 's', 'f', 's', 'j', 's', 'p', '\0'

    db 8 ; min
    db 17 ; max
    db 'v' ; chr
    db 'v', 'v', 'm', 'l', 'v', 'v', 'v', 'v', 't', 'x', 'v', 'd', 'v', 's', 'v', 'v', 'q', '\0'

    db 17 ; min
    db 19 ; max
    db 't' ; chr
    db 't', 'g', 't', 'g', 'g', 'l', 'g', 't', 'r', 't', 't', 't', 'd', 'x', 't', 't', 'z', 't', 'l', '\0'

    db 8 ; min
    db 12 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'h', '\0'

    db 1 ; min
    db 8 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 's', 'p', 'f', 'p', 'j', 'p', 'p', 'p', 'p', 'z', 'p', 'n', 'p', 'p', 'p', 'p', '\0'

    db 3 ; min
    db 4 ; max
    db 'f' ; chr
    db 'f', 'f', 'f', 'n', 'f', '\0'

    db 8 ; min
    db 9 ; max
    db 'b' ; chr
    db 'j', 'b', 'b', 'b', 'f', 's', 'b', 'm', 'g', 'b', 'b', 'b', '\0'

    db 1 ; min
    db 9 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'g', 'h', 'q', 'r', 'h', 'h', 'h', 'h', 'p', '\0'

    db 4 ; min
    db 7 ; max
    db 'r' ; chr
    db 'r', 'v', 'r', 't', 'g', 'r', 'r', '\0'

    db 2 ; min
    db 4 ; max
    db 'g' ; chr
    db 'g', 'g', 'k', 'n', 'k', '\0'

    db 5 ; min
    db 6 ; max
    db 'w' ; chr
    db 'c', 'w', 'w', 'w', 'w', 'w', '\0'

    db 6 ; min
    db 7 ; max
    db 'q' ; chr
    db 'v', 'q', 't', 'q', 'q', 'k', 'q', '\0'

    db 6 ; min
    db 7 ; max
    db 'm' ; chr
    db 'm', 'r', 'q', 'b', 'm', 'r', 'p', '\0'

    db 7 ; min
    db 8 ; max
    db 'x' ; chr
    db 'g', 'm', 'x', 'x', 'x', 'm', 'x', 'd', 'x', '\0'

    db 1 ; min
    db 4 ; max
    db 'd' ; chr
    db 's', 'x', 'd', 'd', 'r', 'd', 'd', 'c', 'p', '\0'

    db 8 ; min
    db 9 ; max
    db 'b' ; chr
    db 'b', 'm', 'b', 'b', 'b', 'b', 'b', 'b', 'm', '\0'

    db 11 ; min
    db 13 ; max
    db 'g' ; chr
    db 'g', 'p', 'l', 'g', 'g', 'g', 'z', 'g', 'g', 'g', 'd', 'g', 'g', '\0'

    db 3 ; min
    db 4 ; max
    db 'l' ; chr
    db 'l', 'd', 'f', 'f', 'l', 'x', '\0'

    db 9 ; min
    db 11 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'n', 'k', 'k', 'm', 'n', 'k', 'c', 'c', '\0'

    db 9 ; min
    db 13 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'p', 'x', 'g', 'g', 'g', 'g', 'g', 'z', 'g', 'g', '\0'

    db 19 ; min
    db 20 ; max
    db 'j' ; chr
    db 'l', 'f', 'q', 'j', 'd', 'q', 'j', 'd', 'd', 'c', 't', 'c', 'j', 'n', 'j', 'z', 's', 'v', 'j', 'p', '\0'

    db 7 ; min
    db 9 ; max
    db 'z' ; chr
    db 'd', 'z', 'r', 'g', 'd', 'c', 'z', 'b', 'z', '\0'

    db 1 ; min
    db 5 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'c', 'p', '\0'

    db 11 ; min
    db 14 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'm', 'b', 'b', 'b', 'b', 'b', '\0'

    db 8 ; min
    db 19 ; max
    db 'j' ; chr
    db 'x', 'j', 'v', 'd', 'r', 'j', 'w', 'j', 'j', 't', 'j', 'f', 'd', 'c', 'g', 'j', 'b', 'q', 'g', '\0'

    db 15 ; min
    db 16 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'k', 'b', 'b', '\0'

    db 2 ; min
    db 13 ; max
    db 'p' ; chr
    db 'p', 'g', 'p', 'p', 'p', 'p', 'w', 'p', 'p', 'p', 'x', 'p', 'p', 'p', 'p', 'p', 'p', 'd', '\0'

    db 8 ; min
    db 11 ; max
    db 'x' ; chr
    db 'm', 'd', 'p', 'v', 'k', 'q', 's', 'x', 'v', 'z', 'x', 'g', 't', 'v', 'b', '\0'

    db 14 ; min
    db 17 ; max
    db 'w' ; chr
    db 'w', 'z', 'f', 'w', 'v', 'w', 'w', 'w', 'w', 'w', 'j', 'w', 'w', 'r', 'b', 'w', 'w', '\0'

    db 1 ; min
    db 4 ; max
    db 'v' ; chr
    db 'p', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', '\0'

    db 10 ; min
    db 11 ; max
    db 'j' ; chr
    db 'j', 'r', 'j', 'n', 'l', 'c', 'j', 'n', 'j', 'd', 'm', 'z', 'x', 'j', 't', '\0'

    db 10 ; min
    db 11 ; max
    db 'z' ; chr
    db 'g', 'g', 'z', 'z', 'z', 'q', 'z', 'z', 'z', 'z', 'v', 'n', '\0'

    db 3 ; min
    db 6 ; max
    db 'q' ; chr
    db 'b', 's', 'j', 'b', 's', 'h', '\0'

    db 8 ; min
    db 11 ; max
    db 'c' ; chr
    db 'r', 'l', 'r', 'x', 'x', 'c', 'n', 'v', 'q', 'c', 'c', 'j', 'm', 'h', 'n', 'h', '\0'

    db 6 ; min
    db 14 ; max
    db 'l' ; chr
    db 's', 'l', 'l', 'q', 'r', 'l', 'l', 'h', 'f', 'l', 'n', 'j', 'x', 'l', '\0'

    db 1 ; min
    db 10 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'd', 'j', 'j', '\0'

    db 11 ; min
    db 13 ; max
    db 'q' ; chr
    db 'r', 'q', 'q', 'x', 'q', 'j', 'b', 'h', 'g', 's', 'q', 'q', 'q', '\0'

    db 7 ; min
    db 8 ; max
    db 'p' ; chr
    db 'p', 'p', 'n', 'h', 'w', 'p', 'k', 'k', 'p', 'p', '\0'

    db 5 ; min
    db 7 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'q', 'h', 'h', '\0'

    db 1 ; min
    db 3 ; max
    db 'n' ; chr
    db 'n', 'n', 'g', 'n', '\0'

    db 4 ; min
    db 14 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'm', 'z', 'z', 'z', 'l', 'z', 'z', 'z', 'z', '\0'

    db 3 ; min
    db 4 ; max
    db 'v' ; chr
    db 't', 'r', 'v', 'v', 'p', 'v', 'f', 'b', 'k', 'p', 'g', 's', 't', 'q', 't', 'q', '\0'

    db 8 ; min
    db 13 ; max
    db 'j' ; chr
    db 'h', 's', 'k', 'z', 'q', 'p', 'x', 'j', 'j', 'f', 'j', 'q', 'm', 'j', 'n', 'p', 'q', '\0'

    db 1 ; min
    db 4 ; max
    db 'n' ; chr
    db 'j', 'n', 'n', 'n', 'k', 'n', '\0'

    db 2 ; min
    db 8 ; max
    db 'z' ; chr
    db 'z', 'x', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'z', '\0'

    db 13 ; min
    db 16 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'z', 'g', 'v', 'g', 'x', 'g', 'g', 'g', 'g', 'g', '\0'

    db 3 ; min
    db 6 ; max
    db 'c' ; chr
    db 'c', 'k', 's', 'n', 'b', 'p', 'j', 't', 'c', '\0'

    db 7 ; min
    db 11 ; max
    db 'g' ; chr
    db 'g', 'h', 'g', 'g', 'q', 'q', 'g', 'c', 'g', 'v', 'w', '\0'

    db 7 ; min
    db 16 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'h', 's', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'j', 'h', 'h', 'h', '\0'

    db 3 ; min
    db 4 ; max
    db 'p' ; chr
    db 'v', 'h', 'p', 'q', '\0'

    db 2 ; min
    db 8 ; max
    db 'c' ; chr
    db 'r', 'c', 'c', 'c', 'b', 'g', 'c', 'm', 'g', 'g', '\0'

    db 6 ; min
    db 13 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'q', 'd', 'd', 'j', 'd', 'z', 'g', 'd', 'w', 'q', 'd', 'p', 'd', '\0'

    db 4 ; min
    db 5 ; max
    db 'z' ; chr
    db 'd', 'x', 'j', 'z', 'z', 'z', 'p', 'j', 's', 'q', 'w', 'z', 'm', 'q', 'z', 'b', 'z', 'q', '\0'

    db 1 ; min
    db 2 ; max
    db 'd' ; chr
    db 'd', 'h', 'l', 'z', 'd', 'w', 'r', 'q', '\0'

    db 1 ; min
    db 5 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', '\0'

    db 7 ; min
    db 9 ; max
    db 'w' ; chr
    db 'w', 'd', 'w', 'l', 'h', 'l', 'p', 'w', 'w', 'w', 'w', 'w', '\0'

    db 12 ; min
    db 16 ; max
    db 'f' ; chr
    db 'f', 'f', 'd', 'f', 'h', 'f', 's', 'f', 'x', 'f', 'p', 'n', 'r', 'f', 'v', 'f', '\0'

    db 9 ; min
    db 11 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'v', 'q', 'r', 'q', 'q', 'q', 'q', '\0'

    db 6 ; min
    db 8 ; max
    db 'j' ; chr
    db 'q', 'r', 'j', 'j', 'j', 'j', 'v', 'n', '\0'

    db 4 ; min
    db 6 ; max
    db 'w' ; chr
    db 'q', 'w', 'w', 'w', 'd', 's', '\0'

    db 13 ; min
    db 14 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'v', 'n', '\0'

    db 5 ; min
    db 6 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'g', 'c', '\0'

    db 13 ; min
    db 14 ; max
    db 's' ; chr
    db 'q', 'g', 's', 'd', 'b', 's', 'k', 'l', 'k', 'x', 's', 'x', 'l', 's', 'h', 'z', 's', '\0'

    db 11 ; min
    db 16 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'p', 'm', '\0'

    db 5 ; min
    db 6 ; max
    db 'r' ; chr
    db 'r', 'r', 'j', 'r', 'r', 'r', '\0'

    db 3 ; min
    db 9 ; max
    db 'm' ; chr
    db 'm', 'm', 'j', 'n', 'k', 'm', 'm', 'm', 'n', 'm', 'm', 'm', 'm', 'm', 'm', 'n', '\0'

    db 8 ; min
    db 17 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'h', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'w', 'x', 'x', 'x', '\0'

    db 1 ; min
    db 4 ; max
    db 'v' ; chr
    db 'v', 'l', 'g', 'v', 'v', 'l', 'l', 'j', 'x', 'w', 'q', '\0'

    db 2 ; min
    db 12 ; max
    db 'r' ; chr
    db 'n', 'f', 'v', 'x', 'w', 'w', 'k', 'h', 'z', 's', 'z', 'r', 'f', 'w', 'r', 'b', '\0'

    db 10 ; min
    db 13 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 't', 'j', 'r', 'j', 'q', 'j', 'j', '\0'

    db 3 ; min
    db 5 ; max
    db 'g' ; chr
    db 'l', 'r', 'g', 'g', 'g', '\0'

    db 6 ; min
    db 10 ; max
    db 'm' ; chr
    db 'c', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'd', '\0'

    db 4 ; min
    db 6 ; max
    db 'c' ; chr
    db 'd', 'c', 'c', 't', 'c', 'c', '\0'

    db 16 ; min
    db 17 ; max
    db 'r' ; chr
    db 'r', 'n', 'z', 'k', 'n', 'q', 'r', 'r', 'b', 's', 'r', 'v', 's', 'r', 'g', 'r', 'r', 'c', 'r', '\0'

    db 2 ; min
    db 3 ; max
    db 'j' ; chr
    db 'd', 'j', 'j', 'r', '\0'

    db 6 ; min
    db 15 ; max
    db 'q' ; chr
    db 'q', 'q', 'n', 'm', 'q', 'x', 'q', 'q', 'b', 's', 'q', 'q', 'q', 'q', 'k', 'q', '\0'

    db 3 ; min
    db 5 ; max
    db 'h' ; chr
    db 'k', 'h', 'h', 'r', 'c', 'p', 'v', 'z', 'z', '\0'

    db 5 ; min
    db 6 ; max
    db 'h' ; chr
    db 'q', 'c', 'j', 'm', 'h', 'h', 'v', 't', 'h', 'f', 'n', '\0'

    db 15 ; min
    db 16 ; max
    db 'd' ; chr
    db 'k', 'd', 'j', 't', 'l', 'm', 'l', 'd', 'h', 'd', 'r', 'd', 'd', 'd', 'd', 'd', '\0'

    db 10 ; min
    db 13 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 's', 's', 'q', 's', 's', 's', 's', 's', 'k', 's', 's', '\0'

    db 5 ; min
    db 8 ; max
    db 'c' ; chr
    db 'p', 'c', 'c', 'r', 'w', 'b', 'v', 'j', 'c', 'c', 'c', 'f', 'v', 't', '\0'

    db 9 ; min
    db 10 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 't', 'j', 'j', 'j', '\0'

    db 5 ; min
    db 9 ; max
    db 'r' ; chr
    db 'w', 'b', 'f', 's', 'r', 'l', 'k', 't', 'c', 'x', 'h', 's', 'k', 'h', 'n', 'v', 'k', 'q', 'x', 'l', '\0'

    db 13 ; min
    db 15 ; max
    db 'x' ; chr
    db 'w', 'j', 'p', 'x', 't', 'b', 'x', 'x', 'x', 'g', 'x', 'x', 'x', 'j', 'x', '\0'

    db 6 ; min
    db 7 ; max
    db 'r' ; chr
    db 'f', 'z', 'l', 'c', 's', 'r', 'c', '\0'

    db 13 ; min
    db 17 ; max
    db 'b' ; chr
    db 'n', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'f', 'b', 'v', 'b', 'b', 'b', 'b', 'b', 'z', '\0'

    db 7 ; min
    db 19 ; max
    db 'r' ; chr
    db 'v', 'f', 'w', 'r', 'v', 'b', 'x', 'r', 'q', 'w', 'r', 'n', 'd', 'd', 'm', 'r', 'd', 's', 'r', '\0'

    db 4 ; min
    db 18 ; max
    db 'q' ; chr
    db 'q', 'd', 'q', 'd', 'v', 'q', 'm', 'v', 'p', 'l', 'w', 'f', 'q', 'x', 'w', 'm', 'p', 'h', 'x', '\0'

    db 15 ; min
    db 17 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'q', 'g', 'g', '\0'

    db 3 ; min
    db 6 ; max
    db 'z' ; chr
    db 'z', 'z', 'p', 'z', 'z', 'z', 'z', '\0'

    db 7 ; min
    db 8 ; max
    db 't' ; chr
    db 't', 'h', 'l', 'm', 'n', 'p', 't', 't', 'k', '\0'

    db 7 ; min
    db 8 ; max
    db 'j' ; chr
    db 'j', 'w', 'j', 'j', 'j', 'n', 'j', 'j', 'f', 'j', 'j', '\0'

    db 5 ; min
    db 18 ; max
    db 'k' ; chr
    db 'v', 'c', 'g', 'l', 'k', 'b', 'w', 'h', 'h', 's', 'b', 'w', 'g', 'f', 'k', 'f', 'w', 'w', '\0'

    db 2 ; min
    db 10 ; max
    db 's' ; chr
    db 's', 's', 'm', 'v', 'z', 'j', 'x', 'h', 'v', 's', 'z', 't', 'd', 'p', 'w', 'g', 'j', '\0'

    db 8 ; min
    db 14 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'm', 'l', '\0'

    db 1 ; min
    db 8 ; max
    db 'c' ; chr
    db 'l', 'c', 'l', 'c', 's', 'c', 'c', 'c', 'c', 'd', '\0'

    db 11 ; min
    db 12 ; max
    db 'x' ; chr
    db 'g', 'n', 'x', 'r', 'z', 't', 'w', 'p', 't', 'x', 'h', 'x', '\0'

    db 9 ; min
    db 10 ; max
    db 'c' ; chr
    db 'z', 's', 'b', 'c', 'c', 'c', 'c', 'c', 'q', 'c', 'd', 'c', 'c', '\0'

    db 3 ; min
    db 13 ; max
    db 'q' ; chr
    db 'w', 'l', 'q', 'n', 'q', 'n', 'v', 's', 'n', 'q', 'n', 'q', 'k', 'b', 'g', 'h', 'z', 'h', '\0'

    db 3 ; min
    db 7 ; max
    db 'p' ; chr
    db 'p', 'j', 'p', 'p', 'p', 'v', 'p', 'k', 'j', 'p', 'x', 's', 'p', 'n', 'p', 'r', 'd', 'h', 'n', 't', '\0'

    db 8 ; min
    db 13 ; max
    db 'w' ; chr
    db 'w', 'p', 'l', 'h', 'w', 'w', 'w', 'w', 'w', 'w', 'm', 'b', 'w', 'q', '\0'

    db 5 ; min
    db 6 ; max
    db 'h' ; chr
    db 'h', 'h', 'h', 'h', 'h', 'm', 'h', '\0'

    db 2 ; min
    db 6 ; max
    db 'd' ; chr
    db 'w', 'd', 'q', 'n', 'd', 'q', 'h', 'w', 'j', 'v', 'z', 'd', 'l', 'd', 'd', 'v', 'j', 'd', 'w', '\0'

    db 2 ; min
    db 3 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'r', '\0'

    db 5 ; min
    db 8 ; max
    db 'v' ; chr
    db 'q', 'w', 'v', 'v', 'v', 'k', 'v', 'v', '\0'

    db 13 ; min
    db 16 ; max
    db 'w' ; chr
    db 'w', 'q', 'j', 't', 'w', 'n', 'l', 'r', 'm', 'w', 'd', 'c', 'l', 'f', 'k', 'w', 's', '\0'

    db 11 ; min
    db 17 ; max
    db 'f' ; chr
    db 'f', 'k', 'h', 'n', 'f', 'n', 'f', 'f', 'j', 'q', 'f', 'r', 'f', 'f', 'j', 'f', 't', 'f', 'f', 'l', '\0'

    db 5 ; min
    db 8 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'r', 'j', 'n', 'j', 'g', 't', 'h', '\0'

    db 4 ; min
    db 10 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'q', 'v', 'v', 'v', 'q', 'v', 'q', 'v', 'v', '\0'

    db 2 ; min
    db 16 ; max
    db 'g' ; chr
    db 'c', 'v', 'v', 'd', 'f', 'b', 'c', 'k', 'd', 'b', 's', 'g', 'w', 'h', 's', 'g', 'h', 'r', 'n', 'r', '\0'

    db 4 ; min
    db 6 ; max
    db 'f' ; chr
    db 'p', 'h', 't', 'f', 'x', 'h', '\0'

    db 2 ; min
    db 3 ; max
    db 'c' ; chr
    db 'b', 'c', 'h', 'm', 'd', 'n', 'c', 'c', 'c', '\0'

    db 9 ; min
    db 19 ; max
    db 'l' ; chr
    db 'c', 'd', 't', 'f', 't', 'r', 'q', 'c', 'l', 'j', 'l', 'j', 'p', 'j', 'f', 'd', 'r', 'j', 'l', '\0'

    db 1 ; min
    db 3 ; max
    db 'r' ; chr
    db 'j', 'r', 'r', 'r', 'r', 'r', 'r', '\0'

    db 15 ; min
    db 17 ; max
    db 'j' ; chr
    db 'v', 'd', 'g', 's', 'n', 'p', 'v', 'd', 'j', 'g', 'h', 'z', 'g', 'q', 'r', 't', 'j', '\0'

    db 1 ; min
    db 2 ; max
    db 's' ; chr
    db 'k', 's', 's', 's', 's', '\0'

    db 7 ; min
    db 10 ; max
    db 't' ; chr
    db 'r', 'p', 't', 't', 't', 't', 'm', 't', 'm', 'w', 'p', 't', 't', 't', 't', 'v', '\0'

    db 6 ; min
    db 9 ; max
    db 't' ; chr
    db 't', 't', 't', 't', 't', 'j', 't', 'x', 'b', '\0'

    db 5 ; min
    db 6 ; max
    db 'q' ; chr
    db 'k', 'q', 'j', 'v', 'q', 'j', '\0'

    db 5 ; min
    db 11 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'm', 'w', 'w', 'm', 'q', 'f', 'h', 'j', 'b', '\0'

    db 9 ; min
    db 13 ; max
    db 'h' ; chr
    db 'h', 'h', 'v', 's', 'n', 'h', 'd', 'x', 'f', 'z', 'c', 'b', 'h', 'g', '\0'

    db 2 ; min
    db 5 ; max
    db 'g' ; chr
    db 'c', 'g', 'r', 'b', 'g', 'm', 'n', 'r', 'k', 'q', 'h', 'g', 'p', 'z', 'd', 'm', 'v', 'j', 'l', 'z', '\0'

    db 11 ; min
    db 12 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 's', 'n', 'n', 'x', 'n', 'n', '\0'

    db 4 ; min
    db 6 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'k', 'q', 'q', 'q', 'q', '\0'

    db 11 ; min
    db 15 ; max
    db 'q' ; chr
    db 'q', 'r', 'g', 'q', 'q', 'q', 'q', 'f', 'q', 'q', 'h', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', '\0'

    db 15 ; min
    db 17 ; max
    db 'f' ; chr
    db 's', 'f', 'f', 'f', 'f', 't', 'f', 'f', 'f', 'f', 'f', 'v', 'f', 'f', 'f', 'b', 'l', 'f', '\0'

    db 1 ; min
    db 2 ; max
    db 'k' ; chr
    db 'z', 'k', 't', 'd', 'k', '\0'

    db 5 ; min
    db 14 ; max
    db 'w' ; chr
    db 'w', 'w', 'w', 'w', 't', 'h', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', '\0'

    db 3 ; min
    db 4 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'h', 'g', '\0'

    db 9 ; min
    db 11 ; max
    db 'l' ; chr
    db 'l', 'd', 'l', 'l', 'l', 'l', 'l', 'k', 'f', 't', 'l', 'b', 'm', 'l', 'l', 'l', '\0'

    db 9 ; min
    db 11 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'j', 'd', 'b', 's', 'b', '\0'

    db 4 ; min
    db 5 ; max
    db 'h' ; chr
    db 'h', 'l', 'h', 'h', 'h', '\0'

    db 3 ; min
    db 16 ; max
    db 'r' ; chr
    db 'r', 'r', 'd', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'h', 'r', 'r', 'r', 'r', 's', 's', 'r', 'b', '\0'

    db 7 ; min
    db 19 ; max
    db 'l' ; chr
    db 'c', 'c', 'd', 'z', 'x', 'l', 'l', 'm', 'g', 'f', 'w', 'g', 'w', 'k', 'f', 's', 'r', 't', 's', '\0'

    db 8 ; min
    db 11 ; max
    db 'p' ; chr
    db 'p', 'q', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'j', 'z', 'p', 'p', 'p', 'p', '\0'

    db 4 ; min
    db 9 ; max
    db 'w' ; chr
    db 'm', 'g', 'w', 'w', 'g', 'w', 'j', 'f', 'k', '\0'

    db 9 ; min
    db 17 ; max
    db 'm' ; chr
    db 'r', 'm', 't', 'm', 't', 'm', 'm', 'j', 'm', 'v', 't', 'm', 'q', 'c', 'm', 'v', 'm', 'm', 'm', '\0'

    db 1 ; min
    db 5 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'x', 'g', 'g', 'w', 'g', 'g', 'n', 'g', 'g', '\0'

    db 5 ; min
    db 7 ; max
    db 'k' ; chr
    db 'k', 'k', 'x', 'k', 'n', 'h', 'k', 'k', 'k', 'k', '\0'

    db 10 ; min
    db 11 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'z', 'q', '\0'

    db 3 ; min
    db 11 ; max
    db 'f' ; chr
    db 't', 'f', 'f', 'g', 'c', 'r', 'w', 'j', 'm', 'm', 'f', 'g', 'f', 'z', 'f', 'x', 'h', 'f', 'c', 'w', '\0'

    db 1 ; min
    db 13 ; max
    db 'c' ; chr
    db 'c', 'w', 'c', 'r', 'c', 'x', 's', 'h', 'p', 'r', 'f', 't', 'x', 'p', 'k', 'q', 'c', 'c', 'v', 'n', '\0'

    db 4 ; min
    db 5 ; max
    db 'f' ; chr
    db 'm', 'f', 'f', 's', 'v', 'f', '\0'

    db 5 ; min
    db 6 ; max
    db 'z' ; chr
    db 'h', 'z', 'b', 'c', 'z', 'z', 'q', 'z', '\0'

    db 9 ; min
    db 10 ; max
    db 'x' ; chr
    db 'x', 'x', 's', 'd', 'x', 'x', 'x', 'x', 'v', 'v', 'd', 'x', 'c', 's', 'x', 'x', 'x', '\0'

    db 4 ; min
    db 11 ; max
    db 't' ; chr
    db 'f', 'd', 'j', 'q', 'p', 'h', 'p', 'k', 't', 'w', 't', 'b', '\0'

    db 4 ; min
    db 10 ; max
    db 'b' ; chr
    db 't', 'b', 'b', 'b', 'b', 'b', 'v', 'b', 'b', 'j', 'b', '\0'

    db 5 ; min
    db 7 ; max
    db 'l' ; chr
    db 'l', 'l', 'p', 't', 'l', 'm', 'l', '\0'

    db 1 ; min
    db 2 ; max
    db 'p' ; chr
    db 'c', 'q', 'w', 'k', 'v', 'x', 'f', 'z', 'b', '\0'

    db 6 ; min
    db 9 ; max
    db 'h' ; chr
    db 'h', 'j', 'h', 'h', 'h', 'h', 'h', 'h', 'k', 'h', 'h', 'h', '\0'

    db 14 ; min
    db 16 ; max
    db 'n' ; chr
    db 'w', 'z', 'f', 'n', 'd', 'k', 'z', 'x', 'z', 's', 'h', 'x', 's', 'n', 'v', 'b', '\0'

    db 6 ; min
    db 16 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'v', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', '\0'

    db 10 ; min
    db 12 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'z', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', '\0'

    db 6 ; min
    db 8 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', '\0'

    db 8 ; min
    db 10 ; max
    db 'f' ; chr
    db 'd', 'f', 'f', 'd', 'f', 's', 'n', 'f', 'c', 'd', 'w', 'm', 'f', 'p', 'f', 'f', 'g', 's', '\0'

    db 1 ; min
    db 8 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'g', 'b', 'l', '\0'

    db 7 ; min
    db 9 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'd', 'x', 'x', 'p', 'x', 'x', '\0'

    db 5 ; min
    db 8 ; max
    db 's' ; chr
    db 's', 's', 'h', 's', 'q', 's', 's', 's', 's', 's', '\0'

    db 7 ; min
    db 13 ; max
    db 'n' ; chr
    db 'j', 'h', 'b', 's', 'd', 'v', 's', 'l', 't', 'x', 'n', 'm', 'n', 'j', 'g', 'w', 'x', 'l', 'p', 'h', '\0'

    db 7 ; min
    db 9 ; max
    db 'x' ; chr
    db 'x', 'h', 'x', 'x', 's', 'f', 'l', 'x', 'p', 'n', 'f', 'c', 'c', '\0'

    db 9 ; min
    db 10 ; max
    db 'k' ; chr
    db 'k', 'w', 'k', 'k', 'c', 'm', 'q', 'k', 't', 'x', '\0'

    db 3 ; min
    db 7 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', '\0'

    db 2 ; min
    db 3 ; max
    db 'd' ; chr
    db 'd', 'd', 'n', 'd', '\0'

    db 14 ; min
    db 15 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'c', 'c', 'c', 'b', 'c', 'c', 'c', 'c', 's', 'w', 'l', 'b', 'c', 'c', 'c', 'd', 'h', '\0'

    db 2 ; min
    db 5 ; max
    db 'n' ; chr
    db 'z', 'n', 'x', 'l', 'n', '\0'

    db 1 ; min
    db 7 ; max
    db 'w' ; chr
    db 'r', 'l', 'h', 'w', 'p', 's', 'f', '\0'

    db 3 ; min
    db 6 ; max
    db 't' ; chr
    db 'j', 'h', 'z', 'm', 'q', 't', 'x', 'f', '\0'

    db 4 ; min
    db 11 ; max
    db 't' ; chr
    db 'b', 't', 't', 'p', 't', 'n', 't', 'x', 'z', 't', 't', '\0'

    db 2 ; min
    db 3 ; max
    db 't' ; chr
    db 'q', 'm', 'g', 'x', 't', '\0'

    db 1 ; min
    db 15 ; max
    db 'g' ; chr
    db 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'l', 'g', 'h', 'g', '\0'

    db 10 ; min
    db 15 ; max
    db 'j' ; chr
    db 'q', 'v', 'l', 'h', 'v', 'g', 'b', 'm', 'z', 'b', 'g', 'k', 'z', 'r', 'j', 'd', 'x', 't', '\0'

    db 9 ; min
    db 16 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'n', 'n', 'b', 'p', 'p', 'r', 'f', 'r', 'l', 'q', 'm', 's', 'd', 'r', '\0'

    db 2 ; min
    db 5 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'd', 'q', 'q', '\0'

    db 3 ; min
    db 4 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'w', 'd', '\0'

    db 6 ; min
    db 17 ; max
    db 'q' ; chr
    db 'k', 'f', 'z', 'v', 'g', 'q', 'k', 'm', 'q', 'c', 'f', 'b', 'b', 'n', 'l', 'x', 'q', '\0'

    db 4 ; min
    db 5 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 'l', 's', 's', 's', 's', 's', 'h', 's', 's', 's', 's', 's', '\0'

    db 4 ; min
    db 5 ; max
    db 'c' ; chr
    db 'k', 'c', 'c', 'g', 'c', 'c', '\0'

    db 3 ; min
    db 4 ; max
    db 'm' ; chr
    db 'z', 'm', 'q', 'm', '\0'

    db 3 ; min
    db 4 ; max
    db 'k' ; chr
    db 't', 'm', 'k', 'n', '\0'

    db 4 ; min
    db 16 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'l', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', '\0'

    db 5 ; min
    db 10 ; max
    db 'k' ; chr
    db 'm', 'k', 'k', 'k', 'k', 'k', 'k', 'w', 'k', 'l', 'k', 'k', 'k', 'k', 'k', 'k', '\0'

    db 18 ; min
    db 20 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'm', '\0'

    db 3 ; min
    db 9 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'h', 'z', 'z', 'k', 'z', 's', '\0'

    db 5 ; min
    db 6 ; max
    db 'x' ; chr
    db 'd', 'x', 'x', 'z', 'n', 'x', 'x', 'x', 'p', '\0'

    db 1 ; min
    db 2 ; max
    db 'n' ; chr
    db 'n', 'j', 'n', 'n', 'n', 'k', 'x', 'n', '\0'

    db 1 ; min
    db 4 ; max
    db 'q' ; chr
    db 'm', 'q', 'q', 'q', 'q', 'q', '\0'

    db 8 ; min
    db 9 ; max
    db 'k' ; chr
    db 'k', 'n', 'k', 'k', 'k', 'k', 'w', 'k', 'n', 't', 'k', 'k', 'k', 'k', 'k', 'c', 'k', 'k', 'k', '\0'

    db 13 ; min
    db 15 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'f', 's', 'f', 'q', 'r', 'k', 'b', 'j', 'c', 'n', 'l', 'w', '\0'

    db 12 ; min
    db 17 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', '\0'

    db 1 ; min
    db 2 ; max
    db 'p' ; chr
    db 'p', 's', 'z', 'x', 'j', 'n', '\0'

    db 3 ; min
    db 7 ; max
    db 'f' ; chr
    db 'f', 'f', 'w', 'r', 'f', 'j', 'f', 'f', 'p', 'f', 'c', 's', 'f', 'h', 'f', 'f', 'q', 'c', '\0'

    db 1 ; min
    db 9 ; max
    db 'x' ; chr
    db 'x', 'x', 'q', 'x', 'x', 'd', 'v', 'l', 'k', '\0'

    db 8 ; min
    db 11 ; max
    db 'h' ; chr
    db 'd', 'v', 's', 'j', 'h', 'h', 't', 'h', 'c', 'v', 'c', 'h', 'h', 'l', 'l', 's', '\0'

    db 10 ; min
    db 11 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'v', 'k', 'v', 'v', 'v', 'm', 'v', 'v', '\0'

    db 6 ; min
    db 7 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 't', 'q', 'n', '\0'

    db 1 ; min
    db 3 ; max
    db 'j' ; chr
    db 'h', 'j', 'j', 'j', '\0'

    db 4 ; min
    db 6 ; max
    db 'd' ; chr
    db 'd', 'h', 'd', 'r', 'd', 'd', 'h', 'n', '\0'

    db 7 ; min
    db 8 ; max
    db 'c' ; chr
    db 't', 'c', 'c', 's', 'm', 'j', 'm', 'f', '\0'

    db 3 ; min
    db 7 ; max
    db 'g' ; chr
    db 'g', 'g', 'l', 'g', 'g', 'g', 'g', 'g', 'g', 'r', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', '\0'

    db 11 ; min
    db 18 ; max
    db 'p' ; chr
    db 'j', 'p', 't', 'g', 'n', 'c', 'x', 'z', 'w', 's', 'p', 'z', 'p', 'x', 'j', 'p', 'z', 'p', '\0'

    db 15 ; min
    db 16 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'z', 'j', 'j', 'j', 'j', 'j', 'j', 'r', 'k', '\0'

    db 4 ; min
    db 8 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'c', '\0'

    db 12 ; min
    db 13 ; max
    db 'v' ; chr
    db 's', 'p', 'p', 'f', 'f', 'm', 'q', 's', 'r', 'q', 'v', 'v', 'v', 't', 'q', 'n', 'w', 'c', '\0'

    db 3 ; min
    db 4 ; max
    db 'd' ; chr
    db 'd', 'c', 'd', 'g', '\0'

    db 4 ; min
    db 7 ; max
    db 't' ; chr
    db 't', 'h', 'f', 's', 'j', 't', 'z', 'b', 'k', 'x', '\0'

    db 2 ; min
    db 9 ; max
    db 'f' ; chr
    db 'f', 'm', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'l', '\0'

    db 3 ; min
    db 4 ; max
    db 'l' ; chr
    db 'c', 'g', 'r', 'l', 'x', '\0'

    db 10 ; min
    db 18 ; max
    db 'v' ; chr
    db 'd', 'x', 't', 't', 'v', 't', 'r', 'p', 'v', 'r', 'h', 'v', 'b', 'd', 'n', 'n', 'v', 'v', 'v', 'v', '\0'

    db 10 ; min
    db 12 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'p', 'm', 'm', 'm', 'm', 'm', 'd', 'm', 'b', 'm', 'm', 'm', 'm', 'm', '\0'

    db 2 ; min
    db 4 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', '\0'

    db 5 ; min
    db 8 ; max
    db 'j' ; chr
    db 'j', 'j', 'r', 'j', 'j', 'g', 'j', 'c', 's', 'j', 'j', 'n', 'j', '\0'

    db 6 ; min
    db 8 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'z', 'k', 'k', 'k', 'k', 'k', '\0'

    db 4 ; min
    db 16 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'w', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'c', 'n', '\0'

    db 8 ; min
    db 9 ; max
    db 'm' ; chr
    db 'f', 'm', 'z', 'm', 'j', 'd', 'f', 'm', 'm', '\0'

    db 7 ; min
    db 8 ; max
    db 'n' ; chr
    db 'j', 'n', 'h', 's', 'n', 't', 'v', 'r', '\0'

    db 13 ; min
    db 16 ; max
    db 'z' ; chr
    db 'b', 'z', 'd', 'z', 'z', 'z', 'z', 'j', 'm', 'z', 'z', 'z', 'z', 'q', 'b', 'n', '\0'

    db 2 ; min
    db 11 ; max
    db 'j' ; chr
    db 'x', 'j', 'l', 'b', 'p', 'j', 'm', 't', 'v', 'r', 'm', '\0'

    db 5 ; min
    db 7 ; max
    db 'l' ; chr
    db 'p', 'l', 'z', 'l', 'l', 'k', 's', 'r', 'd', 'd', 'b', 'g', 'n', 'l', '\0'

    db 2 ; min
    db 7 ; max
    db 'v' ; chr
    db 'j', 'h', 'v', 'q', 'd', 'v', 'v', 'p', 'v', 'v', 't', 'k', 'v', 'k', 'j', 'z', 'j', 'v', '\0'

    db 1 ; min
    db 6 ; max
    db 'b' ; chr
    db 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', '\0'

    db 2 ; min
    db 6 ; max
    db 'p' ; chr
    db 'l', 'p', 'q', 'p', 'r', 'w', '\0'

    db 1 ; min
    db 8 ; max
    db 't' ; chr
    db 'l', 't', 't', 't', 't', 't', 't', 'g', 't', '\0'

    db 6 ; min
    db 9 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'g', 'p', 'p', 'p', 'p', 'p', '\0'

    db 4 ; min
    db 5 ; max
    db 'w' ; chr
    db 'w', 'f', 'w', 'w', 'g', 'w', '\0'

    db 7 ; min
    db 9 ; max
    db 'g' ; chr
    db 'g', 'q', 'f', 'g', 'q', 'g', 'g', 'g', 'g', '\0'

    db 12 ; min
    db 15 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'f', 'j', 'p', 'p', 'r', 'p', '\0'

    db 13 ; min
    db 15 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', '\0'

    db 3 ; min
    db 5 ; max
    db 'v' ; chr
    db 'v', 'v', 'v', 'v', 'l', 'v', 'v', 'v', 'v', '\0'

    db 3 ; min
    db 9 ; max
    db 's' ; chr
    db 'q', 'q', 'w', 'g', 'p', 'l', 'p', 'm', 's', 'n', 's', 'v', 'j', 'k', 'w', 'b', '\0'

    db 1 ; min
    db 2 ; max
    db 'j' ; chr
    db 'j', 'x', 'j', 'j', 'j', 'j', 'd', '\0'

    db 8 ; min
    db 13 ; max
    db 'b' ; chr
    db 'b', 'b', 'g', 'b', 'b', 'b', 'b', 'j', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', '\0'

    db 8 ; min
    db 15 ; max
    db 'd' ; chr
    db 'q', 's', 'r', 'q', 'd', 'd', 'v', 'p', 'n', 't', 'd', 'w', 'd', 'c', 'd', '\0'

    db 5 ; min
    db 8 ; max
    db 'c' ; chr
    db 'c', 'w', 'c', 'c', 'c', 'c', 'c', 'c', 'f', 'c', 'c', 'q', 'c', '\0'

    db 9 ; min
    db 15 ; max
    db 'c' ; chr
    db 'd', 's', 'l', 'm', 'x', 'l', 'c', 'c', 'c', 't', 'v', 'q', 'z', 'j', 'n', 'g', 'r', 'z', 's', '\0'

    db 13 ; min
    db 14 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'd', 'z', 'z', 'x', 'z', 'z', 'v', 'z', 'z', 'd', 'q', '\0'

    db 4 ; min
    db 5 ; max
    db 'k' ; chr
    db 'k', 'k', 'k', 'k', 'l', '\0'

    db 16 ; min
    db 17 ; max
    db 'l' ; chr
    db 'p', 'l', 'b', 'l', 'j', 's', 'n', 'd', 'x', 'z', 'd', 'f', 'l', 'c', 's', 'l', 'p', 'x', 'w', '\0'

    db 2 ; min
    db 13 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 'x', 's', '\0'

    db 2 ; min
    db 14 ; max
    db 'm' ; chr
    db 'v', 'm', 'f', 'v', 'm', 'c', 'm', 'm', 't', 'm', 'm', 'q', 'm', 's', 'h', 'n', 'k', 'n', '\0'

    db 1 ; min
    db 5 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'k', 'm', 'm', '\0'

    db 1 ; min
    db 9 ; max
    db 's' ; chr
    db 's', 'q', 'p', 's', 'n', 'f', 's', 's', 'j', 's', 's', 's', 's', 's', 's', 's', '\0'

    db 8 ; min
    db 9 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'g', 'l', 'l', 'l', 'r', 'l', '\0'

    db 7 ; min
    db 12 ; max
    db 'x' ; chr
    db 'c', 'h', 'b', 'x', 'g', 'z', 'x', 'j', 'x', 'b', 'p', 'w', 'k', 'f', 'x', 'v', 'p', '\0'

    db 17 ; min
    db 19 ; max
    db 'l' ; chr
    db 'l', 'l', 'k', 'c', 'q', 'b', 'h', 'l', 'f', 'l', 'q', 'l', 'l', 'l', 'm', 'x', 't', 'l', 'r', '\0'

    db 19 ; min
    db 20 ; max
    db 'c' ; chr
    db 'v', 'b', 'c', 'c', 'p', 'w', 'n', 'j', 'c', 'c', 't', 'z', 'c', 'c', 'c', 'q', 'r', 'z', 'b', 'q', '\0'

    db 12 ; min
    db 20 ; max
    db 'g' ; chr
    db 'g', 'g', 'd', 'g', 'f', 'g', 'g', 'r', 'd', 'g', 'j', 'b', 'g', 'n', 'l', 'g', 'g', 'f', 'f', 'g', '\0'

    db 3 ; min
    db 4 ; max
    db 'q' ; chr
    db 'j', 'q', 'q', 's', 'q', '\0'

    db 4 ; min
    db 6 ; max
    db 'm' ; chr
    db 'l', 'd', 'n', 'm', 'm', 's', 'm', '\0'

    db 13 ; min
    db 15 ; max
    db 'n' ; chr
    db 'b', 's', 'k', 'j', 'r', 'n', 'g', 'j', 'b', 'm', 'n', 'h', 'l', 'b', 't', 'b', 'b', 't', '\0'

    db 16 ; min
    db 17 ; max
    db 'n' ; chr
    db 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '\0'

    db 2 ; min
    db 10 ; max
    db 'c' ; chr
    db 'b', 'c', 'x', 'x', 'q', 'p', 'p', 'b', 'f', 'c', 'c', 'q', '\0'

    db 2 ; min
    db 4 ; max
    db 't' ; chr
    db 'x', 't', 'd', 'v', 'h', 't', '\0'

    db 13 ; min
    db 14 ; max
    db 'c' ; chr
    db 'c', 'c', 'c', 'z', 'v', 'c', 'v', 'p', 'c', 'c', 'c', 'k', 'c', 'c', '\0'

    db 6 ; min
    db 11 ; max
    db 'l' ; chr
    db 'g', 'b', 'b', 'l', 'l', 'l', 'n', 'l', 'l', 'd', 'l', 'c', '\0'

    db 4 ; min
    db 8 ; max
    db 'z' ; chr
    db 'z', 'z', 'z', 'z', 'z', 'm', 'z', 'v', 'z', 'z', '\0'

    db 5 ; min
    db 8 ; max
    db 'm' ; chr
    db 'm', 'm', 'g', 'h', 'm', 'c', 'w', 'm', '\0'

    db 6 ; min
    db 8 ; max
    db 'f' ; chr
    db 'd', 'w', 'z', 'f', 'd', 'f', 'f', 't', 'm', '\0'

    db 2 ; min
    db 6 ; max
    db 'w' ; chr
    db 'x', 'w', 'j', 'h', 'n', 'j', 'n', 'w', 'k', '\0'

    db 5 ; min
    db 8 ; max
    db 'l' ; chr
    db 'l', 'h', 's', 'q', 'l', 'l', 'v', 'l', '\0'

    db 1 ; min
    db 8 ; max
    db 'q' ; chr
    db 'q', 'p', 'd', 'q', 'm', 'f', 'c', 'g', 'd', 'h', 'n', 'm', 't', 'j', 'j', '\0'

    db 10 ; min
    db 14 ; max
    db 'x' ; chr
    db 'x', 's', 'x', 'x', 'r', 'p', 'x', 'x', 'n', 'x', 'w', 'h', 'c', 'h', '\0'

    db 2 ; min
    db 5 ; max
    db 'l' ; chr
    db 'l', 'q', 'l', 'l', 'l', 'l', 'l', 'f', 'c', '\0'

    db 5 ; min
    db 14 ; max
    db 'c' ; chr
    db 'c', 'j', 't', 'c', 'h', 'c', 'c', 'x', 'c', 'c', 'c', 'c', 'j', 'c', 'c', 'm', 'd', 'c', '\0'

    db 6 ; min
    db 10 ; max
    db 'x' ; chr
    db 'z', 'x', 'c', 'f', 'x', 't', 'x', 'l', 'x', 'k', '\0'

    db 7 ; min
    db 13 ; max
    db 'k' ; chr
    db 'q', 'w', 'r', 'n', 'z', 'q', 'b', 'b', 'q', 'k', 'g', 'f', 'k', '\0'

    db 9 ; min
    db 13 ; max
    db 'f' ; chr
    db 'f', 'r', 'f', 'r', 'f', 'b', 'f', 'f', 'r', 'f', 'f', 'f', 'n', '\0'

    db 11 ; min
    db 15 ; max
    db 'z' ; chr
    db 'b', 'f', 'j', 'k', 'z', 'h', 'k', 'm', 'n', 'g', 't', 'w', 'd', 'v', 'q', 'x', '\0'

    db 18 ; min
    db 19 ; max
    db 'v' ; chr
    db 'k', 's', 's', 's', 'r', 'w', 'z', 'j', 'n', 'w', 'j', 'n', 'j', 'x', 'z', 'd', 'q', 'w', 'k', '\0'

    db 10 ; min
    db 13 ; max
    db 's' ; chr
    db 's', 's', 's', 's', 's', 's', 's', 's', 's', 't', 's', 'p', 's', 's', 's', 's', 's', '\0'

    db 1 ; min
    db 2 ; max
    db 'w' ; chr
    db 'w', 'w', 'w', 'w', 't', '\0'

    db 2 ; min
    db 5 ; max
    db 'm' ; chr
    db 't', 'm', 'p', 'm', 't', 'p', 'x', 'w', 'w', 'c', 'm', 'm', 'k', 'm', 'p', 'x', 'z', 'w', 'c', '\0'

    db 6 ; min
    db 7 ; max
    db 's' ; chr
    db 't', 's', 'l', 's', 'h', 'x', 's', '\0'

    db 8 ; min
    db 12 ; max
    db 'x' ; chr
    db 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'g', 'x', 'l', 'x', 'l', 'x', 'x', '\0'

    db 2 ; min
    db 5 ; max
    db 'c' ; chr
    db 'j', 'c', 'c', 'c', 'g', 'c', 'd', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'x', '\0'

    db 11 ; min
    db 13 ; max
    db 'n' ; chr
    db 'v', 's', 'x', 'h', 'n', 'k', 'c', 'k', 'k', 's', 'n', 'f', 'k', '\0'

    db 4 ; min
    db 16 ; max
    db 'n' ; chr
    db 'f', 'h', 'k', 'n', 'z', 'n', 'j', 'f', 'v', 'x', 'b', 'p', 'c', 'r', 't', 'k', '\0'

    db 9 ; min
    db 13 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'f', '\0'

    db 10 ; min
    db 16 ; max
    db 'p' ; chr
    db 'p', 'p', 'p', 'p', 'p', 'f', 'p', 'p', 'p', 't', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', '\0'

    db 4 ; min
    db 15 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'r', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w', 'm', 'm', 'm', '\0'

    db 2 ; min
    db 3 ; max
    db 'm' ; chr
    db 'g', 'm', 'v', 'm', 'm', 'm', '\0'

    db 5 ; min
    db 9 ; max
    db 'l' ; chr
    db 'd', 'l', 'c', 'l', 'r', 'l', 't', 'l', 'g', 'w', '\0'

    db 2 ; min
    db 5 ; max
    db 'g' ; chr
    db 'f', 'g', 't', 'l', 'g', '\0'

    db 6 ; min
    db 9 ; max
    db 'q' ; chr
    db 'q', 'q', 'q', 'q', 'q', 'r', 'q', 'q', 'q', 'q', '\0'

    db 5 ; min
    db 12 ; max
    db 'w' ; chr
    db 'b', 'd', 'l', 'm', 'w', 'z', 'l', 'm', 'f', 'd', 'm', 'h', 'g', '\0'

    db 5 ; min
    db 14 ; max
    db 'l' ; chr
    db 'l', 'm', 'l', 'm', 'n', 'r', 'z', 'l', 'g', 'l', 'f', 'l', 'l', 'l', '\0'

    db 17 ; min
    db 20 ; max
    db 'k' ; chr
    db 'w', 'b', 'b', 'b', 'c', 'q', 'l', 'w', 'l', 'v', 'p', 'h', 'd', 's', 'q', 'c', 'k', 'w', 'b', 'm', '\0'

    db 7 ; min
    db 8 ; max
    db 'l' ; chr
    db 'j', 't', 'j', 'l', 'q', 'x', 'q', 'l', '\0'

    db 1 ; min
    db 14 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'x', 'l', 'l', 'l', 'p', 'l', 'l', 'l', 'f', 'l', 'l', 'l', 'l', 'l', '\0'

    db 6 ; min
    db 10 ; max
    db 'd' ; chr
    db 'd', 'd', 'd', 'd', 'd', 'c', 'd', 'd', 'd', 'k', '\0'

    db 9 ; min
    db 11 ; max
    db 'm' ; chr
    db 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'h', 'm', 't', 'm', 'm', 'm', 'm', '\0'

    db 7 ; min
    db 9 ; max
    db 'z' ; chr
    db 'z', 'z', 'c', 'z', 'z', 'z', 'z', 'z', 'z', 'j', 'z', 'f', 'z', '\0'

    db 2 ; min
    db 3 ; max
    db 'j' ; chr
    db 't', 'g', 'j', 'k', 'x', 'p', 'l', '\0'

    db 13 ; min
    db 15 ; max
    db 'f' ; chr
    db 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', '\0'

    db 4 ; min
    db 5 ; max
    db 'r' ; chr
    db 'r', 'r', 'r', 'r', 'r', 'r', '\0'

    db 6 ; min
    db 11 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', '\0'

    db 10 ; min
    db 15 ; max
    db 'f' ; chr
    db 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', '\0'

    db 8 ; min
    db 9 ; max
    db 'l' ; chr
    db 'b', 'l', 's', 'z', 'l', 'l', 'j', 'l', 'l', '\0'

    db 5 ; min
    db 7 ; max
    db 'h' ; chr
    db 'h', 'r', 'h', 'd', 'n', 'h', 'm', 'h', 'h', 'h', 'n', 'x', '\0'

    db 12 ; min
    db 13 ; max
    db 'f' ; chr
    db 'h', 'f', 'f', 'f', 'b', 'k', 'f', 'f', 'n', 'f', 'f', 'f', 'f', 'l', 'f', 'f', 'f', 'f', 'f', 'f', '\0'

    db 1 ; min
    db 6 ; max
    db 'j' ; chr
    db 'j', 'j', 'l', 'j', 'j', 'j', 'j', 'j', 'j', 'd', 'j', 'f', 'j', 'h', 'q', '\0'

    db 11 ; min
    db 12 ; max
    db 'l' ; chr
    db 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', '\0'

    db 19 ; min
    db 20 ; max
    db 'h' ; chr
    db 'h', 'w', 'q', 'h', 's', 'p', 'c', 'k', 'd', 'p', 'p', 'z', 'n', 'z', 'w', 'n', 'm', 'x', 'h', 'h', '\0'

    db 8 ; min
    db 9 ; max
    db 'm' ; chr
    db 'p', 'k', 'c', 'c', 'w', 'c', 'g', 'j', 'p', 'c', 'x', 'n', '\0'

    db '\0', '\0', '\0', '\0', '\0'
