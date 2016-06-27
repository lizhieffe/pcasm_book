FILE_NAME="sub3"

rm a.out
gcc -c driver.c | exit 1
nasm -f elf32 "$FILE_NAME".asm 
nasm -f elf32 -d ELF_TYPE asm_io.asm 
gcc -m32 -lc driver.c "$FILE_NAME".o asm_io.o -o a.out
./a.out
