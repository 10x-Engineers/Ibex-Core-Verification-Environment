`define mon_if instr_vif.monitor.monitor_clocking_block

class ibex_test_fetch_monitor extends uvm_monitor;
	
	`uvm_component_utils(ibex_test_fetch_monitor)
	
	virtual interface ibex_test_instr_mem_intf instr_vif;
	ibex_test_fetch_seq_item pkt; 
	uvm_analysis_port#(ibex_test_fetch_seq_item) request_fifo;

	function new(string name = "ibex_test_fetch_monitor", uvm_component parent = null);
		super.new(name, parent);
		request_fifo = new("request_fifo", this);
	endfunction : new

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	`uvm_info(get_type_name(),"RUN phase of Fetch Monitor",UVM_HIGH)
		forever begin
			pkt = ibex_test_fetch_seq_item::type_id::create("pkt");
			@(`mon_if);
			if (`mon_if.instr_req_o) begin
		   		pkt.instr_req_o		=	`mon_if.instr_req_o;
		   		pkt.instr_gnt_i		=	`mon_if.instr_gnt_i;
				pkt.instr_rvalid_i	=	`mon_if.instr_rvalid_i;
				pkt.instr_addr_o	=	`mon_if.instr_addr_o;
				pkt.instr_rdata_i	=	`mon_if.instr_rdata_i;
				pkt.instr_err_i		=	`mon_if.instr_err_i;
				`uvm_info(get_type_name(),$sformatf("MONITOR: Packet Collected :\n%s", pkt.sprint()),UVM_LOW)
				request_fifo.write(pkt);
			end
		end
	endtask : run_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//	Connect core's instruction memory interface to this agent's driver and monitor in this phase
		if (!uvm_config_db#(virtual ibex_test_instr_mem_intf)::get(this,get_full_name(),"instr_mem_intf", instr_vif)) begin
	  		`uvm_error("NO-VIF","vif NOT set in Fetch Agent's MONITOR")
	  	end	
		else begin
		    `uvm_info(get_type_name(),"VIF set in Fetch Agent's MONITOR successfully!",UVM_LOW)
		end
	endfunction : connect_phase

endclass: ibex_test_fetch_monitor





















































































































/*
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	`uvm_info(get_type_name(),"RUN phase of Fetch Monitor",UVM_HIGH)
    	
    	wait(`mon_if.instr_req_o);
		
		forever begin
			pkt = ibex_test_fetch_seq_item::type_id::create("pkt");
			@(`mon_if);
			if (`mon_if.instr_req_o) begin
		   		pkt.instr_req_o		=	`mon_if.instr_req_o;
		   		pkt.instr_gnt_i		=	`mon_if.instr_gnt_i;
				pkt.instr_rvalid_i	=	`mon_if.instr_rvalid_i;
				pkt.instr_addr_o	=	`mon_if.instr_addr_o;
				pkt.instr_rdata_i	=	`mon_if.instr_rdata_i;
				pkt.instr_err_i		=	`mon_if.instr_err_i;
				`uvm_info(get_type_name(),$sformatf("MONITOR: Packet Collected :\n%s", pkt.sprint()),UVM_LOW)
				request_fifo.write(pkt);
			end

			//wait (`mon_if.instr_gnt_i);

		end
	
	endtask

*/
