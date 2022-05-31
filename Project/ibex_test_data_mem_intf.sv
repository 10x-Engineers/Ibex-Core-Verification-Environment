// 	Data Memory Interface 
//	Required by LSU Agent 
//	for Read and Write Operation

interface ibex_test_data_mem_intf(input logic clk);
    logic                         data_req_o;
    logic                         data_gnt_i;
    logic                         data_rvalid_i;
    logic                         data_we_o;
    logic [3:0]                   data_be_o;
    logic [31:0]                  data_addr_o;
    logic [31:0]                  data_wdata_o;
    logic [31:0]                  data_rdata_i;
    logic                         data_err_i;
	// logic [6:0]					  data_rdata_intg_i;
    // logic [6:0]					  data_wdata_intg_o;
    
    clocking driver_clocking_block @(posedge clk);
    	default input #1 output #1;
    		input data_req_o; 
			input data_we_o;
			input data_be_o; 
			input data_addr_o; 
			input data_wdata_o; 
			// input data_wdata_intg_o;
    		output data_gnt_i; 
			output data_rvalid_i; 
			output data_rdata_i;
			output data_err_i;
			// output data_rdata_intg_i;
    endclocking : driver_clocking_block
    
    clocking monitor_clocking_block @(posedge clk);
    	default input #1 output #1;
    		input data_req_o; 
			input data_we_o; 
			input data_be_o;
			input data_addr_o; 
			input data_wdata_o;
    		input data_gnt_i;
			input data_rvalid_i; 
			input data_rdata_i; 
			input data_err_i;
			// input data_wdata_intg_o;
			// input data_rdata_intg_i;
    endclocking : monitor_clocking_block
    
	modport driver(clocking driver_clocking_block, input clk);
	modport monitor(clocking monitor_clocking_block, input clk);
	
	// 	One Additional Port Declartion to follow protocol
	//	Drivetly drives and receives signals asynchronously
	// 	Does NOT operate with respect to clock 
 	modport asyn_ports(input data_req_o, output data_gnt_i);  

	task automatic wait_pos_clks(input int num);
    	repeat (num) @(posedge clk);
  	endtask

  	task automatic wait_neg_clks(input int num);
    	repeat (num) @(negedge clk);
  	endtask    
  	
  	task automatic reset();
  		data_req_o    		<= 	'b0;
  		data_addr_o    		<= 	'b0;
  		data_gnt_i    		<= 	'b0;
		data_rvalid_i	 	<= 	'b0;
		data_rdata_i  		<= 	'b0;
		data_err_i    		<= 	'b0;
		data_we_o			<= 	'b0;
		data_be_o			<= 	'b0;
		data_wdata_o		<= 	'b0;
		// data_rdata_intg_i	<= 	'b0;
		// data_wdata_intg_o	<= 	'b0;
  	endtask

endinterface : ibex_test_data_mem_intf
