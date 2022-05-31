class ibex_test_lsu_sequence extends uvm_sequence #(ibex_test_lsu_seq_item);
	
	ibex_test_lsu_seq_item item;
	mem_model m_mem;	
	
	logic [31:0] mem_addr_t;
  	logic [31:0] mem_data_t;
	logic [31:0] mem_wdata_t;
	logic data_we_t;
	
	`uvm_object_utils(ibex_test_lsu_sequence)	
  	
  	`uvm_declare_p_sequencer(ibex_test_lsu_sequencer)
  	
	function new(string name = "ibex_test_lsu_sequence");
      super.new(name);
      item = ibex_test_lsu_seq_item::type_id::create("item");
      m_mem = mem_model::type_id::create("m_mem");
    endfunction : new
    
    virtual task pre_body();
    	$display("WHOLE MEMORY IS HERE!");
    	foreach (m_mem.system_memory[i]) begin
    		$display("Address = %0h, Instruction = %0h",i,m_mem.system_memory[i]);
    	end
	endtask : pre_body
    
    virtual task body();	
		`uvm_info(get_type_name(), "Entering forever in LSU sequence body()",UVM_HIGH)
		forever begin
      		item = ibex_test_lsu_seq_item::type_id::create("item");
			`uvm_info(get_type_name(), "Before getting packet from LSU Psequencer",UVM_HIGH)
			p_sequencer.addr_ph_port.get(item); // Receiving packet from monitor (via Psequencer)
			`uvm_info(get_type_name(), "AFTER getting packet from LSU Psequencer",UVM_HIGH)
			mem_addr_t 	= item.data_addr_o; 	// Address
			mem_wdata_t = item.data_wdata_o;	// Write DATA
			data_we_t 	= item.data_we_o;		// Write Operation or Read Operation
			`uvm_info(get_type_name(), "Request noted, now decode the request",UVM_HIGH)
			`uvm_info(get_type_name(),$sformatf("SEQUENCE: Packet Collected by Sequence class of LSU Agent:\n%s", item.sprint()),UVM_LOW)
			req = ibex_test_lsu_seq_item::type_id::create("req");
			start_item(req);			
	
			if(!data_we_t) begin // When Read Operation is Executed
				`uvm_info(get_type_name(), "It is a read request",UVM_LOW)
				mem_data_t = m_mem.read(mem_addr_t); // Data Read
				`uvm_info(get_type_name(), $sformatf("DATA READ %d",mem_data_t), UVM_FULL)
				req.data_gnt_i = 1'b1;
				req.data_rdata_i = mem_data_t;
				req.data_rvalid_i = 1'b1;
				req.data_err_i = 1'b0;
			end
			
			if(data_we_t) begin // When Write Operation is Executed
				`uvm_info(get_type_name(), "It is a write request",UVM_HIGH)
				m_mem.write(mem_addr_t,mem_wdata_t); // Data Write Operation
				`uvm_info(get_type_name(), $sformatf("DATA Write %d at Address %d",mem_wdata_t,mem_addr_t), UVM_FULL)
				req.data_gnt_i = 1'b1;
				req.data_rvalid_i = 1'b1;
				req.data_err_i = 1'b0;
		  	end
		  	`uvm_info(get_type_name(), "Packet prepared in LSU agent's Sequence class",UVM_HIGH)
			finish_item(req);
			`uvm_info(get_type_name(),$sformatf("LSU Sequence class: Packet Sent :\n%s", req.sprint()),UVM_LOW)
		end
    endtask : body

endclass:ibex_test_lsu_sequence

