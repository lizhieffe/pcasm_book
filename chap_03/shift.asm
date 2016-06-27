%include "asm_io.inc"

segment .data
prompt            db  "Enter a number: ", 0
before_rotate_msg db  "Number before rotate: ", 0
logical_left_1    db  "Logical shift left one: ", 0
logical_left_2    db  "Logical shift left two: ", 0
logical_left_3    db  "Logical shift left three: ", 0
logical_right_1   db  "Logical shift right one: ", 0
logical_right_2   db  "Logical shift right two: ", 0
logical_right_3   db  "Logical shift right three: ", 0
arithmetic_left_1    db  "Arithmetic shift left one: ", 0
arithmetic_left_2    db  "Arithmetic shift left two: ", 0
arithmetic_left_3    db  "Arithmetic shift left three: ", 0
arithmetic_right_1   db  "Arithmetic shift right one: ", 0
arithmetic_right_2   db  "Arithmetic shift right two: ", 0
arithmetic_right_3   db  "Arithmetic shift right three: ", 0

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

        ; print the input value
        mov     eax, before_rotate_msg 
        call    print_string
        mov     eax, [input]
        call    print_int
        call    print_nl

        ; print the logical shift left 1
        mov     eax, logical_left_1
        call    print_string
        mov     eax, [input]
        shl     eax, 1
        call    print_int
        call    print_nl
         
        ; print the logical shift left 2
        mov     eax, logical_left_2
        call    print_string
        mov     eax, [input]
        shl     eax, 2
        call    print_int
        call    print_nl

        ; print the logical shift left 3
        mov     eax, logical_left_3
        call    print_string
        mov     eax, [input]
        shl     eax, 3 
        call    print_int
        call    print_nl

        ; print the logical shift right 1
        mov     eax, logical_right_1
        call    print_string
        mov     eax, [input]
        shr     eax, 1
        call    print_int
        call    print_nl
         
        ; print the logical shift right 2
        mov     eax, logical_right_2
        call    print_string
        mov     eax, [input]
        shr     eax, 2
        call    print_int
        call    print_nl

        ; print the logical shift right 3
        mov     eax, logical_right_3
        call    print_string
        mov     eax, [input]
        shr     eax, 3 
        call    print_int
        call    print_nl

        ; print the arithmetic shift left 1
        mov     eax, arithmetic_left_1
        call    print_string
        mov     eax, [input]
        sal     eax, 1
        call    print_int
        call    print_nl
         
        ; print the arithmetic shift left 2
        mov     eax, arithmetic_left_2
        call    print_string
        mov     eax, [input]
        sal     eax, 2
        call    print_int
        call    print_nl

        ; print the arithmetic shift left 3
        mov     eax, arithmetic_left_3
        call    print_string
        mov     eax, [input]
        sal     eax, 3 
        call    print_int
        call    print_nl

        ; print the arithmetic shift right 1
        mov     eax, arithmetic_right_1
        call    print_string
        mov     eax, [input]
        sar     eax, 1
        call    print_int
        call    print_nl
         
        ; print the arithmetic shift right 2
        mov     eax, arithmetic_right_2
        call    print_string
        mov     eax, [input]
        sar     eax, 2
        call    print_int
        call    print_nl

        ; print the arithmetic shift right 3
        mov     eax, arithmetic_right_3
        call    print_string
        mov     eax, [input]
        sar     eax, 3 
        call    print_int
        call    print_nl

        popa
        mov     eax, 0    ; return back to C
        leave
        ret
