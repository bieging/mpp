module mpp (clk, instruction, out_signals, program_addr, in, out);

	input clk;
	input [7:0] instruction;
	input [7:0] in;
	
	output [7:0] out;
	output [4:0] out_signals;
	output [15:0] program_addr;
	
	reg [7:0] out;
	
	reg reset;
	
	reg [7:0] bus;
	
	wire [7:0] program_low;
	wire [7:0] program_high;
	reg [15:0] program_addr;
	
	wire [28:0] ctrl_signals;
	
	reg [4:0] out_signals;
	reg [4:0] program_signals;
	
	ctrl_module cm
		(
			.clk				(clk),
			.instruction	(instruction),
			.ctrl_signals	(ctrl_signals)
		);
		
	program_addresser pa
		(
			.ctrl_signals   (program_signals),
			.reset			(reset),
			.in				(bus),
			.out_low		(program_low),
			.out_high		(program_high)
		);

	initial
		begin
			out = 8'b00000000;
			bus = 8'b00000000;
			
			program_addr = 16'b0000000000000000;
			
			out_signals     = 5'b00000;
			program_signals = 5'b00000;
			
			reset = 1'b0;
		end
		
	always @ (ctrl_signals)
		begin
			out_signals[0] = ctrl_signals[0];  // ROMrd
			out_signals[1] = ctrl_signals[1];  // ROMcs
			out_signals[2] = ctrl_signals[18]; // RAMcs
			out_signals[3] = ctrl_signals[20]; // RAMrd
			out_signals[4] = ctrl_signals[28]; // EOI
			
			program_signals[0] = ctrl_signals[6]; // SelDataPC
			program_signals[1] = ctrl_signals[4]; // PCHcar
			program_signals[2] = ctrl_signals[5]; // PCLcar
			program_signals[3] = ctrl_signals[2]; // PCHbus
			program_signals[4] = ctrl_signals[3]; // PCLbus
		end
	
	always @ (program_low)
		begin
			program_addr[0] = program_low[0];
			program_addr[1] = program_low[1];
			program_addr[2] = program_low[2];
			program_addr[3] = program_low[3];
			
			program_addr[4] = program_low[4];
			program_addr[5] = program_low[5];
			program_addr[6] = program_low[6];
			program_addr[7] = program_low[7];
		end
	
	always @ (program_high)
		begin
			program_addr[8] = program_high[0];
			program_addr[9] = program_high[1];
			program_addr[10] = program_high[2];
			program_addr[11] = program_high[3];
			
			program_addr[12] = program_high[4];
			program_addr[13] = program_high[5];
			program_addr[14] = program_high[6];
			program_addr[15] = program_high[7];
		end
	
endmodule