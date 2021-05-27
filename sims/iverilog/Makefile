all: clean compile simulate

test?=simple

test_type?=c_test

include ./rtl_source.mk

compile:
	iverilog -o simv -I ../../src \
	-D iverilog \
	$(rtl_source)

simulate:
ifeq ($(test_type),c_test)
	vvp -n simv +test_case=../../tests/c_tests/$(test)/$(test).mem
else ifeq ($(test_type),rv32i)
	vvp -n simv +test_case=../../tests/isa/generated/rv32ui-p-$(test).mem
else ifeq ($(test_type),rv32m)
	vvp -n simv +test_case=../../tests/isa/generated/rv32um-p-$(test).mem
endif

clean:
	@rm -rf wave simv
	@rm -rf *.vcd

gtkwave:
	gtkwave riscv.vcd