gcc -c driver.c | exit 1
nasm -f elf32 first.asm
nasm -f elf32 -d ELF_TYPE asm_io.asm 
gcc -m32 -lc driver.c first.o asm_io.o -o a.out
