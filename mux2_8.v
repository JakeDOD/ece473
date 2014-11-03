module mux2_8(sel,a,b,o);

	input wire sel;
	input wire [7:0] a,b;
	output [7:0] o;
	
	assign o = sel ? b : a;
	
endmodule