# 自动化编译脚本

RISCV_PATH = ../../toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64

ifeq ($(system),win)
GUN = $(RISCV_PATH)-w64-mingw32
else ifeq ($(system),ubuntu)
GUN = $(RISCV_PATH)-linux-ubuntu14
else ifeq ($(system),mac)
GUN = $(RISCV_PATH)-apple-darwin
endif

RISCV_GCC     = $(GUN)/bin/riscv64-unknown-elf-gcc
RISCV_AS      = $(GUN)/bin/riscv64-unknown-elf-as
RISCV_GXX     = $(GUN)/bin/riscv64-unknown-elf-g++
RISCV_OBJDUMP = $(GUN)/bin/riscv64-unknown-elf-objdump
RISCV_GDB     = $(GUN)/bin/riscv64-unknown-elf-gdb
RISCV_AR      = $(GUN)/bin/riscv64-unknown-elf-ar
RISCV_OBJCOPY = $(GUN)/bin/riscv64-unknown-elf-objcopy
RISCV_READELF = $(GUN)/bin/riscv64-unknown-elf-readelf

CFLAGS += -march=$(RISCV_ARCH)
CFLAGS += -mabi=$(RISCV_ABI)
CFLAGS += -mcmodel=$(RISCV_MCMODEL) -ffunction-sections -fdata-sections -fno-builtin-printf -fno-builtin-malloc

LDFLAGS += -T ../c_tests/link.lds -nostartfiles -Wl,--gc-sections -Wl,--check-sections  # -T表示自己的链接脚本


all: clean $(TARGET)

$(TARGET):
	$(RISCV_GCC) $(CFLAGS) -c ./s_test.S
	$(RISCV_GCC) $(CFLAGS) $(LDFLAGS) s_test.o -o $@
	$(RISCV_OBJCOPY) -O binary $@ $@.bin
	$(RISCV_OBJDUMP) --disassemble-all $@ > $@.dump
	python3 ../bin2mem.py $@.bin $@.mem

clean:
	rm -f $(TARGET) $(TARGET).dump $(TARGET).bin *.data *.o *.mem