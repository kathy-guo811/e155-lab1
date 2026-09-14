// Kathy Guo
// kaguo@g.hmc.edu
// 9/6/2026
// Testbench for lab1_kg.


`timescale 1 ns/1 ns

module lab1_kg_tb();
	logic [3:0] s;
	logic rst;
	logic [2:0] led;
	logic [6:0] segment;

    lab1_kg dut (
        .s(s),
		.rst(rst),
        .led(led),
		.segment(segment)
    );

  // apply stimuli and check outputs
	initial begin
		rst = 0;

			// test 1
			s = 4'b0000;                // setup inputs
			#10;                        // wait required time
			assert (led[1:0] == 2'b00)       // check outputs
				$display("PASSED! The led controller behaves as desired at s = 4'b0000.");
			else 
				$error("FAILED! The led controller behaves incorrectly at s = 4'b0000."); 
				
			// test 2
			s = 4'b0101;
			#10;
			assert (led[1:0] == 2'b01)
				$display("PASSED! The led controller behaves as desired at s = 4'b0101.");
			else 
				$error("FAILED! The led controller behaves incorrectly at s = 4'b0101."); 
			
			// test 3
			s = 4'b1010;
			#10;
			assert (led[1:0] == 2'b01)
				$display("PASSED! The led controller behaves as desired at s = 4'b1010.");
			else 
				$error("FAILED! The led controller behaves incorrectly at s = 4'b1010."); 
				
			// test 4
			s = 4'b1111;
			#10;
			assert (led[1:0] == 2'b10)
				$display("PASSED! The led controller behaves as desired at s = 4'b1111.");
			else 
				$error("FAILED! The led controller behaves incorrectly at s = 4'b1111."); 
			
			// test 5: seven-segment display module connection check #1
			s = 4'b0000;
			#10;
			assert (segment == 7'b1000000)      // check outputs
				$display("PASSED! The top module successfully connects to the seven_segment_display module.");
			else 
				$error("FAILED! The top module does not connect to the seven_segment_display module."); 
				
			// test 6: seven-segment display module connection check #2
			s = 4'b1111;
			#10;
			assert (segment == 7'b0001110)      // check outputs
				$display("PASSED! The top module successfully connects to the seven_segment_display module.");
			else 
				$error("FAILED! The top module does not connect to the seven_segment_display module."); 
				
			// test 7: HSOSC to blinker module connection
			rst = 0;	// reset blinker
			#10;		
			rst = 1;	// release blinker reset
			#100;		// observe blinker clock
			assert (dut.b.counter > 0)
				$display("PASSED! HSOSC is driving blinker.");
		$stop;
	end
endmodule