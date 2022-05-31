class ibex_test_environment extends uvm_env;
	
	`uvm_component_utils(ibex_test_environment)
	
	ibex_test_fetch_agent fetch_agent;
	ibex_test_lsu_agent	  lsu_agent;
		
	function new(string name = "ibex_test_environment", uvm_component parent = null);
		super.new(name,parent);
	endfunction : new
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		fetch_agent = ibex_test_fetch_agent::type_id::create("fetch_agent",this);
		lsu_agent = ibex_test_lsu_agent::type_id::create("lsu_agent",this);
	endfunction : build_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
    endfunction : connect_phase
    
    task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	`uvm_info(get_type_name(),"RUN phase of Environment",UVM_HIGH)
    endtask : run_phase
    
endclass:ibex_test_environment
