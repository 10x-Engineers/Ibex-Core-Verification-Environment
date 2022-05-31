class ibex_test_fetch_seq_item extends uvm_sequence_item;

	`uvm_object_utils_begin(ibex_test_fetch_seq_item)
		`uvm_field_int(instr_req_o, UVM_DEFAULT)
		`uvm_field_int(instr_gnt_i, UVM_DEFAULT)
		`uvm_field_int(instr_rvalid_i, UVM_DEFAULT)
		`uvm_field_int(instr_addr_o, UVM_DEFAULT)
		`uvm_field_int(instr_rdata_i, UVM_DEFAULT)
		// `uvm_field_int(instr_rdata_intg_i, UVM_DEFAULT)
		`uvm_field_int(instr_err_i, UVM_DEFAULT)
	`uvm_object_utils_end

    logic instr_req_o;
    logic instr_gnt_i;
    logic instr_rvalid_i;
    logic [31:0] instr_addr_o;
    logic [31:0] instr_rdata_i;
    // logic [6:0] instr_rdata_intg_i; 
    logic instr_err_i;
    
    function new(string name = "ibex_test_fetch_seq_item");
    	super.new(name);
	endfunction : new

endclass : ibex_test_fetch_seq_item
