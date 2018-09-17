module ctrl_module (clk, instruction, ctrl_signals);

	input clk;
	input [7:0] instruction;
	output [27:0] ctrl_signals;
	
	reg [3:0] decode_address;
	reg [7:0] ctrl_a_address;
	reg [7:0] ctrl_b_address;
	
	reg [
	
	ram_decode ram_dec
		(
			.clk		(clk),
			.en		(cs),
			.addr		(decode_address),
			.data		
		);
		
	ram_ctrl_a
		(
			.clk		(clk),
			.en		(cs),
			.addr		(ctrl_a_address),
			.data		
		);
	
	ram_ctrl_b
		(
			.clk		(clk),
			.en		(cs),
			.addr		(ctrl_b_address),
			.data		
		);

endmodule