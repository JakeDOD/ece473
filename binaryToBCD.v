module binaryToBCD(S, A, B);
	input [0:4] S;
	output reg [0:3] A;
	output reg [0:3] B;
	
	always @(S)
	begin
		A = S / 10;
		B = S % 10;
	end
	
endmodule 