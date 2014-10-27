// file register.v

module register(
	input wire clock,
	input wire reset,
	input wire[31:0] data_in,
	output reg[31:0] data_out);
	
	initial begin
		data_out = 32'h00000000;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			data_out <= 32'h00000000;
		end else begin
			data_out <= data_in;
		end
	end
	
endmodule