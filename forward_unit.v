// file: forwarding_unit.v

module forward_unit(
	input wire [4:0] RS_in, RT_in, EX_MEM_dest_reg, MEM_WB_dest_reg,
	output reg [1:0] ALU_port1_mux_sel, ALU_port2_mux_sel);
	
	always begin
		// if our RS is currently in EX_MEM get it from there
		if (RS_in == EX_MEM_dest_reg) begin
			ALU_port1_mux_sel = 2'b01;
		end else if (RS_in == MEM_WB_dest_reg) begin
			ALU_port1_mux_sel = 2'b10;
		end else begin
			ALU_port1_mux_sel = 2'b00;
		end
	end
	
	always begin
		// if our RT is currently in EX_MEM get it from there
		if (RT_in == EX_MEM_dest_reg) begin
			ALU_port2_mux_sel = 2'b01;
		end else if (RT_in == MEM_WB_dest_reg) begin
			ALU_port2_mux_sel = 2'b10;
		end else begin
			ALU_port2_mux_sel = 2'b00;
		end
	end

endmodule