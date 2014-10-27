// Add

module pc_add(
	input wire [31:0] port1,
	output reg [31:0] out);
	
	always @(port1) begin
		out = port1 + 4;
	end
endmodule