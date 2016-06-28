%include "asm_io.inc"

; subroutine _calc_sum
; find the sum of the integers 1 through n
; Parameters:
;   n     - what to sum up to (at [ebp + 8])
;   sump  - pointer to int to store sum into (at [ebp + 12])
; pseuodo C code:
; void calc_sum(int n, int* sump) {
;   int sum = 0;
;   for (int i = 1; i < n; ++i) 
;     sum += i;
;   *sump = sum;
; }

segment .text
        global calc_sum
;
; local variable:
;   sum at [ebp - 4]
calc_sum:
        enter   4, 0                ; make room for sum on stack
        push    ebx                 ; IMPORTANT!

        mov     dword [ebp - 4], 0  ; sum = 0
        dump_stack 1, 2, 4         ; print out stack from ebp-8 to ebp+16
        mov     ecx, 1              ; ecx is i in pseudocode
for_loop:
        cmp     ecx, [ebp + 8]      ; cmp i and n
        jnle    end_for             ; if not i <= n, quit

        add     [ebp - 4], ecx      ; sum += i
        inc     ecx
        jmp     short for_loop

end_for:
        mov     ebx, [ebp + 12]     ; ebx = sump
        mov     eax, [ebp - 4]      ; eax = sum
        mov     [ebx], eax

        pop     ebx                 ; restore ebx
        leave
        ret
        
