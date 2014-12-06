// file EX_MEM.v

module EX_MEM(
	// Pipeline register control signals
	input wire clock,
	input wire bubble,
	
	// Control signal inputs
	input wire MemtoReg_in,
	input wire RegWrite_in,
	input wire MemWrite_in,
	input wire MemRead_in,
	input wire Branch_in,
	
	// Operand inputs
	input wire[31:0] branch_address_in,
	input wire		  ALU_zero_in,
	input wire[31:0] ALU_result_in,
	input wire[31:0] Read_data2_in,
	input wire[4:0]  Dst_Reg_in,
	
	// Control signal outputs
	output reg MemtoReg_out,
	output reg RegWrite_out,
	output reg MemWrite_out,
	output reg MemRead_out,
	output reg Branch_out,
	
	// Operand outputs
	output reg[31:0] branch_address_out,
	output reg		  ALU_zero_out,
	output reg[31:0] ALU_result_out,
	output reg[4:0]  Dst_Reg_out,
	output reg[31:0] RT_out);
	
	// Initialize all the outputs to 0
	initial begin
		Branch_out= 0;
		MemRead_out = 0;
		MemWrite_out = 0;
		RegWrite_out = 0;
		MemtoReg_out = 0;
		
		branch_address_out = 32'h00000000;
		ALU_zero_out = 0;
		ALU_result_out = 32'h00000000;
		Dst_Reg_out = 5'b00000;
		RT_out = 32'd0;
	end
	
	always @(negedge clock) begin
		if (bubble == 1'b1) begin
			Branch_out <= 0;
			MemRead_out <= 0;
			MemWrite_out <= 0;
			RegWrite_out <= 0;
			MemtoReg_out <= 0;
			
			branch_address_out <= 32'h00000000;
			ALU_zero_out <= 0;
			ALU_result_out <= 32'h00000000;
			Dst_Reg_out <= 5'b00000;
			RT_out <= 32'd0;
		end 
/*		if (stall == 1'b1) begin
			Branch_out <= Branch_out;
			MemRead_out <= MemRead_out;
			MemWrite_out <= MemWrite_out;
			RegWrite_out <= RegWrite_out;
			MemtoReg_out <= MemtoReg_out;
			
			branch_address_out <= branch_address_out;
			ALU_zero_out <= ALU_zero_out;
			ALU_result_out <= ALU_result_out;
			Dst_Reg_out <= Dst_Reg_out;
		end */else begin
			Branch_out <= Branch_in;
			MemRead_out <= MemRead_in;
			MemWrite_out <= MemWrite_in;
			RegWrite_out <= RegWrite_in;
			MemtoReg_out <= MemtoReg_in;
			
			branch_address_out <= branch_address_in;
			ALU_zero_out <= ALU_zero_in;
			ALU_result_out <= ALU_result_in;
			Dst_Reg_out <= Dst_Reg_in;
			RT_out <= Read_data2_in;
		end
	end
	
endmodule