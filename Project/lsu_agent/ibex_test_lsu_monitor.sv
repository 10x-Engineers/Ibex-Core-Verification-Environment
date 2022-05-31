`define mon_if data_vif.monitor.monitor_clocking_block

class ibex_test_lsu_monitor extends uvm_monitor;
	
	`uvm_component_utils(ibex_test_lsu_monitor)
	
	ibex_test_lsu_seq_item pkt;

	int counter;

	virtual interface ibex_test_data_mem_intf data_vif;

	// Declaring analysis ports for data transfer 
	uvm_analysis_port#(ibex_test_lsu_seq_item) addr_ph_port;
	
	function new(string name = "ibex_test_lsu_monitor", uvm_component parent = null);	
		super.new(name, parent);
		addr_ph_port = new("addr_ph_port", this); //https://github.com/lowRISC/ibex/blob/master/dv/uvm/core_ibex/common/ibex_mem_intf_agent/ibex_mem_intf_monitor.sv#:~:text=addr_ph_port_monitor'
	endfunction : new
	
	function void build_phase(uvm_phase phase);
		pkt = ibex_test_lsu_seq_item::type_id::create("pkt",this);
		counter = 0;
	endfunction : build_phase
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	`uvm_info(get_type_name(),"RUN phase of LSU Monitor",UVM_HIGH)
		forever begin
			pkt = ibex_test_lsu_seq_item::type_id::create("pkt");
			@(`mon_if);
			if (`mon_if.data_req_o) begin
		   		pkt.data_req_o		=	`mon_if.data_req_o;
		   		pkt.data_gnt_i		=	`mon_if.data_gnt_i;
				pkt.data_rvalid_i	=	`mon_if.data_rvalid_i;
				pkt.data_addr_o		=	`mon_if.data_addr_o;
				pkt.data_rdata_i	=	`mon_if.data_rdata_i;
				pkt.data_err_i		=	`mon_if.data_err_i;
				pkt.data_we_o		= 	`mon_if.data_we_o;
				pkt.data_be_o		=	`mon_if.data_be_o;
				pkt.data_wdata_o	=	`mon_if.data_wdata_o;
				`uvm_info(get_type_name(),$sformatf("MONITOR: Packet Collected :\n%s", pkt.sprint()),UVM_LOW)
				addr_ph_port.write(pkt); /// Write the Packets to TLM FIFO PORT
				counter++;
				`uvm_info(get_type_name(),"Packet sent from monitor to sequencer in LSU agent",UVM_LOW)
				`uvm_info(get_type_name(),$sformatf("MONITOR: Number of Packets Collected :\n%d", counter),UVM_LOW)
				@(negedge `mon_if.data_gnt_i);
			end
		end
	endtask	: run_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//connect core's instruction memory interface to this agent's driver and monitor in this phase
		if (!uvm_config_db#(virtual ibex_test_data_mem_intf)::get(this,get_full_name(),"data_mem_intf", data_vif)) begin
	  		`uvm_error("NO Data Interface","Virtual interface NOT set in LSU Agent's MONITOR")
	  	end	
		else begin
		    `uvm_info(get_type_name(),"Virtual Data Interface set in LSU Agent's MONITOR successfully!",UVM_LOW)
		end
	endfunction : connect_phase

endclass : ibex_test_lsu_monitor
