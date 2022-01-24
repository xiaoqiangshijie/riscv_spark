all: clean compile simulate

test:=simple

test_type?=s_test

compile:
	vcs -full64 -cpp g++-9 -cc gcc-9 -LDFLAGS -Wl,--no-as-needed \
	-fsdb \
	-sverilog \
	-debug_all \
	+notimingcheck \
	+nospecify \
	+memcbk \
	+define+FSDB \
	+incdir+../../src \
	-l com.log \
	-f filelist

simulate:
ifeq ($(test_type),c_test)
	./simv +test_case=../../tests/c_tests/$(test)/$(test).mem -l sim.log +notimingcheck +nospecify
else ifeq ($(test_type),s_test)
	./simv +test_case=../../tests/s_tests/s_test.mem -l sim.log +notimingcheck +nospecify
else ifeq ($(test_type),isa)
	./simv -f filelist -ssf soc_tb.fsdb +test_case=../../tests/isa/generated/rv32ui-p-$(test).mem -l sim.log +notimingcheck +nospecify
endif

clean:
	@rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS* verdiLog
	@rm -rf *.log *.vpd *.ddc *.svf *.SDF *Synth *Netlist* work vsim* transc *.vcd novas.conf novas.rc *fsdb

verdi:
	verdi -f filelist -ssf riscv.fsdb


