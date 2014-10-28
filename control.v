// file control.v

module control(
	input wire[31:0] instruction,
	
	output reg MemtoReg,
	output reg RegWrite,
	output reg MemWrite,
	output reg MemRead,
	output reg Branch,
	output reg ALUSrc,
	output reg[1:0] ALUOp,
	output reg RegDst);
	
	
endmodule