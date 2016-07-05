MODULE_NAME="array1"
MAIN_NAME="array1c"

rm a.out

echo "Compiling the "$MAIN_NAME".c"
gcc "$MAIN_NAME".c -m32 -c | exit 1

echo "Compiling the "$MODULE_NAME".asm"
nasm -f elf32 "$MODULE_NAME".asm 

echo "Compiling the asm_io.asm"
nasm -f elf32 -d ELF_TYPE asm_io.asm 

echo "Linking..."
gcc -m32 -lc "$MODULE_NAME".o "$MAIN_NAME".o asm_io.o -o a.out
./a.out
