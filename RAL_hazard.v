// file RAL_hazard

module RAL_hazard(
	input wire EX_MEM_memRead,
	input wire[4:0] EX_MEM_dstReg,
	input wire[4:0] ID_EX_RS, ID_EX_RT,
	input wire[31:0] pc,
	
	output reg RAL_hazard);
	
	initial begin
		RAL_hazard = 0;
	end
	
	always @(*) begin
		if (EX_MEM_memRead && (EX_MEM_dstReg == ID_EX_RS || EX_MEM_dstReg == ID_EX_RT)) begin
			RAL_hazard = 1;
		end else begin
			RAL_hazard = 0;
		end
		
		if (pc == 32'd0) begin
			RAL_hazard = 0;
		end
	
	end

endmodule