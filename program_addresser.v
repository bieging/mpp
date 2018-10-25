module program_addresser
	(
		ctrl_signals,
		reset,
		in,
		out_low,
		out_high
	);
	
	// Inout.
	input reset;
	
	input [4:0] ctrl_signals;
	input [7:0] in;
	
	output [7:0] out_low;
	output [7:0] out_high;
	
	// Inout types.
	reg [7:0] out_low;
	reg [7:0] out_high;
	
	// Regs and wires.
	reg prev_pcl_state;
	reg prev_pch_state;
	
	reg [7:0] mid_low;
	reg [7:0] mid_high;
	
	reg  [15:0] incr_input;
	wire [15:0] incr_result;
	
	// Initial.
	initial
		begin
			out_low  = 8'b00000000;
			out_high = 8'b00000000;
			
			prev_pcl_state = 1'b0;
			prev_pch_state = 1'b0;
			
			mid_low  = 8'b00000000;
			mid_high = 8'b00000000;
			
			incr_input = 16'b0000000000000000;
		end
	
	// Assigns.
	assign incr_result = incr_input + 1;
	
	// Always.
	always @ (ctrl_signals)
		begin
			// Selection (SelDataPC).
			if (ctrl_signals[0] == 1'b0)
				begin
					mid_low[0] = incr_result[0];
					mid_low[1] = incr_result[1];
					mid_low[2] = incr_result[2];
					mid_low[3] = incr_result[3];
				
					mid_low[4] = incr_result[4];
					mid_low[5] = incr_result[5];
					mid_low[6] = incr_result[6];
					mid_low[7] = incr_result[7];
					
					mid_high[0] = incr_result[8];
					mid_high[1] = incr_result[9];
					mid_high[2] = incr_result[10];
					mid_high[3] = incr_result[11];
				
					mid_high[4] = incr_result[12];
					mid_high[5] = incr_result[13];
					mid_high[6] = incr_result[14];
					mid_high[7] = incr_result[15];
				end
			else
				begin
					mid_low[0] = in[0];
					mid_low[1] = in[1];
					mid_low[2] = in[2];
					mid_low[3] = in[3];
				
					mid_low[4] = in[4];
					mid_low[5] = in[5];
					mid_low[6] = in[6];
					mid_low[7] = in[7];
					
					mid_high[0] = in[0];
					mid_high[1] = in[1];
					mid_high[2] = in[2];
					mid_high[3] = in[3];
				
					mid_high[4] = in[4];
					mid_high[5] = in[5];
					mid_high[6] = in[6];
					mid_high[7] = in[7];
				end
			
			// Clock L (PCLcar).
			if (ctrl_signals[2] == 1'b1 & prev_pcl_state == 1'b0)
				begin
					out_low = mid_low;
					
					incr_input[0] = out_low[0];
					incr_input[1] = out_low[1];
					incr_input[2] = out_low[2];
					incr_input[3] = out_low[3];
					
					incr_input[4] = out_low[4];
					incr_input[5] = out_low[5];
					incr_input[6] = out_low[6];
					incr_input[7] = out_low[7];
				end
			
			prev_pcl_state = ctrl_signals[2];
			
			// Clock H (PCHcar).
			if (ctrl_signals[1] == 1'b1 & prev_pch_state == 1'b0)
				begin
					out_low = mid_low;
					
					incr_input[8] = out_high[0];
					incr_input[9] = out_high[1];
					incr_input[10] = out_high[2];
					incr_input[11] = out_high[3];
					
					incr_input[12] = out_high[4];
					incr_input[13] = out_high[5];
					incr_input[14] = out_high[6];
					incr_input[15] = out_high[7];
				end
			
			prev_pch_state = ctrl_signals[1];
		end
	
endmodule