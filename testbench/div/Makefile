all: clean compile simulate

test:=

test_type?=c_test

compile:
	vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed \
	-sverilog \
	-debug_all \
	+notimingcheck \
	+nospecify \
	+memcbk \
	+define+VCS_WAVE \
	+incdir+../../src \
	-l com.log \
	-f filelist

simulate:
	./simv -l sim.log +notimingcheck +nospecify

clean:
	@rm -rf csrc simv simv.daidir ucli.key VCS*
	@rm -rf *.log *.vpd *.ddc *.svf *.SDF *Synth *Netlist* work vsim* transc *.vcd

dve:
	dve &


