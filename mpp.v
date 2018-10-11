module mpp (clk, instruction, in, out);

	input clk;
	input [7:0] instruction;
	input [7:0] in;
	output [7:0] out;
	
	reg [7:0] out;
	
	wire [27:0] ctrl_signals;
	
	ctrl_module cm
		(
			.clk				(clk),
			.instruction	(instruction),
			.ctrl_signals	(ctrl_signals)
		);

	initial
		begin
			out = 8'b00000000;
		end
	
endmodule