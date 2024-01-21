
module BoothEncoder (
    input logic y0, y1, y2, y3,
    output logic [4:0] di //the 4 LSB are a,b,c,d while the MSB is n the sign of the partial product
);

logic [3:0] sel;

assign sel = {y3, y2, y1, y0};

always@(sel) begin
	case (sel)
		4'b0000, 4'b1111 : begin di = 5'b00000; end
		4'b0001, 4'b0010 : begin di = 5'b00001; end
		4'b0011, 4'b0100 : begin di = 5'b00010; end
		4'b0101, 4'b0110 : begin di = 5'b00100; end
		4'b0111 : begin di = 5'b01000; end
		4'b1000 : begin di = 5'b11000; end
		4'b1001, 4'b1010 : begin di = 5'b10100; end
		4'b1011, 4'b1100 : begin di = 5'b10010; end
		4'b1101, 4'b1110 : begin di = 5'b10001; end
		default: begin di = 5'b00000; end
	endcase
end

endmodule
