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

	; ...
	; All the other passwords
	; ...

    db 8 ; min
    db 9 ; max
    db 'm' ; chr
    db 'p', 'k', 'c', 'c', 'w', 'c', 'g', 'j', 'p', 'c', 'x', 'n', '\0'

    db '\0', '\0', '\0', '\0', '\0'
