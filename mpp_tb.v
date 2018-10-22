module mpp_tb ();

	reg clk;
	inout [7:0] in [255:0];

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
			
			#2000
			
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
                        'h0000: instruction = 'h07;
                        'h0001: instruction = 'hC0;
                        'h0002: instruction = 'h44;
                        'h0003: instruction = 'hC1;
						'h0004: instruction = 'hCB;
						
                        'h0005: instruction = 'h07;
                        'h0006: instruction = 'hC0;
                        'h0007: instruction = 'h44;
                        'h0008: instruction = 'hC1;
						'h0009: instruction = 'hCB;
						
                        'h000A: instruction = 'h07;
                        'h000B: instruction = 'hC0;
                        'h000C: instruction = 'h44;
                        'h000D: instruction = 'hC1;
						'h000E: instruction = 'hCB;
						
                        'h000F: instruction = 'h07;
                        'h0010: instruction = 'h03;
                        'h0011: instruction = 'h00;
						'h0012: instruction = 'h00;
                        
						'h0013: instruction = 'h00;
					endcase
				end
		end
		  
endmodule