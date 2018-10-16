module mpp (clk, instruction, out_signals, in, out);

	input clk;
	input [7:0] instruction;
	input [7:0] in;
	
	output [7:0] out;
	output [4:0] out_signals;
	
	reg [7:0] out;
	reg [4:0] out_signals;
	
	wire [28:0] ctrl_signals;
	
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
		
	always @ (ctrl_signals)
		begin
			out_signals[0] = ctrl_signals[0];
			out_signals[1] = ctrl_signals[1];
			out_signals[2] = ctrl_signals[18];
			out_signals[3] = ctrl_signals[20];
			out_signals[4] = ctrl_signals[28];
		end
	
endmodule