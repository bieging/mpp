module ram_program
    (
        cs,
        addr,
        data
    );
	
	input cs;
	
	input [15:0] addr;
	
	output [7:0] data;
	
	reg [7:0] data;
    
    initial
        begin
            data = 8'b00000000;
        end
		
	always @ (addr)
		begin
			if (cs == 1'b0)
				begin
					case (addr)
                        'h0000: data = 8'b00000111;
                        'h0001: data = 8'b11000000;
                        'h0002: data = 8'b01000000;
                        'h0003: data = 8'b11000001;
						
                        'h0004: data = 8'b11001011;
                        'h0005: data = 8'b00000111;
                        'h0006: data = 8'b00000011;
                        'h0007: data = 8'b00000000;
						
                        'h0008: data = 8'b00000000;
                        'h0009: data = 8'b00000000;
                        'h000A: data = 8'b00001111;
                        'h000B: data = 8'b00000111;
						
                        'h000C: data = 8'b00000011;
                        'h000D: data = 8'b00000000;
                        'h000E: data = 8'b00000011;
                        'h000F: data = 8'b00000111;
						
                        'h0010: data = 8'b00000011;
                        'h0011: data = 8'b00000000;
                        'h0012: data = 8'b00001111;
                        'h0013: data = 8'b00000000;
					endcase
				end
		end
	
endmodule