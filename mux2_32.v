// file mux2_32.v

module mux2_32(sel,a,b,o);

	input wire sel;
	input wire [31:0] a,b;
	output [31:0] o;
	
	assign o = sel ? a : b;
	
endmodule