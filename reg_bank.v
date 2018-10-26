module reg_bank
	(
		sel,
		en,
		load,
		reset,
		in,
		out
	);

	input [1:0] sel;
	input [7:0] in;

	input en;
	input load;
	input reset;

	output [7:0] out;
	
	reg [7:0] out;

	reg [7:0] regs [0:3];
	
	integer i;
	
	initial
		begin
			out = 8'b00000000;
		
			for (i = 0; i < 4; i = i + 1)
				begin
					regs[i] = 8'b00000000;
				end
		end
	
	always @ (sel or en or load or reset)
		begin
			if (en == 1'b1)
				begin
					out = regs[sel];
				end
				
			if (load == 1'b1)
				begin
					regs[sel] = in;
				end
				
			if (reset == 1'b1)
				begin
					for (i = 0; i < 4; i = i + 1)
						begin
							regs[i] = 8'b00000000;
						end
				end
		end
	
endmodule