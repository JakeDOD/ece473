// file ALU.v

module ALU(
	input [31:0] instr,
	input [31:0] a,b,
	output zero,
	output reg[31:0] out);
	
	wire[5:0] funct;
	integer shamt = 0;
	assign funct = instr[5:0];
//	assign shamt = instr[10:6];
	
	// Stuff to take care of signedness
	wire [31:0] sub_ab;
	wire oflow_sub;
	wire slt;
	assign sub_ab = a - b;
	assign oflow_sub = (a[31] == b[31] && sub_ab[31] != a[31]) ? 1 : 0;
	assign slt = oflow_sub ? ~(a[31]) : a[31];
	
	always @(*) begin
		shamt = instr[10:6];
		if (instr[15:11] != 5'h0) begin
			case(funct)
				// Add
				6'b100000: out = a + b;
				// Addu
				6'b100001: out = a + b;
				// Sub
				6'b100010: out = a - b;
				// subu
				6'b100011: out = a - b;
				// And
				6'b100100: out = a & b;
				// OR
				6'b100101: out = a | b;
				// NOR
				6'b100111: out = ~(a | b);
				// slt
				6'b101010: out = {{31{1'b0}}, slt};
				// sll	if (instr[15:11] != 5'h0)begin out = a << shamt;	end
				6'b000000: out = b << shamt;
				// srl
				6'b000010: out = b >> shamt;
				// sra
				6'b000011: out = b >>> shamt;
				// jr
				6'b001000: out = 0;
				// nop	if (instr[31:0] == 32'h0) begin out = 32'b0; end
//				6'b000000: out = 32'b0;
			endcase
		end else begin
			out = 32'b0;
		end
	end
	
endmodule
	