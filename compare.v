// file compare.v

module compare(
	 input  [31:0] A,
    input  [31:0] B,
    output EQ,
    output NE,
    output GTZ,
    output GEZ);

    wire   ZeroA = (A == 32'b0);

    assign EQ  = ( A == B);
    assign NE  = ~EQ;
    assign GTZ = (~A[31] && ~ZeroA);
    assign GEZ = ~A[31];
	
endmodule