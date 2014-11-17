// file control.v

module control(
	input wire[31:0] instruction,
	
	output reg[1:0] Jump,
	output reg MemtoReg,
	output reg RegWrite,
	output reg MemWrite,
	output reg MemRead,
	output reg Branch,
	output reg ALUSrc,
	output reg[3:0] ALU_ctrl,
	output reg RegDst);
	
	always @* begin
		// If R-type instruction
		if (instruction[31:26] == 6'b000000) begin
			RegDst = 0;
			ALUSrc = 0;
			Branch = 0;
			MemRead = 0;
			MemWrite = 0;
			RegWrite = 1;
			MemtoReg = 0;
			Jump = 2'b00;
			// If jr
			if (instruction[5:0] == 6'b001000) begin
				Jump = 2'b01;
				RegWrite = 0;
			end
			// check the funct code
			case(instruction[5:0])
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
					begin								// *
						ALU_ctrl = 4'b0110;
					end
				6'b000000:  						// sll and nop
					begin
						if (instruction[15:11] != 5'b00000) begin		// if write register not 0 (never write to $0 anyway)
							ALU_ctrl = 4'b0111;
						end else begin
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
					end
			endcase
		// If j
		end else if (instruction[31:26] == 6'b000010) begin
			RegDst = 0;
			ALUSrc = 0;
			Branch = 0;
			MemRead = 0;
			MemWrite = 0;
			RegWrite = 0;
			MemtoReg = 0;
			Jump = 2'b10;
		end else begin
			RegWrite = 0;
		end
	end	
	
endmodule