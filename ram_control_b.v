module ram_control_b
    (
        en,
        addr,
        data
    );
    
    input en;
    input [7:0] addr;
    
    output [15:0] data;
    
    reg [15:0] data;
    
    initial
        begin
            data = 16'b0000000000000000;
        end
    
    always @ (addr)
        begin
            if (en == 1'b0)
                begin
                    case (addr)
                        8'b00000000: data = 16'b0000000000000000;
                        8'b00000001: data = 16'b0000000000000000;
                        8'b00000010: data = 16'b0000000000000000;
                        8'b00000011: data = 16'b0000000000001000;
                        8'b00000100: data = 16'b0000000000000100;
                        8'b00000101: data = 16'b0000000000000010;
                        8'b00000110: data = 16'b0000000000010000;
                        8'b00000111: data = 16'b0000000000000000;
                        8'b00001000: data = 16'b0000000000001000;
                        8'b00001001: data = 16'b0000000000000100;
                        8'b00001010: data = 16'b0000000000000010;
                        8'b00001011: data = 16'b0000000001000000;
                        8'b00001100: data = 16'b0000000000000000;
                        8'b00001101: data = 16'b0000000000000000;
                        8'b00001110: data = 16'b0000000000000000;
                        8'b00001111: data = 16'b0000000000001000;
                        8'b00010000: data = 16'b0000000000000100;
                        8'b00010001: data = 16'b0000000000000010;
                        8'b00010010: data = 16'b0000001100000000;
                        8'b00010011: data = 16'b0000000000000000;
                        8'b00010100: data = 16'b0000000000001000;
                        8'b00010101: data = 16'b0000000000000100;
                        8'b00010110: data = 16'b0000000000000010;
                        8'b00010111: data = 16'b0000100000000000;
                        8'b00011000: data = 16'b0000000000000000;
                        8'b00011001: data = 16'b0000000000100000;
                        8'b00011010: data = 16'b0000000000000100;
                        8'b00011011: data = 16'b0000000000000010;
                        8'b00011100: data = 16'b0000000000010000;
                        8'b00011101: data = 16'b0000000000000000;
                        8'b00011110: data = 16'b0000000000000000;
                        8'b00011111: data = 16'b0000000000000000;
                        8'b00100000: data = 16'b0000001010000000;
                        8'b00100001: data = 16'b0000000000000100;
                        8'b00100010: data = 16'b0000000000000010;
                        8'b00100011: data = 16'b0000000000010000;
                        8'b00100100: data = 16'b0000000000000000;
                        8'b00100101: data = 16'b0000010000000000;
                        8'b00100110: data = 16'b0000000000000100;
                        8'b00100111: data = 16'b0000000000000010;
                        8'b00101000: data = 16'b0000000000010000;
                        8'b00101001: data = 16'b0000000000000000;
                        8'b00101010: data = 16'b0000000000000000;
                        8'b00101011: data = 16'b0000000000000000;
                        8'b00101100: data = 16'b0000000000000000;
                        8'b00101101: data = 16'b0000000000000100;
                        8'b00101110: data = 16'b0000000000000010;
                        8'b00101111: data = 16'b0000000000010000;
                        8'b00110000: data = 16'b0000000000000000;
                        8'b00110001: data = 16'b0000000000000000;
                        8'b00110010: data = 16'b0000000000000100;
                        8'b00110011: data = 16'b0000000000000010;
                        8'b00110100: data = 16'b0000000001000000;
                        8'b00110101: data = 16'b0000000000000000;
                        8'b00110110: data = 16'b0000000000000000;
                        8'b00110111: data = 16'b0000000000000100;
                        8'b00111000: data = 16'b0000000000000000;
                        8'b00111001: data = 16'b0000000000000000;
                        8'b00111010: data = 16'b0000000000000010;
                        8'b00111011: data = 16'b0000001100000000;
                        8'b00111100: data = 16'b0000000000000000;
                        8'b00111101: data = 16'b0000000000000000;
                        8'b00111110: data = 16'b0000001100000001;
                        8'b00111111: data = 16'b0000000000000000;
                        8'b01000000: data = 16'b0000001100000001;
                        8'b01000001: data = 16'b0000001010000001;
                        8'b01000010: data = 16'b0000000000000000;
                        8'b01000011: data = 16'b0000001010000001;
                        8'b01000100: data = 16'b0000000000000000;
                        8'b01000101: data = 16'b0000000000000000;
                        8'b01000110: data = 16'b0000000000000000;
                        8'b01000111: data = 16'b0000000000000000;
                        8'b01001000: data = 16'b0000001100000001;
                        8'b01001001: data = 16'b0000000000000000;
                        8'b01001010: data = 16'b0000001100000001;
                        8'b01001011: data = 16'b0000001010000001;
                        8'b01001100: data = 16'b0000000000000000;
                        8'b01001101: data = 16'b0000001010000001;
                        8'b01001110: data = 16'b0000000000000000;
                        8'b01001111: data = 16'b0000000000000000;
                        8'b01010000: data = 16'b0000000000000000;
                        8'b01010001: data = 16'b0000001100000001;
                        8'b01010010: data = 16'b0000000000000000;
                        8'b01010011: data = 16'b0000001100000001;
                        8'b01010100: data = 16'b0000001010000001;
                        8'b01010101: data = 16'b0000000000000000;
                        8'b01010110: data = 16'b0000001010000001;
                        8'b01010111: data = 16'b0000000000000000;
                        8'b01011000: data = 16'b0000000000000000;
                        8'b01011001: data = 16'b0000000000000000;
                        8'b01011010: data = 16'b0000000000000000;
                        8'b01011011: data = 16'b0000000000000000;
                        8'b01011100: data = 16'b0000001100000001;
                        8'b01011101: data = 16'b0000000000000000;
                        8'b01011110: data = 16'b0000001100000001;
                        8'b01011111: data = 16'b0000000000000000;
                        8'b01100000: data = 16'b0000000000000000;
                        8'b01100001: data = 16'b0000000000000000;
                        8'b01100010: data = 16'b0000001100000001;
                        8'b01100011: data = 16'b0000000000000000;
                        8'b01100100: data = 16'b0000001100000001;
                        8'b01100101: data = 16'b0000000000000000;
                        8'b01100110: data = 16'b0000000000000000;
                        8'b01100111: data = 16'b0000001010000001;
                        8'b01101000: data = 16'b0000000000000000;
                        8'b01101001: data = 16'b0000001010000001;
                        8'b01101010: data = 16'b0000000000000000;
                        8'b01101011: data = 16'b0000000000000000;
                        8'b01101100: data = 16'b0000001010000001;
                        8'b01101101: data = 16'b0000000000000000;
                        8'b01101110: data = 16'b0000001010000001;
                        8'b01101111: data = 16'b0000000000000000;
                        8'b01110000: data = 16'b0000000000000000;
                        8'b01110001: data = 16'b0000000000000000;
                        8'b01110010: data = 16'b0000000000000000;
                        8'b01110011: data = 16'b0000000000000000;
                        8'b01110100: data = 16'b0000000000000000;
                        8'b01110101: data = 16'b0000000000000000;
                        8'b01110110: data = 16'b0000000000000000;
                        8'b01110111: data = 16'b0000000000000000;
                        8'b01111000: data = 16'b0000000000000000;
                        8'b01111001: data = 16'b0000000000000000;
                        8'b01111010: data = 16'b0000000000000000;
                        8'b01111011: data = 16'b0000000000000000;
                        8'b01111100: data = 16'b0000000000000000;
                        8'b01111101: data = 16'b0000000000000000;
                        8'b01111110: data = 16'b0000000000000000;
                        8'b01111111: data = 16'b0000000000000000;
                        8'b10000000: data = 16'b0000000000000000;
                        8'b10000001: data = 16'b0000000000000000;
                        8'b10000010: data = 16'b0000000000000000;
                        8'b10000011: data = 16'b0000000000000000;
                        8'b10000100: data = 16'b0000000000000000;
                        8'b10000101: data = 16'b0000000000000000;
                        8'b10000110: data = 16'b0000000000000000;
                        8'b10000111: data = 16'b0000000000000000;
                        8'b10001000: data = 16'b0000000000000000;
                        8'b10001001: data = 16'b0000000000000000;
                        8'b10001010: data = 16'b0000000000000000;
                        8'b10001011: data = 16'b0000000000000000;
                        8'b10001100: data = 16'b0000000000000000;
                        8'b10001101: data = 16'b0000000000000000;
                        8'b10001110: data = 16'b0000000000000000;
                        8'b10001111: data = 16'b0000000000000000;
                        8'b10010000: data = 16'b0000000000000000;
                        8'b10010001: data = 16'b0000000000000000;
                        8'b10010010: data = 16'b0000000000000000;
                        8'b10010011: data = 16'b0000000000000000;
                        8'b10010100: data = 16'b0000000000000000;
                        8'b10010101: data = 16'b0000000000000000;
                        8'b10010110: data = 16'b0000000000000000;
                        8'b10010111: data = 16'b0000000000000000;
                        8'b10011000: data = 16'b0000000000000000;
                        8'b10011001: data = 16'b0000000000000000;
                        8'b10011010: data = 16'b0000000000000000;
                        8'b10011011: data = 16'b0000000000000000;
                        8'b10011100: data = 16'b0000000000000000;
                        8'b10011101: data = 16'b0000000000000000;
                        8'b10011110: data = 16'b0000000000000000;
                        8'b10011111: data = 16'b0000000000000000;
                        8'b10100000: data = 16'b0000000000000000;
                        8'b10100001: data = 16'b0000000000000000;
                        8'b10100010: data = 16'b0000000000000000;
                        8'b10100011: data = 16'b0000000000000000;
                        8'b10100100: data = 16'b0000000000000000;
                        8'b10100101: data = 16'b0000000000000000;
                        8'b10100110: data = 16'b0000000000000000;
                        8'b10100111: data = 16'b0000000000000000;
                        8'b10101000: data = 16'b0000000000000000;
                        8'b10101001: data = 16'b0000000000000000;
                        8'b10101010: data = 16'b0000000000000000;
                        8'b10101011: data = 16'b0000000000000000;
                        8'b10101100: data = 16'b0000000000000000;
                        8'b10101101: data = 16'b0000000000000000;
                        8'b10101110: data = 16'b0000000000000000;
                        8'b10101111: data = 16'b0000000000000000;
                        8'b10110000: data = 16'b0000000000000000;
                        8'b10110001: data = 16'b0000000000000000;
                        8'b10110010: data = 16'b0000000000000000;
                        8'b10110011: data = 16'b0000000000000000;
                        8'b10110100: data = 16'b0000000000000000;
                        8'b10110101: data = 16'b0000000000000000;
                        8'b10110110: data = 16'b0000000000000000;
                        8'b10110111: data = 16'b0000000000000000;
                        8'b10111000: data = 16'b0000000000000000;
                        8'b10111001: data = 16'b0000000000000000;
                        8'b10111010: data = 16'b0000000000000000;
                        8'b10111011: data = 16'b0000000000000000;
                        8'b10111100: data = 16'b0000000000000000;
                        8'b10111101: data = 16'b0000000000000000;
                        8'b10111110: data = 16'b0000000000000000;
                        8'b10111111: data = 16'b0000000000000000;
                        8'b11000000: data = 16'b0000000000000000;
                        8'b11000001: data = 16'b0000000000000000;
                        8'b11000010: data = 16'b0000000000000000;
                        8'b11000011: data = 16'b0000000000000000;
                        8'b11000100: data = 16'b0000000000000000;
                        8'b11000101: data = 16'b0000000000000000;
                        8'b11000110: data = 16'b0000000000000000;
                        8'b11000111: data = 16'b0000000000000000;
                        8'b11001000: data = 16'b0000000000000000;
                        8'b11001001: data = 16'b0000000000000000;
                        8'b11001010: data = 16'b0000000000000000;
                        8'b11001011: data = 16'b0000000000000000;
                        8'b11001100: data = 16'b0000000000000000;
                        8'b11001101: data = 16'b0000000000000000;
                        8'b11001110: data = 16'b0000000000000000;
                        8'b11001111: data = 16'b0000000000000000;
                        8'b11010000: data = 16'b0000000000000000;
                        8'b11010001: data = 16'b0000000000000000;
                        8'b11010010: data = 16'b0000000000000000;
                        8'b11010011: data = 16'b0000000000000000;
                        8'b11010100: data = 16'b0000000000000000;
                        8'b11010101: data = 16'b0000000000000000;
                        8'b11010110: data = 16'b0000000000000000;
                        8'b11010111: data = 16'b0000000000000000;
                        8'b11011000: data = 16'b0000000000000000;
                        8'b11011001: data = 16'b0000000000000000;
                        8'b11011010: data = 16'b0000000000000000;
                        8'b11011011: data = 16'b0000000000000000;
                        8'b11011100: data = 16'b0000000000000000;
                        8'b11011101: data = 16'b0000000000000000;
                        8'b11011110: data = 16'b0000000000000000;
                        8'b11011111: data = 16'b0000000000000000;
                        8'b11100000: data = 16'b0000000000000000;
                        8'b11100001: data = 16'b0000000000000000;
                        8'b11100010: data = 16'b0000000000000000;
                        8'b11100011: data = 16'b0000000000000000;
                        8'b11100100: data = 16'b0000000000000000;
                        8'b11100101: data = 16'b0000000000000000;
                        8'b11100110: data = 16'b0000000000000000;
                        8'b11100111: data = 16'b0000000000000000;
                        8'b11101000: data = 16'b0000000000000000;
                        8'b11101001: data = 16'b0000000000000000;
                        8'b11101010: data = 16'b0000000000000000;
                        8'b11101011: data = 16'b0000000000000000;
                        8'b11101100: data = 16'b0000000000000000;
                        8'b11101101: data = 16'b0000000000000000;
                        8'b11101110: data = 16'b0000000000000000;
                        8'b11101111: data = 16'b0000000000000000;
                        8'b11110000: data = 16'b0000000000000000;
                        8'b11110001: data = 16'b0000000000000000;
                        8'b11110010: data = 16'b0000000000000000;
                        8'b11110011: data = 16'b0000000000000000;
                        8'b11110100: data = 16'b0000000000000000;
                        8'b11110101: data = 16'b0000000000000000;
                        8'b11110110: data = 16'b0000000000000000;
                        8'b11110111: data = 16'b0000000000000000;
                        8'b11111000: data = 16'b0000000000000000;
                        8'b11111001: data = 16'b0000000000000000;
                        8'b11111010: data = 16'b0000000000000000;
                        8'b11111011: data = 16'b0000000000000000;
                        8'b11111100: data = 16'b0000000000000000;
                        8'b11111101: data = 16'b0000000000000000;
                        8'b11111110: data = 16'b0000000000000000;
                        8'b11111111: data = 16'b0000000000000000;
                    endcase
                end
        end
    
endmodule