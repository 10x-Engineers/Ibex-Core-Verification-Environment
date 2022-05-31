package ibex_test_intf_agents_pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"
	
	//import mem_model_pkg::*;
	import riscv_signature_pkg::*;

	//typedef uvm_config_db#(virtual ibex_test_instr_mem_intf) fifa_vif_config;
	//typedef uvm_config_db#(virtual ibex_test_data_mem_intf)  lsuifa_vif_config;

	//`include ""
	`include "verif/mem_model.sv"
		
	`include "fetch_agent/ibex_test_fetch_seq_item.sv"
	`include "fetch_agent/ibex_test_fetch_monitor.sv"
	`include "fetch_agent/ibex_test_fetch_driver.sv"
	`include "fetch_agent/ibex_test_fetch_sequencer.sv"
	`include "fetch_agent/ibex_test_fetch_sequence.sv"
	`include "fetch_agent/ibex_test_fetch_agent.sv"
	//`include "fetch_agent/ibex_test_fetch_virtual_sequencer.sv"
	//`include "fetch_agent/ibex_test_fetch_virtual_sequence.sv"

	`include "lsu_agent/ibex_test_lsu_seq_item.sv"
	`include "lsu_agent/ibex_test_lsu_monitor.sv"
	`include "lsu_agent/ibex_test_lsu_driver.sv"
	`include "lsu_agent/ibex_test_lsu_sequencer.sv"
	`include "lsu_agent/ibex_test_lsu_sequence.sv"
	`include "lsu_agent/ibex_test_lsu_agent.sv"


endpackage
