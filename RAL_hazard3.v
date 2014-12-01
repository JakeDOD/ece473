// file RAL_hazard3

module RAL_hazard3(
	input wire clock,
	input wire[31:0] IF_ID_instr,
	input wire[31:0] F_instr,
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
	wire IF_ID_memRead;
	assign IF_ID_memRead= (IF_ID_opcode == 6'b100011);
	assign IF_ID_dstReg = (IF_ID_opcode == 6'd0) ? IF_ID_RD : IF_ID_RT;
	
	wire [5:0] F_opcode;
	wire [4:0] F_RS, F_RT;
	
	assign F_opcode = F_instr[31:26];
	assign F_RS = F_instr[25:21];
	assign F_RT = F_instr[20:16];
	
	always @(negedge clock) begin
		if (IF_ID_memRead) begin
			if (IF_ID_dstReg == F_RS || IF_ID_dstReg == F_RT) begin
				RAL_hazard = 1;
			end
		end else begin
				RAL_hazard = 0;
		end
			
		if (pc == 32'd0) begin
			RAL_hazard = 0;
		end

	end

endmodule