// file reg_file.v

module reg_file(
	input wire [4:0] read1,read2,writeAddr,
	input wire [31:0] writeData,
	input wire writeEn,reset,clock,
	input wire [4:0] readDebug,
	input wire clock_Debug,
	
	output wire [31:0] data1,data2,dataDebug);
	
	reg [31:0] rf [31:0];		// 32 registers 32 bits long
	integer i;
	
	reg [31:0] _data1, _data2,_dataDebug;
	
/*	initial begin
		for(i=0; i<32; i=i+1) begin
			rf[i] = i;
		end
	end
*/	
	always @(*) begin
		if (read1 == 5'd0)
			_data1 = 32'd0;
		else if ((read1 == writeAddr) && writeEn)
			_data1 = writeData;
		else
			_data1 = rf[read1][31:0];
	end

	always @(*) begin
		if (read2 == 5'd0)
			_data2 = 32'd0;
		else if ((read2 == writeAddr) && writeEn)
			_data2 = writeData;
		else
			_data2 = rf[read2][31:0];
	end
	
	always @(*) begin
		if (readDebug == 5'd0)
			_dataDebug = 32'd0;
		else if ((readDebug == writeAddr) && writeEn)
			_dataDebug = writeData;
		else
			_dataDebug = rf[readDebug][31:0];
	end

	assign data1 = _data1;
	assign data2 = _data2;
	assign dataDebug = _dataDebug;
	
	always @(posedge clock) begin
		if (writeEn == 1'b1) begin
			if (writeAddr != 32'h0) begin
				rf[writeAddr] <= writeData;
			end
		end
	end
	
endmodule