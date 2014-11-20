// file ALU.v

module ALU(
	input [3:0] ALU_ctrl,
	input [31:0] a,b,
	input [4:0] shamt,
	output reg zero,
	output reg[31:0] out);
	
	// Stuff to take care of signedness
	wire [31:0] sub_ab;
	wire oflow_sub;
//	wire slt_signed,slt_unsigned;
	wire slt;
	assign sub_ab = a - b;
	assign oflow_sub = (a[31] != b[31] && sub_ab[31] == b[31]) ? 1 : 0;
//	assign oflow_sub = (a[31] == b[31] && sub_ab[31] != a[31]) ? 1 : 0;
//	assign slt_signed = oflow_sub ? ~(a[31]) : sub_ab[31];
	assign slt = oflow_sub ? ~(a[31]) : sub_ab[31];
//	assign slt = oflow_sub ? ~(a[31]) : a[31];
	
//	integer sub_ab = 0;
//	integer oflow_sub = 0;
//	integer slt = 0;
	
	always @(*) begin
//		sub_ab = a - b;
//		oflow_sub = (a[31] != b[31] && sub_ab[31] != a[31]) ? 1 : 0;
//		slt = oflow_sub ? ~(a[31]) : sub_ab[31];
		case(ALU_ctrl)
			// nop, jr
			4'b0000: 
				begin
					out = 32'b0;
				end
			// Add addu
			4'b0001: 
				begin
					out = a + b;
				end
			// Sub subu
			4'b0010:
				begin
					out = a - b;
				end
			// And
			4'b0011: 
				begin
					out = a & b;
				end
			// OR
			4'b0100: 
				begin
					out = a | b;
				end
			// NOR
			4'b0101: 
				begin
					out = ~(a | b);
				end
			// slt
			4'b0110: 
				begin
					out = {{31{1'b0}}, slt};
				end
			// sll
			4'b0111: 
				begin
					out = b << shamt;
				end
			// srl
			4'b1000: 
				begin
					out = b >> shamt;
				end
			// sra
			4'b1001: 
				begin
					out = b >>> shamt;
				end
			default:
				begin
					out = 32'b0;
				end
		endcase
	end
	
endmodule
	