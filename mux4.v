// 4-1 mux

module mux4 (sel, A, B, C, D, Y);
	input [1:0] sel;
	input [4:0] A,B,C,D;
	output reg [4:0] Y;
	
	always @(sel or A or B or C or D)
		if (sel == 2'b00) Y=A;
		else if (sel == 2'b01) Y=B;
		else if (sel == 2'b10) Y=C;
		else if (sel == 2'b11) Y=D;
		
endmodule
	