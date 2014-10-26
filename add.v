// Add

module add(
	input wire [31:0] port1, port2,
	output reg [31:0] out);
	
	always @(port1 or port2) begin
		out = port1 + port2;
	end
endmodule