module accumulator
	(
		en,
		load,
		reset,
		in,
		out,
		buffer
	);
	
	input en;
	input load;
	input reset;
	
	input [7:0] in;
	
	output [7:0] out;
	output [7:0] buffer;
	
	reg [7:0] out;
	reg [7:0] buffer;
	
	initial
		begin
			buffer = 8'b00000000;
		end
		
	always @ (*)
		begin
			if (load == 1'b1)
				begin
					buffer = in;
				end
			
			if (reset == 1'b1)
				begin
					buffer = 8'b00000000;
				end
		end
	
	always @ (en)
		begin
			if (en == 1'b1)
				begin
					out = buffer;
				end
			else
				begin
					out = 8'bzzzzzzzz;
				end
		end

endmodule