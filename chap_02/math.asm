%include "asm_io.inc"

segment .data
prompt          db  "Enter a number: ", 0
square_msg      db  "Square of input is: ", 0
cube_msg        db  "Cube of input is: ", 0
cube25_msg      db  "Cube of input times 25: ", 0
quot_msg        db  "Quotient of cube/100 is: ", 0
rem_msg         db  "remainder of cube/100 is: ", 0
neg_msg         db  "The negation of the remainder is: ", 0

segment .bss
input   resd 1

segment .text
        global asm_main
asm_main:
        enter   0,0       ; setup routine
        pusha

        mov     eax, prompt
        call    print_string

        call    read_int
        mov     [input], eax

        imul    eax       ; edx:eax = eax^2
        mov     ebx, eax  ; save answer in ebx
        mov     eax, square_msg
        call    print_string
        mov     eax, ebx
        call    print_int
        call    print_nl

        popa
        mov     eax, 0    ; return back to C
        leave
        ret
