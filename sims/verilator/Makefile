all: clean compile simulate

test:=

test_type?=c_test

compile:
	verilator --cc --exe \
	-f filelist \
	+incdir+../../src \
	--top-module tb_top_verilator \
	--trace \
	-CFLAGS "-std=c++11" \
	+define+VCD_TRACE \
	-Wno-WIDTH -Wno-STMTDLY -Wno-CASEINCOMPLETE -Wno-PINMISSING
	make -C obj_dir -f Vtb_top_verilator.mk Vtb_top_verilator
	cp obj_dir/Vtb_top_verilator ./





simulate:
ifeq ($(test_type),c_test)
	./simv +test_case=../../tests/c_tests/$(test)/$(test).data -l sim.log +notimingcheck +nospecify
else ifeq ($(test_type),isa)
	./simv +test_case=../../tests/isa/generated/rv32ui-p-$(test).data -l sim.log +notimingcheck +nospecify
endif

clean:
	@rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS* obj_dir
	@rm -rf *.log *.vpd *.ddc *.svf *.SDF *Synth *Netlist* work vsim* transc *.vcd

dve:
	dve &


