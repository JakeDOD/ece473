// file register_5.v

module register_5(
	input wire clock,
	input wire reset,
	input wire[4:0] data_in,
	output reg[4:0] data_out);
	
	initial begin
		data_out = 5'hf;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			data_out <= 5'h0;
		end else begin
			data_out <= data_in;
		end
	end
	
endmodule