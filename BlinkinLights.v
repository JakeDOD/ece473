// BlinkinLights.v

module BlinkinLights(
	input wire clock,
	output reg[26:0] leds);
	
	initial begin
		leds = 1;
	end
	
	always @(clock) begin
		if (leds == 134217728) begin
			leds = 0;
		end else begin
			leds = leds + 1;
		end
	end
	
endmodule