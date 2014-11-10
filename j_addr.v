// file j_addr.v

module j_addr(
	input wire[25:0] offset,
	input wire[3:0]  upper_pc_plus_4,
	
	output reg[31:0] jump_address);
	
	always @(*) begin
		jump_address = {upper_pc_plus_4[3:0],(offset << 2)};
	end
	
endmodule