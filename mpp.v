	module mpp (clk, instruction, out_signals, program_addr, in, out);

	input clk;
	input [7:0] instruction;
	input [7:0] in;
	
	output [7:0] out;
	output [4:0] out_signals;
	output [15:0] program_addr;
	
	reg [7:0] out;
	
	reg storage_cs;
	reg storage_rw;
	reg  [7:0] storage_addr;
	reg  [7:0] storage_data_in;
	wire [7:0] storage_data_out;
	
	reg [7:0] dir_sp_buffer;
	
	reg [1:0] reg_bank_sel;
	wire [7:0] reg_bank_out;
	
	reg reset;
	
	reg [7:0] bus;
	
	wire [7:0] program_low;
	wire [7:0] program_high;
	reg [15:0] program_addr;
	
	wire [27:0] ctrl_signals;
	
	wire [7:0] storage_signals;
	
	reg [4:0] out_signals;
	reg [4:0] program_signals;
	
	ctrl_module cm
		(
			.clk			(clk),
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
		
	inc_dec_counter sp
		(
			.set	(ctrl_signals[8]),
			.reset	(reset),
			.ctrl	(ctrl_signals[9]),
			.out	(storage_signals)
		);
		
	ram_storage rs
		(
			.cs			(storage_cs),
			.rw			(storage_rw),
			.addr		(storage_addr),
			.data_in	(storage_data_in),
			.data_out	(storage_data_out)
		);

	reg_bank rb
		(
			.sel	(reg_bank_sel),
			.en		(ctrl_signals[22]),
			.load	(ctrl_signals[21]),
			.reset	(reset),
			.in		(bus),
			.out	(reg_bank_out)
		);
		
	initial
		begin
			out = 8'b00000000;
			bus = 8'b00000000;
			
			program_addr = 16'b0000000000000000;
			
			out_signals     = 5'b00000;
			program_signals = 5'b00000;
			
			storage_cs = 1'b1;
			storage_rw = 1'b0;
			storage_addr = 8'b00000000;
			storage_data_in = 8'b00000000;
			
			dir_sp_buffer = 8'b00000000;
			
			reset = 1'b0;
		end
		
	always @ (ctrl_signals)
		begin
			storage_rw = ctrl_signals[20]; // RAMrd
		
			out_signals[0] = ctrl_signals[0];  // ROMrd
			out_signals[1] = ctrl_signals[1];  // ROMcs
			out_signals[4] = ctrl_signals[27]; // EOI
			
			program_signals[0] = ctrl_signals[6]; // SelDataPC
			program_signals[1] = ctrl_signals[4]; // PCHcar
			program_signals[2] = ctrl_signals[5]; // PCLcar
			program_signals[3] = ctrl_signals[2]; // PCHbus
			program_signals[4] = ctrl_signals[3]; // PCLbus
			
			storage_data_in = instruction;
			
			reg_bank_sel[0] = ctrl_signals[14];
			reg_bank_sel[1] = ctrl_signals[15];
			
			// DIR buffer.
			if (ctrl_signals[7] == 1'b1)
				begin
					dir_sp_buffer = bus;
				end
			
			// Sel SP MUX.
			if (ctrl_signals[10] == 1'b0)
				begin
					storage_addr = dir_sp_buffer;
				end
			else
				begin
					storage_addr = storage_signals;
				end
			
			#5
			storage_cs = ctrl_signals[18]; // RAMcs
			#10
			storage_cs = 0; // RAMcs
		end
		
	always @ (storage_data_out or instruction or ctrl_signals[22])
		begin
			if (out_signals[0] == 1'b1)
				begin
					bus = instruction;
				end
			else if (storage_rw == 1'b1)
				begin
					bus = storage_data_out;
				end
			else if (ctrl_signals[22] == 1'b1)
				begin
					bus = reg_bank_out;
				end
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