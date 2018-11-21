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
			in = 8'b00010100;
			
			#6000
			
			$finish;
		end
		
	always
		begin
			#10 clk     = !clk;
			
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
						'h0000: instruction = 'h07;
						'h0001: instruction = 'hC0;
						'h0002: instruction = 'h55;
						'h0003: instruction = 'h07;
						'h0004: instruction = 'hC1;
						'h0005: instruction = 'h66;
						'h0006: instruction = 'h07;
						'h0007: instruction = 'h06;
						'h0008: instruction = 'h00;
						'h0009: instruction = 'h0E;
						'h000A: instruction = 'h07;
						'h000B: instruction = 'h03;
						'h000C: instruction = 'h00;
						'h000D: instruction = 'h00;
						'h000E: instruction = 'h04;
						'h000F: instruction = 'h07;
						'h0010: instruction = 'h07;
					endcase
				end
		end
		  
endmodule