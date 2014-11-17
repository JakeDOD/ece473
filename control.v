// file control.v

module control(
	input wire[31:0] instruction,
	
	output reg[1:0] Jump,			// 00 - no jump; 01 - jr; 10 - j and jal (address calculated the same way)
	output reg MemtoReg,
	output reg RegWrite,
	output reg MemWrite,
	output reg MemRead,
	output reg Branch,
	output reg[1:0] ALUSrc,
	output reg[3:0] ALU_ctrl,
	output reg RegDst,
	output wire[31:0] zero_32,		// goes to jal mux
	output wire[4:0]  r31);			// goes to jal mux
	
	assign zero_32 = 0;
	assign r31 = 5'b11111;
	
	always @* begin
		case (instruction[31:26])
//		if (instruction[31:26] == 6'b000000) begin
			6'b000000:		// If R-type instruction
				begin
					RegDst   = 0;
					ALUSrc   = 0;
					Branch   = 0;
					MemRead  = 0;
					MemWrite = 0;
					RegWrite = 1;
					MemtoReg = 0;
					Jump     = 2'b00;							// default Jump state
					
					// ALU_ctrl
					case(instruction[5:0])				// check the funct code
						6'b100000: 							// add
							begin 
								ALU_ctrl = 4'b0001;
							end
						6'b100001:							// addu
							begin
								ALU_ctrl = 4'b0001;
							end
						6'b100010:							// sub 
							begin
								ALU_ctrl = 4'b0010;
							end
						6'b100011: 							// subu
							begin
								ALU_ctrl = 4'b0010;
							end
						6'b100100:  						// and
							begin
								ALU_ctrl = 4'b0011;
							end
						6'b100101:  						// or
							begin
								ALU_ctrl = 4'b0100;
							end
						6'b100111:  						// nor
							begin
								ALU_ctrl = 4'b0101;
							end
						6'b101010:  						// slt
							begin	
								ALU_ctrl = 4'b0110;
							end
						6'b000000:  						// sll and nop
							begin
								// if sll
								if (instruction[15:11] != 5'b00000) begin		// if write register not 0 (never write to $0 anyway)
									ALU_ctrl = 4'b0111;
								end else begin				// nop
									ALU_ctrl = 4'b0000;
								end
							end
						6'b000010:  						// srl
							begin
								ALU_ctrl = 4'b1000;
							end
						6'b000011:  						// sra
							begin
								ALU_ctrl = 4'b1001;
							end
						6'b001000:  						// jr
							begin
								ALU_ctrl = 4'b0000;
								Jump = 2'b01;
								RegWrite = 0;
							end
					endcase
				end
			6'b001100:		// andi
				begin
					RegDst   = 1;			// destination is Rt
					ALUSrc[1:0]= 2'b01;		// ZeroExtImm
					Branch   = 0;
					MemRead  = 0;
					MemWrite = 0;
					RegWrite = 1;
					MemtoReg = 0;
					Jump     = 2'b00;
					ALU_ctrl = 4'b0011;
				end
			6'b001101:		// ori
				begin
					RegDst   = 1;			// destination is Rt
					ALUSrc[1:0]= 2'b01;		// ZeroExtImm
					Branch   = 0;
					MemRead  = 0;
					MemWrite = 0;
					RegWrite = 1;
					MemtoReg = 0;
					Jump     = 2'b00;
					ALU_ctrl = 4'b0100;
				end
			6'b001010:		// slti
				begin
					RegDst   = 1;			// destination is Rt
					ALUSrc[1:0]= 2'b10;		// SignExtImm
					Branch   = 0;
					MemRead  = 0;
					MemWrite = 0;
					RegWrite = 1;
					MemtoReg = 0;
					Jump     = 2'b00;
					ALU_ctrl = 4'b0110;
				end
			6'b001000:		// addi
				begin
					RegDst   = 1;			// destination is Rt
					ALUSrc[1:0]= 2'b10;		// SignExtImm
					Branch   = 0;
					MemRead  = 0;
					MemWrite = 0;
					RegWrite = 1;
					MemtoReg = 0;
					Jump     = 2'b00;
					ALU_ctrl = 4'b0001;
				end
			6'b001001:		// addiu
				begin
					RegDst   = 1;			// destination is Rt
					ALUSrc[1:0]= 2'b10;		// SignExtImm
					Branch   = 0;
					MemRead  = 0;
					MemWrite = 0;
					RegWrite = 1;
					MemtoReg = 0;
					Jump     = 2'b00;
					ALU_ctrl = 4'b0001;
				end
			6'b000100:		// beq
				begin
				
				end
			6'b000101:		// bne
				begin
				
				end
			6'b000111:		// bgtz
				begin
				
				end
			6'b000001:		// bgez
				begin
				
				end
			6'b100011:		// lw
				begin
				
				end
			6'b101011:		// sw
				begin
				
				end
			6'b001111:		// lui
				begin
				
				end
//		end else if (instruction[31:26] == 6'b000010) begin
			6'b000010:		// If j
				begin
					RegDst = 0;
					ALUSrc = 0;
					Branch = 0;
					MemRead = 0;
					MemWrite = 0;
					RegWrite = 0;
					MemtoReg = 0;
					Jump = 2'b10;
					ALU_ctrl = 4'b0000;					// ALU doesn't need to do anything for jump
				end
			6'b000011:		// If jal
				begin
					RegDst = 0;
					ALUSrc = 0;
					Branch = 0;
					MemRead = 0;
					MemWrite = 0;
					RegWrite = 1;
					MemtoReg = 0;
					Jump = 2'b11;
					ALU_ctrl = 4'b0001;					// faking an add instruction to write pc+4 to $31
				end
//		end else begin
			default:
				begin
					RegWrite = 0;
				end
//		end
		endcase
	end	
	
endmodule