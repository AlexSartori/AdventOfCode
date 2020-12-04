global _start

section .text
_start:
    mov eax, 0x0                    ; Password array index
    mov bp, 0x0                     ; Valid passwords found


main_loop:
    mov bh, [passwords + eax]       ; Min quantity

    inc eax
    mov bl, [passwords + eax]       ; Max quantity

    inc eax
    mov ch, [passwords + eax]       ; Character

    inc eax
    mov cl, [passwords + eax]       ; 1st char of password

    cmp cl, '\0'                    ; If the password array has ended
    je halt                         ; Halt program

    mov dh, 0x0                     ; Matching characters counter


loop_password_chars:
    mov cl, [passwords + eax]       ; Next password char
    inc eax

    cmp cl, '\0'                    ; If string has ended
    je check_password               ; Check if it is valid

    cmp ch, cl                      ; Compare characters
    jne loop_password_chars         ; If they differ, keep looping
    inc dh                          ; Else, increment matching chars. counter
    jmp loop_password_chars         ; Go to next char


check_password:
    inc eax
    cmp dh, bh                      ; CMP counter, minimum
    jl main_loop                    ; If lesser, psw is invalid
    cmp dh, bl                      ; CMP counter, maximum
    jg main_loop                    ; If greater, psw is invalid
    inc bp                          ; Increment valid passwords
    jmp main_loop                   ; Next password


halt:
    jmp halt


section .data
passwords:
    db 1 ; min
    db 4 ; max
    db 'j' ; chr
    db 'j', 'j', 'j', 'q', 'z', 'm', 'g', 'b', 'j', 'w', 'p', 'j', '\0'

	; ...
	; All the other passwords...
	; ...

    db 8 ; min
    db 9 ; max
    db 'm' ; chr
    db 'p', 'k', 'c', 'c', 'w', 'c', 'g', 'j', 'p', 'c', 'x', 'n', '\0'

    db '\0', '\0', '\0', '\0'
