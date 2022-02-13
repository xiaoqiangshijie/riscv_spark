license:
lmli2

link:
../../toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -mcmodel=medlow -ffunction-sections -fdata-sections -fno-builtin-printf -fno-builtin-malloc -T ../c_tests/link.lds -nostartfiles -Wl,--gc-sections -Wl,--check-sections a.out -o hello

1. stall
2. mem_related
3. biu
4. mul div