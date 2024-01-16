#!/usr/bin/zsh
riscv32-unknown-elf-as -march=rv32i addi.S -o build/addi.o
riscv32-unknown-elf-ld build/addi.o -o build/addi.elf
riscv32-unknown-elf-objcopy -O binary build/addi.elf build/addi.bin
hexdump -v -e '1/4 "%08x" "\n"' build/addi.bin > addi.hex