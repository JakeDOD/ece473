// file signExtend.v

module signExtend(
	input wire [4:0] dataIn,
	output reg [31:0] dataOut);

	always @(dataIn) begin
		if (dataIn[4] == 1'b1) begin
			dataOut = { {27{dataIn[4]}}, dataIn[4:0] };
		end
	end

endmodule