MODULE_NAME="sub5"
MAIN_NAME="main5"

rm a.out
gcc "$MAIN_NAME".c -m32 -c | exit 1
nasm -f elf32 "$MODULE_NAME".asm 
nasm -f elf32 -d ELF_TYPE asm_io.asm 
gcc -m32 -lc "$MODULE_NAME".o "$MAIN_NAME".o asm_io.o -o a.out
./a.out
