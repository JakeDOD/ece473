// file signExtend.v

module signExtend(
	input wire [15:0] dataIn,
	output reg [31:0] dataOut);

	always @(dataIn) begin
		//if (dataIn[15] == 1'b1) begin
			dataOut = { {16{dataIn[15]}}, dataIn[15:0] };
		//end
	end

endmodule