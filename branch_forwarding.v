// file branch_forwarding.v

module branch_forwarding(
	input wire clock,
	input wire IF_ID_RegWrite, ID_EX_RegWrite,
	input wire [31:0] F_instr,
	input wire [31:0] IF_ID_instr,
	input wire [4:0]  ID_EX_dstReg,
	input wire ID_EX_branch,
	input wire [31:0] pc,
	
	output reg cmp_forwarda, cmp_forwardb,
	output reg stall);
	
	reg prevBranch = 0;
	
	wire [5:0] F_opcode;
	wire [4:0] F_RS, F_RT;
	wire F_branch;
	
	assign F_opcode = F_instr[31:26];
	assign F_RS = F_instr[25:21];
	assign F_RT = F_instr[20:16];
	assign F_branch = (F_opcode == 6'b000100) || (F_opcode == 6'b000101) || (F_opcode == 6'b000111) || (F_opcode == 6'b000001);
	
	wire [5:0] IF_ID_opcode;
	wire [4:0] IF_ID_RS, IF_ID_RT, IF_ID_RD;
	
	assign IF_ID_opcode = IF_ID_instr[31:26];
	assign IF_ID_RS = IF_ID_instr[25:21];
	assign IF_ID_RT = IF_ID_instr[20:16];
	assign IF_ID_RD = IF_ID_instr[15:11];
	
	wire [4:0] IF_ID_dstReg;
	assign IF_ID_dstReg = (IF_ID_opcode == 6'd0) ? IF_ID_RD : IF_ID_RT;
	
	initial begin
		stall = 0;
	end
	
	always @(negedge clock) begin
		cmp_forwarda = 0;
		cmp_forwardb = 0;
		if (F_branch == 1'b1) begin
			if (IF_ID_dstReg == F_RS || IF_ID_dstReg == F_RT) begin
				stall = 1;
			end
			if (ID_EX_dstReg == F_RS) begin
				stall = 0;
				cmp_forwarda = 1;
			end
			if (ID_EX_dstReg == F_RT) begin
				stall = 0;
				cmp_forwardb = 1;
			end
		end else begin
			stall = 0;
		end
		
		if (pc == 32'd0) begin
			stall = 0;
		end
	end
	
/*	
	always @(*) begin
		if (ID_EX_RegWrite && (ID_EX_dst != 0) && (ID_EX_dst == RS)) begin
			stall = 1;
			prevBranch = branch_in;
			branch_out = 0;
		end else if (EX_MEM_RegWrite && (EX_MEM_dst != 0) && (EX_MEM_dst == RS)) begin
			stall = 0;
			cmp_forwarda = 2'b01;
			branch_out = prevBranch;
			prevBranch = 0;
		end else begin
			stall = 0;
			cmp_forwarda = 2'b00;
			branch_out = branch_in;
		end
		
		if (ID_EX_RegWrite && (ID_EX_dst != 0) && (ID_EX_dst == RT)) begin
			stall = 1;
			prevBranch = branch_in;
		end else if (EX_MEM_RegWrite && (EX_MEM_dst != 0) && (EX_MEM_dst == RT)) begin
			stall = 0;
			cmp_forwardb = 2'b01;
			branch_out = prevBranch;
			prevBranch = 0;
		end else begin
			stall = 0;
			cmp_forwardb = 2'b00;
			branch_out = branch_in;
		end
	end
	*/
endmodule
	