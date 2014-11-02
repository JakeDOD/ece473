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
		if (instruction[31:26] == 6'b000000) begin
			RegDst = 1; 
			ALUOp = 2'b10;
			ALUSrc = 0;
			Branch = 0;
			MemRead = 0;
			MemWrite = 0;
			RegWrite = 1;
			MemtoReg = 0;
		end else begin
			RegWrite = 0;
		end
	end	
	
endmodule