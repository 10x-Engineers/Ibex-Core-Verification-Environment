class ibex_test_fetch_agent extends uvm_agent;
	
	`uvm_component_utils_begin(ibex_test_fetch_agent)
		`uvm_field_enum(uvm_active_passive_enum,is_active,UVM_DEFAULT)
    `uvm_component_utils_end
    	
	ibex_test_fetch_driver driver;
	ibex_test_fetch_monitor monitor;
	ibex_test_fetch_sequencer sequencer;
		
	function new(string name="ibex_test_fetch_agent", uvm_component parent = null);
		super.new(name,parent);
	endfunction : new
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(is_active == UVM_ACTIVE) begin
			sequencer = ibex_test_fetch_sequencer::type_id::create("sequencer", this);
			driver = ibex_test_fetch_driver::type_id::create("driver",this);
		end
			monitor = ibex_test_fetch_monitor::type_id::create("monitor", this);
	endfunction : build_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		driver.seq_item_port.connect(sequencer.seq_item_export);
		monitor.request_fifo.connect(sequencer.request_fifo.analysis_export);
	endfunction : connect_phase
	
    task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	`uvm_info(get_type_name(),"RUN phase of Fetch Agent",UVM_HIGH)
    endtask : run_phase
	
endclass:ibex_test_fetch_agent
