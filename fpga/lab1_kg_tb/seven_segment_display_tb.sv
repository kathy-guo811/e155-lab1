// Kathy Guo
// kaguo@g.hmc.edu
// 9/6/2026
// Testbench for seven_segment_display


`timescale 1 ns/1 ns

module seven_segment_display_tb();
	logic [3:0] sw6;		// input from 4 DIP switches SW6
	logic [6:0] seg; 		// output from 7-seg display

    seven_segment_display dut (
        .sw6 (sw6),
		.seg (seg)
    );
	
  // apply stimuli and check outputs
	initial begin
		// test 1
		sw6 = 4'h0;      				// setup inputs
		#1;								// wait 1 ns
		assert (seg == 7'b1000000)      // check outputs
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
			
		// test 2
		sw6 = 4'h1;
		#1;
		assert (seg == 7'b1001111)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 3
		sw6 = 4'h2;
		#1;
		assert (seg == 7'b0100100)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
			
		// test 4
		sw6 = 4'h3;
		#1;
		assert (seg == 7'b0110000)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
			
		// test 5
		sw6 = 4'h4;
		#1;
		assert (seg == 7'b0011001)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 6
		sw6 = 4'h5;
		#1;
		assert (seg == 7'b0010010)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 7
		sw6 = 4'h6;
		#1;
		assert (seg == 7'b0000010)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 8
		sw6 = 4'h7;
		#1;
		assert (seg == 7'b1111000)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		
		// test 9
		sw6 = 4'h8;
		#1;
		assert (seg == 7'b0000000)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 10
		sw6 = 4'h9;
		#1;
		assert (seg == 7'b0011000)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 11
		sw6 = 4'hA;
		#1;
		assert (seg == 7'b0001000)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly.");
		
		// test 12
		sw6 = 4'hB;
		#1;
		assert (seg == 7'b0000011)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 13
		sw6 = 4'hC;
		#1;
		assert (seg == 7'b1000110)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 14
		sw6 = 4'hD;
		#1;
		assert (seg == 7'b01100001)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 15
		sw6 = 4'hE;
		#1;
		assert (seg == 7'b0000110)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly."); 
		
		// test 16
		sw6 = 4'hF;
		#1;
		assert (seg == 7'b0001110)
			$display("PASSED! The led display behaves as desired.");
		else 
			$error("FAILED! The led display behaves incorrectly.");  

		#100 $stop;
	end
endmodule