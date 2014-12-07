// RAM_addr_calc

// lui $a,$0,0xff		F D E M W
// ori $b,$a,0xff		  F D E M W
// lw  $c, 0($b)			 F D E M W

module RAM_Addr(
	input wire clock,
	input wire[31:0] IF_ID_instr,
	input wire[4:0] ID_EX_dstReg,
	input wire ID_EX_RegWrite,
	
	output reg RAM_addr_fwd);
	
	wire [5:0] IF_ID_opcode;
	wire [4:0] IF_ID_RS, IF_ID_RT, IF_ID_RD;
	
	assign IF_ID_opcode = IF_ID_instr[31:26];
	assign IF_ID_RS = IF_ID_instr[25:21];
	assign IF_ID_RT = IF_ID_instr[20:16];
	assign IF_ID_RD = IF_ID_instr[15:11];
	
	wire IF_ID_memRead;
	assign IF_ID_memRead= (IF_ID_opcode == 6'b100011);
	
	wire [4:0] IF_ID_dstReg;
	assign IF_ID_dstReg = (IF_ID_opcode == 6'd0) ? IF_ID_RD : IF_ID_RT;
	
	always @(negedge clock) begin
		if (ID_EX_RegWrite && ID_EX_dstReg == IF_ID_RS && IF_ID_memRead) begin
			RAM_addr_fwd = 1;
		end else begin
			RAM_addr_fwd = 0;
		end
	end
	
endmodule