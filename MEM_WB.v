// file MEM_WB.v

module MEM_WB(
	// Pipeline register control signals
	input wire clock,
	input wire reset,
	
	// Control signal inputs
	input wire MemtoReg_in,
	input wire RegWrite_in,
	
	// Operand inputs
	input wire[31:0] RAM_read_data_in,
	input wire[31:0] ALU_result_in,
	input wire[4:0]  Dst_Reg_in,
	
	// Control signal outputs
	output reg MemtoReg_out,
	output reg RegWrite_out,
	
	// Operand outputs
	output reg[31:0] RAM_read_data_out,
	output reg[31:0] ALU_result_out,
	output reg[4:0]  Dst_Reg_out);
	
	// Initialize all the outputs to 0
	initial begin
		RegWrite_out = 0;
		MemtoReg_out = 0;
		
		RAM_read_data_out = 32'h00000000;
		ALU_result_out = 32'h00000000;
		Dst_Reg_out = 5'b00000;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			RegWrite_out <= 0;
			MemtoReg_out <= 0;
			
			RAM_read_data_out <= 32'h00000000;
			ALU_result_out <= 32'h00000000;
			Dst_Reg_out <= 5'b00000;
		end else begin
			RegWrite_out <= RegWrite_in;
			MemtoReg_out <= MemtoReg_in;
			
			RAM_read_data_out <= RAM_read_data_in;
			ALU_result_out <= ALU_result_in;
			Dst_Reg_out <= Dst_Reg_in;
		end
	end
	
endmodule