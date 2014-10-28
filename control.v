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
	
	always @* begin
		if (instruction[5:0] == 6'b100000) begin
			RegWrite = 1;
			MemtoReg = 0;
			RegDst = 0;
		end else begin
			RegWrite = 0;
		end
	end	
	
endmodule