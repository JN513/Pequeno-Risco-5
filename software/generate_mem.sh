#!/usr/bin/zsh
riscv32-unknown-elf-as -march=rv32i teste1.S -o build/teste1.o
riscv32-unknown-elf-ld build/teste1.o -o build/teste1.elf
riscv32-unknown-elf-objcopy -O binary build/teste1.elf build/teste1.bin
hexdump -v -e '1/4 "%08x" "\n"' build/teste1.bin > teste.hex