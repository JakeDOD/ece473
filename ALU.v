// file ALU.v

module ALU(
	input [31:0] instr,
	input [31:0] a,b,
	output zero,
	output reg[31:0] out);
	
	wire[5:0] funct;
	wire[4:0] shamt;
	assign funct = instr[5:0];
	assign shamt = instr[10:6];
	
	// Stuff to take care of signedness
	wire [31:0] sub_ab;
	wire oflow_sub;
	wire slt;
	assign sub_ab = a - b;
	assign oflow_sub = (a[31] == b[31] && sub_ab[31] != a[31]) ? 1 : 0;
	assign slt = oflow_sub ? ~(a[31]) : a[31];
	
	always @(*) begin
		case(funct)
			// Add
			6'b100000: begin 
				out = a + b;
			end
			// Addu
			6'b100001: begin
				out = a + b;
			end
			// Sub
			6'b100010: begin 
				out = a - b;
			end
			// subu
			6'b100011: begin
				out = a - b;
			end
			// And
			6'b100100: begin
				out = a & b;
			end
			// OR
			6'b100101: begin
				out = a | b;
			end
			// NOR
			6'b100111: begin
				out = ~(a | b);
			end
			// slt
			6'b101010: begin
				out = {{31{1'b0}}, slt};
			end
			// sll
			6'b000000: begin
				if (instr[15:11] != 5'h0)begin 
					out = a <<< shamt;
				end
			end
			// srl
			6'b000010: begin
				out = a >>> shamt;
			end
			// sra
			6'b000011: begin
				out = a >> shamt;
			end
			// jr
			6'b001000: begin
				out = 0;
			end
			// nop
			6'b000000: begin
				if (instr[31:0] == 32'h0) begin
					out = 32'b0;
				end
			end
		endcase
	end
	
endmodule
	