// file ALU.v

module ALU(
	input [3:0] ALU_ctrl,
	input [31:0] a,b,
	input [4:0] shamt,
	output zero,
	output reg[31:0] out);
	
	// Stuff to take care of signedness
	wire [31:0] sub_ab;
	wire oflow_sub;
	wire slt_signed, slt_unsigned;
	assign sub_ab = a - b;
	assign oflow_sub = (a[31] != b[31] && sub_ab[31] != a[31]) ? 1 : 0;
	assign slt_signed = oflow_sub ? ~(a[31]) : sub_ab[31];
	assign slt_unsigned = a < b ? 1 : 0;
	
	always @(*) begin
		case(ALU_ctrl)
			// Add
			4'b0001: out = a + b;
			// Addu
			4'b0001: out = a + b;
			// Sub
			4'b0010: out = a - b;
			// subu
			4'b0010: out = a - b;
			// And
			4'b0011: out = a & b;
			// OR
			4'b0100: out = a | b;
			// NOR
			4'b0101: out = ~(a | b);
			// slt signed
			4'b0110: out = {{31{1'b0}}, slt_signed};
			// slt unsigned
			4'b1010: out = {{31{1'b0}}, slt_unsigned};
			// sll
			4'b0111: out = b << shamt;
			// srl
			4'b1000: out = b >> shamt;
			// sra
			4'b1001: out = b >>> shamt;
			// nop, jr
			4'b0000: out = 32'b0;
		endcase
	end
	
endmodule
	