all: clean compile simulate


compile:
	vcs -full64  -LDFLAGS -Wl,--no-as-needed \
	-sverilog \
	-debug_acc+all -debug_region+cell+encrypt \
	+notimingcheck \
	+nospecify \
	+v2k \
	+memcbk \
	-l com.log \
	+define+UNIT_DELAY \
	+define+TSMC_INITIALIZE_MEM \
	-f filelist

simulate:
	./simv -l sim.log +notimingcheck +nospecify

clean:
	@rm -rf csrc DVEfiles verdiLog simv simv.daidir ucli.key VCS*
	@rm -rf *.log *.vpd *.ddc *.svf *.SDF *Synth *Netlist* work vsim* transc *.vcd novas.conf novas.rc *fsdb

verdi:
	verdi -f filelist -ssf riscv.fsdb
