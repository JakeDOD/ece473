// file control.v

module control(
	input wire[31:0] instruction,
	
	output reg[1:0] Jump,
	output reg MemtoReg,
	output reg RegWrite,
	output reg MemWrite,
	output reg MemRead,
	output reg Branch,
	output reg ALUSrc,
	output reg[31:0] instr,
	output reg RegDst);
	
	always @* begin
		instr[31:0] = instruction[31:0];
		// If R-type instruction
		if (instruction[31:26] == 6'b000000) begin
			RegDst = 0;
			ALUSrc = 0;
			Branch = 0;
			MemRead = 0;
			MemWrite = 0;
			RegWrite = 1;
			MemtoReg = 0;
			Jump = 2'b00;
			// If jr
			if (instruction[5:0] == 6'b001000) begin
				Jump = 2'b01;
				RegWrite = 0;
			end
		// If j
		end else if (instruction[5:0] == 6'b000010) begin
			RegDst = 0;
			ALUSrc = 0;
			Branch = 0;
			MemRead = 0;
			MemWrite = 0;
			RegWrite = 0;
			MemtoReg = 0;
			Jump = 2'b10;
		end else begin
			RegWrite = 0;
		end
	end	
	
endmodule