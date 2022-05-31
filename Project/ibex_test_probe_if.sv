// Interface for special core signals
// No clocking blocks required

interface ibex_test_probe_if(input logic clk);
	 
    logic fetch_enable;
	  logic core_sleep;
	  logic alert_minor;
	  logic alert_major;
	  logic debug_req;
	  logic ecall;
	  
    modport probe_signals(
		output fetch_enable, debug_req,
		input ecall, core_sleep, alert_minor, alert_major);
	  
    initial begin
		  debug_req = 1'b0;
	  end

endinterface : ibex_test_probe_if
  
