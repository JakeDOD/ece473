// file reg_file.v

module reg_file(
	input wire [4:0] read1,read2,writeAddr,
	input wire [31:0] writeData,
	input wire writeEn,reset,clock,
	input wire [4:0] readDebug,
	input wire clock_Debug,
	
	output reg [31:0] data1,data2,dataDebug);
	
	reg [31:0] rf [31:0];		// 32 registers 32 bits long
	integer i;
	
	initial begin
		for(i=0; i<32; i=i+1) begin
			rf[i] = i;
		end
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			for(i=0; i<32; i=i+1) begin
				rf[i] <= 0;
			end
		end else if (writeEn == 1'b1) begin
			rf[writeAddr] <= writeData;
		end
	end
	
	always @(negedge clock) begin
		data1 <= rf[read1];
		data2 <= rf[read2];
	end
	
	always @(negedge clock_Debug) begin
		dataDebug <= rf[readDebug];
	end
	
endmodule