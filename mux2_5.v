// file mux2.v

module mux2_5(sel,a,b,o);

	input wire sel;
	input wire [4:0] a,b;
	output [4:0] o;
	
	assign o = sel ? a : b;
	
endmodule