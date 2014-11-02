// file mux2.v

module mux2(sel,a,b,o);

	input sel,a,b;
	output o;
	
	assign o = sel ? b : a;
	
endmodule