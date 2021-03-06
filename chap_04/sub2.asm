; Subprogram example program
%include "asm_io.inc"

segment .data
prompt1 db    "Enter a number: ", 0
prompt2 db    "Enter another number: ", 0
outmsg1 db    "You entered: ", 0
outmsg2 db    " and: ", 0
outmsg3 db    ", the sum of these is: ", 0

segment .bss
input1  resd  1
input2  resd  1

segment .text
        global asm_main
asm_main:
        enter   0, 0    ; setup routine
        pusha

        mov     eax, prompt1
        call    print_string

        mov     ebx, input1   ; store address of input1 into ebx
        call    get_int

        mov     eax, prompt2
        call    print_string

        mov     ebx, input2
        call    get_int

        mov     eax, [input1]
        add     eax, [input2]
        mov     ebx, eax

        mov     eax, outmsg1
        call    print_string
        mov     eax, [input1]
        call    print_int
        mov     eax, outmsg2
        call    print_string
        mov     eax, [input2]
        call    print_int
        mov     eax, outmsg3
        call    print_string
        mov     eax, ebx
        call    print_int
        call    print_nl

        popa
        mov     eax, 0        ; return back to C
        leave
        ret
; subprogram get_int
; Parameteres:
;   ebx - address of dword to store integer into
;   ecx - address of instruction to return to
; Notes:
;   value of eax is destroed
get_int:
        call    read_int
        mov     [ebx], eax    ; store input into memory
        ret
