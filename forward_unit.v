// file: forwarding_unit.v

module forward_unit(
	output wire [1:0] ALU_port1_mux_sel, ALU_port2_mux_sel);
	
	assign ALU_port1_mux_sel = 2'b01;
	assign ALU_port2_mux_sel = 2'b00;

endmodule