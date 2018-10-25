module inc_dec_counter
	(
		set,
		reset,
		ctrl,
		out
	);
	
	input set;
	input reset;
	input ctrl;
	
	output [7:0] out;
	
	reg [7:0] out;
	
	initial
		begin
			out = 8'b00000000;
		end
		
	always @ (posedge set)
		begin
			if (reset == 1'b1)
				begin
					out = 8'b00000000;
				end
			else if (ctrl == 1'b0)
				begin
					out = out + 1;
				end
			else if (ctrl == 1'b1)
				begin
					out = out - 1;
				end
		end
	
endmodule