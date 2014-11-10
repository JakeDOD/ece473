// file ID_EX.v

module ID_EX(
	// Pipeline register control signals
	input wire clock,
	input wire reset,
	
	// Control signal inputs
	input wire[31:0] Jump_addr_in,
	input wire[1:0] Jump_in,
	input wire MemtoReg_in,
	input wire RegWrite_in,
	input wire MemWrite_in,
	input wire MemRead_in,
	input wire Branch_in,
	input wire ALUSrc_in,
	input wire[31:0] instr_in,
	input wire RegDst_in,
	
	input wire[31:0] pc_plus_4_in,
	
	// Operand inputs
	input wire[31:0] Read_data1_in,
	input wire[31:0] Read_data2_in,
	input wire[31:0] Sign_extended_imm_in,
	input wire[4:0]  RT_in,
	input wire[4:0]  RD_in,
	input wire[4:0]  RS_in,
	
	// Control signal outputs
	output reg[31:0] Jump_addr_out,
	output reg[1:0] Jump_out,
	output reg MemtoReg_out,
	output reg RegWrite_out,
	output reg MemWrite_out,
	output reg MemRead_out,
	output reg Branch_out,
	output reg ALUSrc_out,
	output reg[31:0] instr_out,
	output reg RegDst_out,
	
	output reg[31:0] pc_plus_4_out,
	
	// Operand outputs
	output reg[31:0] ALUOperand1_out,
	output reg[31:0] ALUOperand2_out,
	output reg[31:0] Immediate_out,
	output reg[4:0]  RT_out,
	output reg[4:0]  RD_out,
	output reg[4:0]  RS_out);
	
	// Initialize all the outputs to 0
	initial begin
		RegDst_out = 0;
		ALUSrc_out = 0;
		Branch_out= 0;
		MemRead_out = 0;
		MemWrite_out = 0;
		RegWrite_out = 0;
		MemtoReg_out = 0;
		Jump_out = 2'b00;
		
		pc_plus_4_out = 32'h00000000;
		
		ALUOperand1_out = 32'h00000000;
		ALUOperand2_out = 32'h00000000;
		Immediate_out =   32'h00000000;
		RT_out = 5'b00000;
		RD_out = 5'b00000;
		RS_out = 5'b00000;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			RegDst_out <= 0;
			instr_out <= 6'b000000;
			ALUSrc_out <= 0;
			Branch_out <= 0;
			MemRead_out <= 0;
			MemWrite_out <= 0;
			RegWrite_out <= 0;
			MemtoReg_out <= 0;
			Jump_out <= 2'b00;
			
			pc_plus_4_out = 32'h00000000;
			
			ALUOperand1_out <= 32'h00000000;
			ALUOperand2_out <= 32'h00000000;
			Immediate_out   <= 32'h00000000;
			RT_out <= 5'b00000;
			RD_out <= 5'b00000;
			RS_out <= 5'b00000;
		end else begin
			RegDst_out <= RegDst_in;
			instr_out  <= instr_in;
			ALUSrc_out <= ALUSrc_in;
			Branch_out <= Branch_in;
			MemRead_out <= MemRead_in;
			MemWrite_out <= MemWrite_in;
			RegWrite_out <= RegWrite_in;
			MemtoReg_out <= MemtoReg_in;
			Jump_out <= Jump_in;
			
			pc_plus_4_out = pc_plus_4_in;
			
			ALUOperand1_out <= Read_data1_in;
			ALUOperand2_out <= Read_data2_in;
			Immediate_out <=   Sign_extended_imm_in;
			RT_out <= RT_in;
			RD_out <= RD_in;
			RS_out <= RS_in;
		end
	end
	
endmodule