// The TestBench Top is at the top of the hierarchy.  

module ibex_test_testbench;

  	initial begin
		$dumpfile("dump.vcd");
		$display("some tag here");
		$dumpvars;
  	end
  	
	// Include all the important files
	import uvm_pkg::*;
	import ibex_test_intf_agents_pkg::*;
	`include "ibex_test_environment.sv"
	`include "ibex_test_test_lib.sv"	
			
	// Initial begin logic. Start the System with reset state.
	logic clk = 0;
	logic rst_n;

	initial begin
    	clk <= 0;
		rst_n <= 1;
		@(posedge clk);
			rst_n <= 0;
		@(posedge clk);
			rst_n <= 1;
	end

	// Clock initialization 
	always begin
      #5 clk = ~clk;
    end

	// Parameter Macros
	`ifndef IBEX_CFG_RegFile
    	`define IBEX_CFG_RegFile ibex_pkg::RegFileFF
  	`endif

	`ifndef IBEX_CFG_RV32B
    	`define IBEX_CFG_RV32B ibex_pkg::RV32BNone
  	`endif

	`ifndef IBEX_CFG_RV32M
    	`define IBEX_CFG_RV32M ibex_pkg::RV32MFast
  	`endif

	// Defining parameters
	parameter bit 		   PMPEnable = 1'b0;
	parameter int unsigned PMPGranularity = 0;
	parameter int unsigned PMPNumRegions  = 4;
	parameter bit RV32E = 1'b0;
	parameter ibex_pkg::rv32m_e RV32M = `IBEX_CFG_RV32M;
	parameter ibex_pkg::rv32b_e RV32B = `IBEX_CFG_RV32B;
 	parameter ibex_pkg::regfile_e RegFile = `IBEX_CFG_RegFile;
	parameter bit BranchTargetALU = 1'b0;
	parameter bit WritebackStage = 1'b0;
	parameter bit ICache = 0;
	parameter bit ICacheECC = 0;
	parameter bit BranchPredictor = 1'b0;
	parameter bit DbgTriggerEn = 1'b0;
	parameter bit SecureIbex = 1'b0;
	parameter bit DmHaltAddr = 1'b0;

	// Interface Instances 
	ibex_test_probe_if probe_if(.clk(clk));
	ibex_test_instr_mem_intf instr_mem_intf(.clk(clk), .rst_n(rst_n));
	ibex_test_data_mem_intf  data_mem_intf(.clk(clk));
	
	// Passing the parameters to DUT 
	// Instantiating DUT
	ibex_top_tracing
	#(
		.PMPEnable         (PMPEnable       ),
		.PMPGranularity    (PMPGranularity  ),
		.PMPNumRegions     (PMPNumRegions   ),
		.RV32E             (RV32E           ),
		.RV32M             (RV32M           ),
		.RV32B             (RV32B           ),
		.RegFile           (RegFile         ),
		.BranchTargetALU   (BranchTargetALU ),
		.WritebackStage    (WritebackStage  ),
		.ICache            (ICache          ),
		.ICacheECC         (ICacheECC       ),
		.BranchPredictor   (BranchPredictor ),
		.DbgTriggerEn      (DbgTriggerEn    ),
		.SecureIbex        (SecureIbex      ),
		.DmHaltAddr        (DmHaltAddr      )
		)
	dut(
	.clk_i	        (instr_mem_intf.clk),
	.rst_ni         (instr_mem_intf.rst_n),
	.test_en_i      (1'b0),
	.scan_rst_ni    (1'b1),
	.ram_cfg_i      ('b0),
	.hart_id_i      (32'b0),
	.boot_addr_i    (32'h80000000), //32'h80000000//0x80000000
	// Instruction memory interface
	.instr_req_o    (instr_mem_intf.instr_req_o),
	.instr_gnt_i    (instr_mem_intf.instr_gnt_i),
	.instr_rvalid_i (instr_mem_intf.instr_rvalid_i),
	.instr_addr_o   (instr_mem_intf.instr_addr_o),
	.instr_rdata_i  (instr_mem_intf.instr_rdata_i),
	.instr_err_i    (instr_mem_intf.instr_err_i),
	// Data memory interface
	.data_req_o     (data_mem_intf.data_req_o),
	.data_gnt_i     (data_mem_intf.data_gnt_i),
	.data_rvalid_i  (data_mem_intf.data_rvalid_i),
	.data_we_o      (data_mem_intf.data_we_o),
	.data_be_o      (data_mem_intf.data_be_o),
	.data_addr_o    (data_mem_intf.data_addr_o),
	.data_wdata_o   (data_mem_intf.data_wdata_o),
	.data_rdata_i   (data_mem_intf.data_rdata_i),
	.data_err_i     (data_mem_intf.data_err_i),
	// Interrupt inputs
	.irq_software_i     (0),
	.irq_timer_i        (0),
	.irq_external_i     (0),
	.irq_fast_i         (0),
	.irq_nm_i           (0),
	// Debug Interface
	.debug_req_i        (probe_if.debug_req),
	.crash_dump_o       (0),
	// CPU Control Signals (Probe Interface)
	.fetch_enable_i     (probe_if.fetch_enable),
	.alert_minor_o      (probe_if.alert_minor),
	.alert_major_o      (probe_if.alert_major),
	.core_sleep_o       (probe_if.core_sleep)
	);

    initial begin
		// Configure interfaces with database
        uvm_config_db#(virtual ibex_test_instr_mem_intf)::set(null, "*", "instr_mem_intf", instr_mem_intf);
        uvm_config_db#(virtual ibex_test_data_mem_intf)::set(null, "*", "data_mem_intf", data_mem_intf);
		uvm_config_db#(virtual ibex_test_probe_if)::set(null, "*", "probe_if", probe_if);
        run_test("ibex_test_base_test");
    end
    
	// Check for ecall signal when handled by the core
	// Assigning it to probe interface ecall signal	
  assign probe_if.ecall = dut.u_ibex_top.u_ibex_core.id_stage_i.controller_i.ecall_insn;

endmodule : ibex_test_testbench


