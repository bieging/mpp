module mpp_tb ();

reg clk;
reg [7:0] instruction;
reg [7:0] inputs;
reg [7:0] outputs;

mpp m1 (.clk         (clk),
        .instruction (instruction),
		  .in          (in),
		  .out         (out));

initial
	begin
		clk = 1'b0;
		instruction = 8'b00000000;
		in = 8'b00000000;
		out = 8'b00000000;
		
		#100
		
		$finish
	end
		  
endmodule