// file ID_EX.v

module ID_EX(
	// Pipeline register control signals
	input wire clock,
	input wire bubble,
	input wire stall,
	
	// Control signal inputs
	input wire R_Ibar_type_in,
	input wire MemtoReg_in,
	input wire RegWrite_in,
	input wire MemWrite_in,
	input wire MemRead_in,
	input wire Branch_in,
	input wire[1:0] ALUSrc_in,
	input wire[3:0] ALU_ctrl_in,
	input wire RegDst_in,
	
	input wire[31:0] pc_plus_4_in,
	
	// Operand inputs
	input wire[31:0] Read_data1_in,
	input wire[31:0] Read_data2_in,
	input wire[31:0] Sign_extended_imm_in,
	input wire[4:0]  RT_in,
	input wire[4:0]  RD_in,
	input wire[4:0]  RS_in,
	input wire[4:0]  shamt_in,
	input wire[31:0] zero_ext_imm_in,
	input wire[31:0] upper_imm_in,
	
	// Control signal outputs
	output reg R_Ibar_type_out,
	output reg MemtoReg_out,
	output reg RegWrite_out,
	output reg MemWrite_out,
	output reg MemRead_out,
	output reg Branch_out,
	output reg[1:0] ALUSrc_out,
	output reg[3:0] ALU_ctrl_out,
	output reg RegDst_out,
	
	output reg[31:0] pc_plus_4_out,
	
	// Operand outputs
	output reg[31:0] ALUOperand1_out,
	output reg[31:0] ALUOperand2_out,
	output reg[31:0] sign_ext_imm_out,
	output reg[4:0]  RT_out,
	output reg[4:0]  RD_out,
	output reg[4:0]  RS_out,
	output reg[4:0]  shamt_out,
	output reg[31:0] zero_ext_imm_out,
	output reg[31:0] upper_imm_out);
	
	// Initialize all the outputs to 0
	initial begin
		RegDst_out = 0;
		ALUSrc_out = 0;
		Branch_out= 0;
		MemRead_out = 0;
		MemWrite_out = 0;
		RegWrite_out = 0;
		MemtoReg_out = 0;
		R_Ibar_type_out = 0;
		ALU_ctrl_out = 0;
		
		pc_plus_4_out = 32'h00000000;
		
		ALUOperand1_out = 32'h00000000;
		ALUOperand2_out = 32'h00000000;
		sign_ext_imm_out =   32'h00000000;
		RT_out = 5'b00000;
		RD_out = 5'b00000;
		RS_out = 5'b00000;
		shamt_out = 5'b00000;
		zero_ext_imm_out = 32'h00000000;
		upper_imm_out = 32'h00000000;
	end
	
	always @(posedge clock) begin
		if (bubble == 1'b1) begin
			RegDst_out <= 0;
			ALU_ctrl_out <= 4'b0000;
			ALUSrc_out <= 0;
			Branch_out <= 0;
			MemRead_out <= 0;
			MemWrite_out <= 0;
			RegWrite_out <= 0;
			MemtoReg_out <= 0;
			R_Ibar_type_out <=0;
			
			pc_plus_4_out = 32'h00000000;
			
			ALUOperand1_out <= 32'h00000000;
			ALUOperand2_out <= 32'h00000000;
			sign_ext_imm_out<= 32'h00000000;
			RT_out <= 5'b00000;
			RD_out <= 5'b00000;
			RS_out <= 5'b00000;
			shamt_out <= 5'b00000;
			zero_ext_imm_out <= 32'h00000000;
			upper_imm_out <= 32'h00000000;
		end else if (stall == 1'b1) begin
			RegDst_out <= RegDst_out;
			ALU_ctrl_out  <= ALU_ctrl_out;
			ALUSrc_out <= ALUSrc_out;
			Branch_out <= Branch_out;
			MemRead_out <= MemRead_out;
			MemWrite_out <= MemWrite_out;
			RegWrite_out <= RegWrite_out;
			MemtoReg_out <= MemtoReg_out;
			R_Ibar_type_out <= R_Ibar_type_out;
			
			pc_plus_4_out = pc_plus_4_out;
			
			ALUOperand1_out <= ALUOperand1_out;
			ALUOperand2_out <= ALUOperand2_out;
			sign_ext_imm_out <= sign_ext_imm_out;
			RT_out <= RT_out;
			RD_out <= RD_out;
			RS_out <= RS_out;
			shamt_out <= shamt_out;
			zero_ext_imm_out <= zero_ext_imm_out;
			upper_imm_out <= upper_imm_out;
		end else begin
			RegDst_out <= RegDst_in;
			ALU_ctrl_out  <= ALU_ctrl_in;
			ALUSrc_out <= ALUSrc_in;
			Branch_out <= Branch_in;
			MemRead_out <= MemRead_in;
			MemWrite_out <= MemWrite_in;
			RegWrite_out <= RegWrite_in;
			MemtoReg_out <= MemtoReg_in;
			R_Ibar_type_out <= R_Ibar_type_in;
			
			pc_plus_4_out = pc_plus_4_in;
			
			ALUOperand1_out <= Read_data1_in;
			ALUOperand2_out <= Read_data2_in;
			sign_ext_imm_out <=   Sign_extended_imm_in;
			RT_out <= RT_in;
			RD_out <= RD_in;
			RS_out <= RS_in;
			shamt_out <= shamt_in;
			zero_ext_imm_out <= zero_ext_imm_in;
			upper_imm_out <= upper_imm_in;
		end
	end
	
endmodule