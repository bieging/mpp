module ctrl_module (clk, instruction, ctrl_signals, sp_car);

	input clk;
	input [7:0] instruction;
	output sp_car;
	output [27:0] ctrl_signals;
	
	reg sp_car;
	reg cs;
	
	reg [3:0] decode_address;
	
	reg [27:0] ctrl_signals;
	
	reg [7:0] decode_reg;
	
	reg [7:0] ctrl_addr;
	
	wire pclh_condition;
	
	wire [7:0] decode_data;
	wire [15:0] ctrl_a_data;
	wire [15:0] ctrl_b_data;
	
	wire [7:0] incr_result;
	
	ram_decode ram_dec
		(
			.en			(cs),
			.addr		(decode_address),
			.data		(decode_data)
		);
		
	ram_control_a ram_ctrl_a
		(
			.en			(cs),
			.addr		(ctrl_addr),
			.data		(ctrl_a_data)
		);
	
	ram_control_b ram_ctrl_b
		(
			.en			(cs),
			.addr		(ctrl_addr),
			.data		(ctrl_b_data)
		);
		
	initial
		begin
			cs = 1'b0;
			sp_car = 1'b0;
		
			decode_address = 4'b0000;
			decode_reg = 8'b00000000;
			ctrl_addr  = 8'b00000000;
		end
		
	assign incr_result = ctrl_addr + 1;
	
	nor u1 (pclh_condition, ctrl_a_data[1], ctrl_a_data[2]);
		
	always @ (posedge ctrl_a_data[3])
		begin
			decode_address[0] = instruction[0];
			decode_address[1] = instruction[1];
			decode_address[2] = instruction[2];
			
			ctrl_signals[14] = instruction[3]; // REG0
			ctrl_signals[15] = instruction[4]; // REG1
			
			ctrl_signals[11] = instruction[5]; // ULA0
			ctrl_signals[12] = instruction[6]; // ULA1
			ctrl_signals[13] = instruction[7]; // ULA2
		end
		
	always @ (posedge clk)
		begin
			// Instruction buffer reset.
			if (ctrl_a_data[0] == 1'b1)
				begin
					ctrl_addr = 8'b00000000;
				end
			else
				begin
					ctrl_addr <= decode_reg;
				end
		end
		
	always @ (*)
		begin
			#5
			sp_car = ctrl_a_data[14] && clk;
		end
		
	always @ (decode_data or ctrl_addr)
		begin
			#5
			if (ctrl_a_data[4] == 1'b0)
				begin
					decode_reg = incr_result;
				end
			else
				begin
					decode_reg = decode_data;
				end
		end
		
	always @ (ctrl_a_data or ctrl_b_data)
		begin
			// 4th address decoder signal.
			decode_address[3] = ctrl_a_data[5];
			
			// Control signals.
			ctrl_signals[0] = ctrl_a_data[6]; // ROMrd
			ctrl_signals[1] = ctrl_a_data[7]; // ROMcs
			ctrl_signals[2] = ctrl_a_data[8]; // PCHbus
			ctrl_signals[3] = ctrl_a_data[9]; // PCLbus
			
			// PCHcar
			if (ctrl_a_data[10] == 1'b1 & pclh_condition == 1'b1)
				begin
					ctrl_signals[4] = 1'b1;
				end
			else
				begin
					ctrl_signals[4] = 1'b0;
				end
			
			// PCLcar
			if (ctrl_a_data[11] == 1'b1 & pclh_condition == 1'b1)
				begin
					ctrl_signals[5] = 1'b1;
				end
			else
				begin
					ctrl_signals[5] = 1'b0;
				end
			
			ctrl_signals[7] = ctrl_a_data[13]; // DIRcar
			
			// 8 on clk's always.
			ctrl_signals[9] = ctrl_a_data[15]; // SPincdec
			ctrl_signals[10] = ctrl_b_data[0]; // SelSP
			
			// 11..15 on ctrl_a_data[3]'s always.
			
			ctrl_signals[16] = ctrl_b_data[11]; // OUTcar
			
			ctrl_signals[17] = ctrl_b_data[10]; // INbus
			
			ctrl_signals[18] = ctrl_b_data[9]; // RAMcs
			ctrl_signals[19] = ctrl_b_data[8]; // RAMwr
			ctrl_signals[20] = ctrl_b_data[7]; // RAMrd
			
			ctrl_signals[21] = ctrl_b_data[6]; // REGcar
			ctrl_signals[22] = ctrl_b_data[5]; // REGbus
			
			ctrl_signals[23] = ctrl_b_data[4]; // ACcar
			ctrl_signals[24] = ctrl_b_data[3]; // ACbus
			
			ctrl_signals[25] = ctrl_b_data[2]; // BUFcar
			
			ctrl_signals[26] = ctrl_b_data[1]; // ULAbus
			
			// EOI
			if (decode_data == 8'b00000000)
				begin
					ctrl_signals[27] = 1'b1; 
				end
			else
				begin
					ctrl_signals[27] = 1'b0; 
				end
			
			#5 // Signals that have to wait to avoid race condition.
			
			ctrl_signals[6] = ctrl_a_data[12]; // SelDataPC
			
		end

endmodule