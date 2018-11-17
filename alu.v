module alu
	(
		sel,
		en,
		in_a,
		in_b,
		flag_c,
		flag_z,
		out
	);
	
	input [2:0] sel;
	input en;
	
	input [7:0] in_a;
	input [7:0] in_b;
	
	output flag_c;
	output flag_z;
	
	output [7:0] out;
	
	reg flag_c;
	reg flag_z;
	
	reg [7:0] out;
	
	initial
		begin
			flag_c = 1'b0;
			flag_z = 1'b1;
			
			out = 8'b00000000;
		end
	
	always @ (*)
		begin
			if (en == 1'b1)
				begin
					case (sel)
						3'b000: out = in_a + in_b;
						3'b001: out = in_a - in_b;
						3'b010: out = in_a & in_b;
						3'b011: out = in_a | in_b;
						
						3'b100: out = in_a ^ in_b;
						3'b101: out = !in_b;
						3'b110: out = in_b;
						3'b111: out = in_b + 1;
					endcase
				end
			else
				begin
					out = 8'bzzzzzzzz;
				end
		end

endmodule