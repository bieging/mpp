module ram_storage
    (
        cs,
		rw,
        addr,
        data_in,
		data_out
    );
    
    input cs;
	input rw;
    input [7:0] addr;
    input [7:0] data_in;
    
    output [7:0] data_out;
    
    reg [7:0] data_out;
	
	reg [7:0] memory [0:255];
    
	integer i;
	
    initial
        begin
            data_out = 8'b00000000;
			
			for (i = 0; i < 256; i = i + 1)
				begin
					memory[i] = 8'b00000000;
				end
        end
		
	always @ (*)
		begin
			if (~cs == 1'b0)
				begin
					if (rw == 1'b0)	// Write.
						begin
							memory[addr] = data_in;
						end
					else			// Read.
						begin
							data_out = memory[addr];
						end
				end
			else
				begin
					data_out = 8'b00000000;	// Zero output when cs is disabled.
				end
		end
	
endmodule