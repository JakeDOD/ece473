// file compare.v

module compare(
	input  [31:0] A,
   input  [31:0] B,
   output reg EQ,
   output reg NE,
   output reg GTZ,
	output reg GEZ);

	wire   ZeroA = (A == 32'b0);

	always @(*) begin
		EQ  = ( A == B);
		NE  = ~(A == B);
		GTZ = (~A[31] && ~ZeroA);
		GEZ = ~A[31];
	end
	
endmodule