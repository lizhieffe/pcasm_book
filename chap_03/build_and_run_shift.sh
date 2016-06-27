rm a.out
gcc -c driver.c | exit 1
nasm -f elf32 shift.asm 
nasm -f elf32 -d ELF_TYPE asm_io.asm 
gcc -m32 -lc driver.c shift.o asm_io.o -o a.out
./a.out
