// file PC.v

module PC(
	input wire clock,
	input wire reset,
	input wire[31:0] pc_in,
	output reg[31:0] pc_out);
	
	initial begin
		pc_out = 32'h00000000 - 4;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			pc_out <= 32'h00000000 - 4;
		end else begin
			pc_out <= pc_in;
		end
	end
	
endmodule