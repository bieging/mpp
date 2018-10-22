module ram_decode
    (
        en,
        addr,
        data
    );
    
    input en;
    input [3:0] addr;
    
    output [7:0] data;
    
    reg [7:0] data;
    
    initial
        begin
            data = 8'b00000000;
        end
    
    always @ (addr)
        begin
            if (en == 1'b1)
                begin
                    case (addr)
                        4'b0000: data = 8'b00000011;
                        4'b0001: data = 8'b00001000;
                        4'b0010: data = 8'b00001101;
                        4'b0011: data = 8'b00010100;
                        
                        4'b0100: data = 8'b00011001;
                        4'b0101: data = 8'b00011110;
                        4'b0110: data = 8'b00100101;
                        4'b0111: data = 8'b00101010;
                        
                        4'b1000: data = 8'b00101100;
                        4'b1001: data = 8'b00110001;
                        4'b1010: data = 8'b00110110;
                        4'b1011: data = 8'b00111101;
                        
                        4'b1100: data = 8'b01000110;
                        4'b1101: data = 8'b01010000;
                        4'b1110: data = 8'b01011001;
                        4'b1111: data = 8'b01101100;
                    endcase
                end
        end
    
endmodule