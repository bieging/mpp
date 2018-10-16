module mpp_tb ();

reg clk;
reg [7:0] instruction;
reg [7:0] in;

wire [7:0] out;
wire [4:0] out_signals;

mpp m1 (.clk         (clk),
        .instruction (instruction),
		.out_signals (out_signals),
		.in          (in),
		.out         (out));

initial
	begin
		clk = 1'b0;
		instruction = 8'b00000000;
		in = 8'b00000000;
		
		#30
		
		instruction = 8'b00000111;
		
		#100
		
		$finish;
	end
	
always
	begin
		#10 clk = !clk;
	end
		  
endmodule