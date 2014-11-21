// clock counter

module count(clock,reset,c0,c1,c2,c3);
	input wire clock,reset;
	
	output reg [3:0] c0;
	output reg [3:0] c1;
	output reg [3:0] c2;
	output reg [3:0] c3;
	
	integer count = 0;
	integer tmp;
	
	always @(negedge clock) begin
		if (reset == 1'b1) begin 
			count <= 0;
		end else if (reset == 1'b0) begin
			count <= count + 1;
			c0 <= count % 10;
			c1 <= (count / 10) % 10;
			c2 <= (count / 100) % 10;
			c3 <= (count / 1000) % 10;
		end
		
	end

endmodule