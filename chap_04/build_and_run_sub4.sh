MODULE_NAME="sub4"
MAIN_NAME="main4"

rm a.out
gcc -c driver.c | exit 1
nasm -f elf32 "$MODULE_NAME".asm 
nasm -f elf32 "$MAIN_NAME".asm
nasm -f elf32 -d ELF_TYPE asm_io.asm 
gcc -m32 -lc driver.c "$MODULE_NAME".o "$MAIN_NAME".o asm_io.o -o a.out
./a.out
