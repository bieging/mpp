module mpp_tb ();

	reg clk;
	reg [7:0] in;

	wire [7:0] out;
	wire [4:0] out_signals;
	wire [15:0] in_program_addr;

	reg [7:0] instruction;

	reg program_cs;

	mpp m1
		(
			.clk          (clk),
			.instruction  (instruction),
			.out_signals  (out_signals),
			.program_addr (in_program_addr),
			.in           (in),
			.out          (out)
		);

	initial
		begin
			clk = 1'b0;
			in = 8'b00000000;
			
			#400
			
			$finish;
		end
		
	always
		begin
			#10 clk = !clk;
		end
		
	always @ (out_signals)
		begin
			program_cs = ~out_signals[1];
		end

	always @ (program_cs)
		begin
			if (program_cs == 1'b0)
				begin
					case (in_program_addr)
                        'h0000: instruction = 8'b00000111;
                        'h0001: instruction = 8'b11000000;
                        'h0002: instruction = 8'b01000000;
                        'h0003: instruction = 8'b11000001;
						
                        'h0004: instruction = 8'b11001011;
                        'h0005: instruction = 8'b00000111;
                        'h0006: instruction = 8'b00000011;
                        'h0007: instruction = 8'b00000000;
						
                        'h0008: instruction = 8'b00000000;
                        'h0009: instruction = 8'b00000000;
                        'h000A: instruction = 8'b00001111;
                        'h000B: instruction = 8'b00000111;
						
                        'h000C: instruction = 8'b00000011;
                        'h000D: instruction = 8'b00000000;
                        'h000E: instruction = 8'b00000011;
                        'h000F: instruction = 8'b00000111;
						
                        'h0010: instruction = 8'b00000011;
                        'h0011: instruction = 8'b00000000;
                        'h0012: instruction = 8'b00001111;
                        'h0013: instruction = 8'b00000000;
					endcase
				end
		end
		  
endmodule