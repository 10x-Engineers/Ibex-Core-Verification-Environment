	`include "ibex_test_environment.sv"
	`include "ibex_test_test_lib.sv"	
	always @(negedge instr_mem_intf.instr_req_o) instr_mem_intf.instr_gnt_i = 0;
