all: clean compile simulate

test?=simple

test_type?=c_test

compile:
	vcs -full64 -cpp g++-9 -cc gcc-9 -LDFLAGS -Wl,--no-as-needed \
	-sverilog \
	-debug_all \
	+memcbk \
	+define+VCS_WAVE \
	+incdir+../../src \
	-f filelist
	# -l com.log

simulate:
ifeq ($(test_type),c_test)
	./simv +test_case=../../tests/c_tests/$(test)/$(test).mem
else ifeq ($(test_type),rv32i)
	./simv +test_case=../../tests/isa/generated/rv32ui-p-$(test).mem
else ifeq ($(test_type),rv32m)
	./simv +test_case=../../tests/isa/generated/rv32um-p-$(test).mem
endif

clean:
	@rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS*
	@rm -rf *.log *.vpd *.ddc *.svf *.SDF *Synth *Netlist* work vsim* transc *.vcd

dve:
	dve &


