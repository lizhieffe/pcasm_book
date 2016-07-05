; find n!
%include "asm_io.inc"

segment .data
prompt  db      "Enter a number: ", 0
outmsg  db      "! = ", 0

segment .bss
input   resd    1

segment .text
        global asm_main
asm_main:
        enter   0, 0
        pusha

        mov     eax, prompt
        call    print_string
        call    print_nl

        call    read_int
        mov     [input], eax

        mov     eax, [input]
        call    print_int
        mov     eax, outmsg
        call    print_string

        mov     eax, [input]
        push    eax                 ; push n to the stack
        call    fact
        add     esp, 4              ; remove n from the stack

        call    print_int           ; print result
        call    print_nl

        popa
        mov     eax, 0
        leave
        ret
fact:
        enter   0, 0

        mov     eax, [ebp + 8]      ; eax = n
        cmp     eax, 1
        jbe     term_cond           ; if n <= 1, terminate
        dec     eax
        push    eax
        call    fact                ; eax = fact(n - 1)
        pop     ecx                 ; clear stack parameter
        mul     dword [ebp + 8]     ; edx:eax = eax * [ebp + 8]
        jmp     short end_fact
term_cond:
        mov     eax, 1
end_fact:
        leave
        ret
