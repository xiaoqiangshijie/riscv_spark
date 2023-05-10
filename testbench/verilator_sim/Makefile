all: clean compile simulate

compile:
	verilator -Wall --trace -cc top.v --exe main.cpp
	make -C obj_dir -f Vtop.mk Vtop

CFLAGS = -Wall -g  #编译器要报告所有的warning

simulate:
	./obj_dir/Vtop

gtkwave:
	gtkwave vlt_dump.vcd

clean:
	rm -rf ./obj_dir vlt_dump.vcd