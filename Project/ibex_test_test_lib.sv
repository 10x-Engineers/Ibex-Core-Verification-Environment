class ibex_test_base_test extends uvm_test;

	`uvm_component_utils(ibex_test_base_test)
	
	ibex_test_environment environment;	
	ibex_test_fetch_sequence fetch_seq;
	ibex_test_lsu_sequence lsu_seq;
	
	mem_model mem;

	virtual ibex_test_probe_if probe_if;
	
	function new(string name = "ibex_test_base_test", uvm_component parent = null);
		super.new(name, parent);
        `uvm_info(get_type_name(), "new()", UVM_LOW)
	endfunction : new
	
	virtual function void build_phase(uvm_phase phase);
		uvm_config_int::set( this, "*", "recording_detail", 1);
		super.build_phase(phase);
		uvm_top.set_timeout(5000,1);
		`uvm_info(get_type_name(), "build_phase()", UVM_LOW)
		environment = ibex_test_environment::type_id::create("environment", this);
		mem = mem_model::type_id::create("mem");
		fetch_seq = ibex_test_fetch_sequence::type_id::create("fetch_seq");
		lsu_seq = ibex_test_lsu_sequence::type_id::create("lsu_seq");
		load_custom_binary_to_mem();
		// Setting memory to fetch and lsu sequence object classes 		
	    fetch_seq.m_mem = mem;
		lsu_seq.m_mem = mem;	
    endfunction : build_phase
	
	virtual function void check_phase(uvm_phase phase);
		super.check_phase(phase);
        `uvm_info(get_type_name(), "check_phase()",UVM_LOW)
		$display("check_config_usage();");
		check_config_usage();
	endfunction : check_phase
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
        `uvm_info(get_type_name(), "run_phase of TEST",UVM_LOW)
		phase.raise_objection(this);
		probe_if.probe_signals.fetch_enable = 0; // Initially setting fetch enable low
		@(posedge probe_if.clk);
		probe_if.probe_signals.fetch_enable = 1; // Setting fetch enable high
		mem.print_written_bytes();
		fork
			begin
				fetch_seq.start(environment.fetch_agent.sequencer);
			end
			begin
				lsu_seq.start(environment.lsu_agent.sequencer);
			end
			begin
				`uvm_info(get_type_name(), "Waiting for ECALL signal to get high",UVM_HIGH)				
				@(probe_if.ecall);
				`uvm_info(get_type_name(), "ECALL signal received, deasserting the fetch_enable",UVM_HIGH)				
				#20 probe_if.probe_signals.fetch_enable = 1'b0;
				`uvm_info(get_type_name(), "Test ends here!",UVM_HIGH)				
			end
		join_any	
		disable fork;
		phase.phase_done.set_drain_time(this,1000us);
		phase.drop_objection(this);	
	endtask
	 
	 // Use the following function to load an object file
	function void load_binary_to_mem();
		string      bin;
		bit [7:0]   r8;
		bit [31:0]  addr = 32'h80000080; //	Boot address
		int         f_bin;
		//void'($value$plusargs("bin=%0s", bin));
		//if (bin == "")
		  //`uvm_fatal(get_full_name(), "Please specify test binary by +bin=binary_name")
		//`uvm_info(get_full_name(), $sformatf("Running test : %0s", bin), UVM_LOW)
		bin = "testpz.bin";
		f_bin = $fopen(bin,"rb");
		if (!f_bin)
			`uvm_fatal(get_type_name(), "file not laoded")
		while ($fread(r8,f_bin)) begin
		  `uvm_info(get_type_name(), $sformatf("Init mem [0x%h] = 0x%0h", addr, r8), UVM_FULL)
		  mem.write_byte(addr, r8);
		  addr++;
		end
	endfunction : load_binary_to_mem
	 
	 // Use the following function for manually uploading the code to memory
	function void load_custom_binary_to_mem();
		string      bin;
		bit [7:0]   r8;
		bit [31:0]  addr = 32'h80000080; // 32'h`BOOT_ADDR;
		int         f_bin;
		// Start Entering Instructions Manually 
//////////////////////////////
// 		 Test Code 1		//
//////////////////////////////
		// Factorial test code
		mem.write(addr,32'h00500513);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00100593);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00200613);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00300693);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00400713);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00500793);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00600813);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00700893);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00500913);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h01900993);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h01400a13);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00500513);		
		addr++; addr++; addr++; addr++; 	
		mem.write(addr,32'h010000ef);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00a005b3);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00a00513);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00000073);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h000503b3);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00100513);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00039463);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h0140006f);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00038863);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h02750533);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'hfff38393);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'hff5ff06f);		
		addr++; addr++; addr++; addr++; 
		mem.write(addr,32'h00008067);		
		addr++; addr++; addr++; addr++; 

// Check the trace log for elaborated code 
//////////////////////////////
// 		 Test Code 2		//
//////////////////////////////
//      mem.write(addr,32'h00000893);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h00f00913);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h01400993);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h01900a13);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h01e00a93);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h00000513);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h01252023);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h01352223);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h01452423);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h01252623);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h00052883);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h00452883);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h00852883);		
// 		addr++; addr++; addr++; addr++; 
// 		mem.write(addr,32'h00c52883);		
// 		addr++; addr++; addr++; addr++;
// 		mem.write(addr,32'h00000073);		// ecall
// 		addr++; addr++; addr++; addr++; 
	endfunction : load_custom_binary_to_mem
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//connect core's instruction memory interface to this agent's driver and monitor in this phase
		if (!uvm_config_db#(virtual ibex_test_probe_if)::get(this,get_full_name(),"probe_if", probe_if)) begin
	  		`uvm_error("NO-VIF","vif NOT set in Test Class")
	  	end	
		else begin
		    `uvm_info(get_type_name(),"VIF set in test Class successfully!",UVM_LOW)
		end
  	endfunction : connect_phase
endclass : ibex_test_base_test
