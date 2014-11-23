// file branch_forwarding.v

module branch_forwarding(
	input wire clock,
	input wire ID_EX_RegWrite,EX_MEM_RegWrite,
	input wire [4:0] RS, RT, ID_EX_dst, EX_MEM_dst,
	input wire branch_in,
	
	output reg [1:0] cmp_forwarda, cmp_forwardb,
	output reg stall, branch_out);
	
	reg prevBranch = 0;
	
	always @(*) begin
		if (ID_EX_RegWrite && (ID_EX_dst != 0) && (ID_EX_dst == RS)) begin
			stall = 1;
			prevBranch = branch_in;
			branch_out = 0;
		end else if (EX_MEM_RegWrite && (EX_MEM_dst != 0) && (EX_MEM_dst == RS)) begin
			stall = 0;
			cmp_forwarda = 2'b01;
			branch_out = prevBranch;
			prevBranch = 0;
		end else begin
			stall = 0;
			cmp_forwarda = 2'b00;
			branch_out = branch_in;
		end
		
		if (ID_EX_RegWrite && (ID_EX_dst != 0) && (ID_EX_dst == RT)) begin
			stall = 1;
			prevBranch = branch_in;
		end else if (EX_MEM_RegWrite && (EX_MEM_dst != 0) && (EX_MEM_dst == RT)) begin
			stall = 0;
			cmp_forwardb = 2'b01;
			branch_out = prevBranch;
			prevBranch = 0;
		end else begin
			stall = 0;
			cmp_forwardb = 2'b00;
			branch_out = branch_in;
		end
	end
	
endmodule
	