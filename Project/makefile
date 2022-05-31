run:
	vcs -ntb_opts uvm-1.2 -sverilog -f Flist -LDFLAGS -full64 -debug_all +lint=TFIPC-L
sim:
	./simv +UVM_TESTNAME=ibex_test_base_test +UVM_VERBOSITY=UVM_DEBUG -timescale 1ns/1ns
clean:
	rm -rf csrc simv.daidir simv tr_db.log ucli.key vc_hdrs.h
clear:
	clear
gui:
	./simv +UVM_TESTNAME=ibex_test_base_test -gui &

covg:
	vcs -ntb_opts uvm-1.2 -sverilog tb/testbench.sv -o out -cm line+cond+fsm+tgl+assert -LDFLAGS -Wl,--no-as-needed -full64 -debug_all
	./out -cm line+cond+fsm+tgl+assert +UVM_TIMEOUT=1000000
	dve -covdir out.vdb/ &

rebuild: clear clean run

resim: rebuild sim

regui: rebuild gui

cnc: clean clear



