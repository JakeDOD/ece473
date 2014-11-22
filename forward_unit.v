// file: forwarding_unit.v

module forward_unit(
	input wire EX_MEM_RegWrite, MEM_WB_RegWrite,
	input wire [4:0] RS_in, RT_in, EX_MEM_dest_reg, MEM_WB_dest_reg,
	input wire R_Ibar_type,
	output reg [1:0] ALU_port1_mux_sel, ALU_port2_mux_sel);
	
	always @(*) begin
		ALU_port1_mux_sel = 2'b00;
		ALU_port2_mux_sel = 2'b00;
		// Forwarding for R-type instructions
		if (EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg == RS_in)) begin
			ALU_port1_mux_sel = 2'b01;									// Forward from EX_MEM
		end 
		if (MEM_WB_RegWrite && (MEM_WB_dest_reg != 0) && !(EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg == RS_in)) && (MEM_WB_dest_reg == RS_in)) begin
			ALU_port1_mux_sel = 2'b10;									// Forward from MEM_WB												//!=
		end
		if (R_Ibar_type == 1) begin
			if (EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg == RT_in)) begin
				ALU_port2_mux_sel = 2'b01;									// Forward from EX_MEM
			end
			if (MEM_WB_RegWrite && (MEM_WB_dest_reg != 0) && !(EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg == RT_in)) && (MEM_WB_dest_reg == RT_in)) begin
				ALU_port2_mux_sel = 2'b10;																												//!=
			end
		end
	end

endmodule