// file: forwarding_unit.v

module forward_unit(
	input wire EX_MEM_RegWrite, MEM_WB_RegWrite,
	input wire [4:0] RS_in, RT_in, EX_MEM_dest_reg, MEM_WB_dest_reg,
	output reg [1:0] ALU_port1_mux_sel, ALU_port2_mux_sel);
	
	always @* begin
		ALU_port1_mux_sel = 2'b00;
		ALU_port2_mux_sel = 2'b00;
		if (EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg == RS_in)) begin
			ALU_port1_mux_sel = 2'b01;									// Forward from EX_MEM
		end 
		if (MEM_WB_RegWrite && (MEM_WB_dest_reg != 0) && !(EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg != RS_in)) && (MEM_WB_dest_reg == RS_in)) begin
			ALU_port1_mux_sel = 2'b10;									// Forward from MEM_WB
		end
		
		if (EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg == RT_in)) begin
			ALU_port2_mux_sel = 2'b01;									// Forward from EX_MEM
		end
		if (MEM_WB_RegWrite && (MEM_WB_dest_reg != 0) && !(EX_MEM_RegWrite && (EX_MEM_dest_reg != 0) && (EX_MEM_dest_reg != RT_in)) && (MEM_WB_dest_reg == RT_in)) begin
			ALU_port2_mux_sel = 2'b10;
		end
		
	//////////////////////////////////////////////////////////////////////////////////
		// if our RS is currently in EX_MEM get it from there
//		if (RS_in == EX_MEM_dest_reg) begin
//			ALU_port1_mux_sel = 2'b01;									// Forward from EX_MEM
//		end else if (RS_in == MEM_WB_dest_reg) begin
//			ALU_port1_mux_sel = 2'b10;									// Forward from MEM_WB
//		end else begin
//			ALU_port1_mux_sel = 2'b00;									// From the register file
//		end
	
		// if our RT is currently in EX_MEM get it from there
//		if (RT_in == EX_MEM_dest_reg) begin
//			ALU_port2_mux_sel = 2'b01;									// Forward from EX_MEM
//		end else if (RT_in == MEM_WB_dest_reg) begin
//			ALU_port2_mux_sel = 2'b10;									// Forward from MEM_WB
//		end else begin
//			ALU_port2_mux_sel = 2'b00;									// From the register file
//		end
	end

endmodule