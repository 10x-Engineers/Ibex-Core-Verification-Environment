class ibex_test_fetch_sequence extends uvm_sequence #(ibex_test_fetch_seq_item);
	
	ibex_test_fetch_seq_item item;
	
	mem_model m_mem;
	
	logic [31:0] mem_addr_t;
  	logic [31:0] mem_data_t;
	
	`uvm_object_utils(ibex_test_fetch_sequence)	
  	
  	`uvm_declare_p_sequencer(ibex_test_fetch_sequencer)
  	
	function new (string name="ibex_test_fetch_sequence");
      super.new(name);
      item = ibex_test_fetch_seq_item::type_id::create("item");
      m_mem = mem_model::type_id::create("m_mem");
    endfunction : new
    
    virtual task pre_body();
    	$display("WHOLE MEMORY IS HERE!");
    	foreach (m_mem.system_memory[i]) begin
    		$display("Address = %0h, Instruction = %0h",i,m_mem.system_memory[i]);
    	end
	endtask : pre_body
    
    virtual task body();
		if(m_mem ==  null) begin
			`uvm_fatal(get_full_name(), "Cannot get memory model") end
		forever begin
      		item = ibex_test_fetch_seq_item::type_id::create("item");
			p_sequencer.request_fifo.get(item);	
			`uvm_info(get_type_name(),$sformatf("Instruction Address : %h",  item.instr_addr_o), UVM_HIGH)
			req = ibex_test_fetch_seq_item::type_id::create("req");
			start_item(req);
			mem_addr_t = item.instr_addr_o;
			mem_data_t = m_mem.read(mem_addr_t);
			`uvm_info(get_type_name(), $sformatf("Serving request for mem = 0x%0h, with data = 0x%0h", mem_addr_t, mem_data_t), UVM_FULL)
			req.instr_rdata_i = mem_data_t;
			req.instr_err_i = 1'b0;
			req.instr_gnt_i = 1'b1;
			req.instr_rvalid_i = 1'b1;
      		finish_item(req);
		end
    endtask : body

endclass : ibex_test_fetch_sequence
