interface ibex_test_instr_mem_intf(input logic clk,input logic rst_n);
	
	import uvm_pkg::*;
	`include "uvm_macros.svh"

    logic                         instr_req_o;
    logic                         instr_gnt_i;
    logic                         instr_rvalid_i;
    logic [31:0]                  instr_addr_o;
    logic [31:0]                  instr_rdata_i;
    logic                         instr_err_i;
    
    clocking driver_clocking_block @(posedge clk);
    	default input #1 output #1;
    	input instr_req_o;
		input instr_addr_o;
    	output instr_gnt_i;
		output instr_rvalid_i;
		output instr_rdata_i; 
		output instr_err_i;
    endclocking : driver_clocking_block
    
    clocking monitor_clocking_block @(posedge clk);
    	default input #1 output #1;
    	input instr_req_o; 
		input instr_addr_o;
    	input instr_gnt_i;
		input instr_rvalid_i; 
		input instr_rdata_i; 
		input instr_err_i;
    endclocking : monitor_clocking_block

	modport driver(clocking driver_clocking_block, input clk, output instr_gnt_i);
	modport monitor(clocking monitor_clocking_block, input clk);     
    modport asyn_ports(input instr_req_o,output instr_gnt_i);

  	task automatic wait_pos_clks(input int num);
    	repeat (num) @(posedge clk);
  	endtask : wait_pos_clks

  	task automatic wait_neg_clks(input int num);
    	repeat (num) @(negedge clk);
  	endtask : wait_neg_clks
  	
  	task automatic reset();
  		instr_req_o    		<= 	'b0;
  		instr_addr_o    	<= 	'b0;
  		instr_gnt_i    		<= 	'b0;
		instr_rvalid_i	 	<= 	'b0;
		instr_rdata_i  		<= 	'b0;
		instr_err_i    		<= 	'b0;
	  endtask : reset
  	
endinterface : ibex_test_instr_mem_intf
