module mpp (clk, instruction, in, out);

	input clk;
	input [7:0] instruction;
	input in;
	output out;
	
	reg [7:0] instruction;
	
	reg [27:0] ctrl_signals;
	
	ctrl_module cm
		(
			.clk				(clk),
			.instruction	(instruction),
			.ctrl_signals	(ctrl_signals)
		);

endmodule