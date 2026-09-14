// Kathy Guo
// kaguo@g.hmc.edu
// 9/6/2026
// Testbench for blinker.


`timescale 1 ns/1 ns

module blinker_tb();
	logic clk;
	logic reset;
	logic enable;
	logic led;
	
	logic [22:0] saved_count;

    blinker #(.max_count(5)) dut(		// define max_count parameter to test counter reset after reaching max_count
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .led(led)
    );

	// generate clock
	always begin
		clk = 0; #5;
		clk = 1; #5;
	end

  // apply stimuli and check outputs
	initial begin

		// test 1: reset
		reset = 0;
		@(posedge clk);
		#1;
		assert (dut.counter == 0)		// check outputs
			$display("PASSED! Reset sets counter to 0.");
		else 
			$error("FAILED! Reset does not set counter to 0."); 
		
		reset = 1;
			
		// test 2: enable = 1
		enable = 1;
		@(posedge clk);			// wait for posedge of clk
		#1;						// wait for counter to update
		assert (dut.counter > 0)
			$display("PASSED! The counter increments when enable = 1.");
		else 
			$error("FAILED! The counter does not increment when enable = 1."); 
		
		// test 3: enable = 0
		enable = 0;
		@(posedge clk);
		#1;			
		saved_count = dut.counter;
		assert (dut.counter == saved_count)
			$display("PASSED! The counter holds when enable = 0.");
		else 
			$error("FAILED! The counter does not hold when enable = 0."); 
			
		// test 4: max count
		enable = 1;
		#40;		// wait long enough to get beyond max_count
		@(posedge clk);
		#1;	
		$display("Time = %0t ns, counter = %0d", $time, dut.counter);
		assert (dut.counter == 0)
			$display("PASSED! Counter resets to 0 after reaching max_count.");
		else 
			$error("FAILED! Counter does not reset to 0 after reaching max_count."); 

		#100 $stop;
	end
endmodule