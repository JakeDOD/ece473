// file leftShift.v

module leftShift(
	input wire [31:0] dataIn,
	output reg [31:0] dataOut);
	
	always @(dataIn) begin
		dataOut = dataIn << 2;
	end
	
endmodule