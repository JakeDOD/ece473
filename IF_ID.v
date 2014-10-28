// file IF_ID.v

module IF_ID(
	input wire clock,
	input wire reset,
	input wire[31:0] pc_plus_4_in,
	input wire[31:0] instruction_in,
	
	output reg[31:0] pc_plus_4_out,
	output reg[31:0] instruction_out);
	
	initial begin
		instruction_out = 32'h00000000;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			pc_plus_4_out <= 32'h00000000;
			instruction_out <= 32'h00000000;
		end else begin
			pc_plus_4_out <= pc_plus_4_in;
			instruction_out <= instruction_in;
		end
	end
	
endmodule