// file compare.v

module compare(
	 input  [31:0] A,
    input  [31:0] B,
    output EQ,
    output GZ,
    output LZ,
    output GEZ,
    output LEZ
    );

    wire   ZeroA = (A == 32'b0);

    assign EQ  = ( A == B);
    assign GZ  = (~A[31] & ~ZeroA);
    assign LZ  =   A[31];
    assign GEZ =  ~A[31];
    assign LEZ = ( A[31] |  ZeroA);
	
endmodule