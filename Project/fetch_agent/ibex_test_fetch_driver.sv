`define drv_if instr_vif.driver.driver_clocking_block
`define drv instr_vif.asyn_ports

class ibex_test_fetch_driver extends uvm_driver #(ibex_test_fetch_seq_item);
	
	`uvm_component_utils(ibex_test_fetch_driver)
	
	virtual interface ibex_test_instr_mem_intf instr_vif;
	
	function new(string name = "ibex_test_fetch_driver", uvm_component parent = null);
		super.new(name,parent);
	endfunction : new
		
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	`uvm_info(get_type_name(),"RUN phase of Fetch Driver",UVM_HIGH)
    	instr_vif.reset();
    	wait(`drv.instr_req_o);
		`drv.instr_gnt_i    = 	1'b1;
		repeat (1) @(`drv_if);
		fork
			begin
				forever begin
					`uvm_info(get_type_name(),"Forever begin starts in fetch driver",UVM_HIGH)
					seq_item_port.get_next_item(req);
					`drv_if.instr_rdata_i  	<= 	req.instr_rdata_i;
					`drv_if.instr_rvalid_i	<= 	1'b1;
					seq_item_port.item_done();
				end
			end
			begin
				forever begin
					@(negedge `drv.instr_req_o) 
					`uvm_info(get_type_name(),"instr_req_o was low, therefore setting grant low as well",UVM_HIGH)
					`drv.instr_gnt_i    	= 	1'b0; 
					@(instr_vif.clk)
					`drv_if.instr_rvalid_i	<= 	1'b0;
					@(posedge `drv.instr_req_o);
					`drv.instr_gnt_i    	= 	1'b1;
					repeat (1) @(`drv_if);
				end	
			end
		join
	endtask : run_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//	Connect core's instruction memory interface to this agent's driver and monitor in this phase
	  	if (!uvm_config_db#(virtual ibex_test_instr_mem_intf)::get(this,get_full_name(),"instr_mem_intf", instr_vif)) begin
	  		`uvm_error("NO-VIF","vif NOT set in Fetch Agent's DRIVER")
	  	end
		else begin
		  `uvm_info(get_type_name(),"VIF set in Fetch Agent's DRIVER successfully!",UVM_LOW)
		end
	endfunction : connect_phase
		
	task reset();
   			`drv_if.instr_gnt_i		<=	'b0;
			`drv_if.instr_rvalid_i	<=	'b0;
			`drv_if.instr_rdata_i	<=	'b0;
			`drv_if.instr_err_i		<=	'b0;
	endtask : reset

endclass:ibex_test_fetch_driver

