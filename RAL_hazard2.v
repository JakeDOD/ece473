// file RAL_hazard2

module RAL_hazard2(
	input wire clock,
	input wire ID_EX_memRead,
	input wire[4:0] ID_EX_dstReg,
	input wire[31:0] IF_ID_instr,
	input wire[31:0] pc,
	
	output reg RAL_hazard);
	
	initial begin
		RAL_hazard = 0;
	end
	
	wire [5:0] IF_ID_opcode;
	wire [4:0] IF_ID_RS, IF_ID_RT, IF_ID_RD;
	
	assign IF_ID_opcode = IF_ID_instr[31:26];
	assign IF_ID_RS = IF_ID_instr[25:21];
	assign IF_ID_RT = IF_ID_instr[20:16];
	assign IF_ID_RD = IF_ID_instr[15:11];
	
	wire [4:0] IF_ID_dstReg;
	assign IF_ID_dstReg = (IF_ID_opcode == 6'd0) ? IF_ID_RD : IF_ID_RT;
	
	always @(negedge clock) begin
		if (ID_EX_memRead && ID_EX_dstReg == IF_ID_RS) begin
			RAL_hazard = 1;
		end else if (ID_EX_memRead && ID_EX_dstReg == IF_ID_RT) begin
			RAL_hazard = 1;
		end else if (!ID_EX_memRead) begin
			RAL_hazard = 0;
		end
		
		if (pc == 32'd0) begin
			RAL_hazard = 0;
		end
	
	end

endmodule