module clock (output clk, output rst_n);
logic clk;
logic rst_n;

always
begin
#5 clk = ~clk;
end
initial begin
	rst_n = 0;
	#10
	rst_n = 1;
end
endmodule 
