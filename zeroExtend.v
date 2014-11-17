// file zeroExtend.v

module zeroExtend(
	input wire [15:0] dataIn,
	output reg [31:0] dataOut);

	always @(*) begin
		dataOut = { {16{1'b0}}, dataIn[15:0] };
	end

endmodule