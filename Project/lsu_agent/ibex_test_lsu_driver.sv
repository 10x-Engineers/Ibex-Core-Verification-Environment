`define drv_if data_vif.driver.driver_clocking_block
`define drv data_vif.asyn_ports

class ibex_test_lsu_driver extends uvm_driver #(ibex_test_lsu_seq_item);
	
	`uvm_component_utils(ibex_test_lsu_driver)
	
	virtual interface ibex_test_data_mem_intf data_vif;
	
	function new(string name = "ibex_test_lsu_driver", uvm_component parent = null);
		super.new(name,parent);
	endfunction : new

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	`uvm_info(get_type_name(),"Run phase of LSU Driver",UVM_HIGH)
    	data_vif.reset();
		`uvm_info(get_type_name(), "BEFORE entering forever begin in run_phase of driver",UVM_HIGH)
		forever begin
			`uvm_info(get_type_name(), "AFTER entering forever begin in run_phase of driver",UVM_HIGH)
			seq_item_port.get_next_item(req);
			`uvm_info(get_type_name(), "AFTER receiving packet from sequencer in run_phase of driver",UVM_HIGH)
			`drv.data_gnt_i    		= 	req.data_gnt_i;
			`drv_if.data_err_i	 	<= 	req.data_err_i;
			@(posedge data_vif.clk);
			`drv_if.data_gnt_i    	<= 	1'b0;
			`drv_if.data_rdata_i  	<= 	req.data_rdata_i;
			`drv_if.data_rvalid_i	<= 	req.data_rvalid_i;
			@(posedge data_vif.clk);
			`drv_if.data_rvalid_i   <= 	1'b0;
			seq_item_port.item_done();
			`uvm_info(get_type_name(), "Packet sent from driver to DUT ",UVM_HIGH)
		end
	endtask : run_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		if (!uvm_config_db#(virtual ibex_test_data_mem_intf)::get(this,get_full_name(),"data_mem_intf", data_vif)) begin
	  		`uvm_error("No Data Virtual Interface","data_vif NOT set in LSU Agent's DRIVER")
	  	end
		else begin
			`uvm_info(get_type_name(),"Data virtual interface set in LSU Agent's DRIVER successfully!",UVM_LOW)
		end
	endfunction : connect_phase
	
endclass : ibex_test_lsu_driver
