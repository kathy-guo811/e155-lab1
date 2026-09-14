// Kathy Guo
// kaguo@g.hmc.edu
// 9/6/2026
// Top level module for E155_lab1 that turns two LEDs on and off based on switch inputs, 
// defines a high-speed oscillator, and instantiates blinker and seven_segment_display modules.


module lab1_kg(
	input logic [3:0] s,
	input logic rst,
	output logic [2:0] led,
	output logic [6:0] segment
);

	logic int_osc;
	
	// LED0 and LED1 output
	assign led[0] = s[1] ^ s[0];
	assign led[1] = s[3] & s[2];
	
	// Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b01))
		hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

	// Counter that blinks LED2
	blinker b (
		.clk(int_osc),
		.reset(rst),
		.enable(1'b1),  // tied to constant so always enabled
		.led(led[2])
	);

	// 7-segment LED output
	seven_segment_display d(
		.sw6 (s),
		.seg (segment)
	);

endmodule
