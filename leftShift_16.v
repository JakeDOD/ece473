// file leftShift_16.v

module leftShift_16(
	input wire [15:0] dataIn,
	output reg [31:0] dataOut);

	always @(dataIn) begin
		dataOut = { dataIn[15:0],{16{1'b0}} };
	end

endmodule