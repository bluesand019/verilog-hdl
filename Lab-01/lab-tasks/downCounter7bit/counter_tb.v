`timescale 1ns/1ns

module counter_tb;
    reg clk;
    reg reset;
    wire [6:0] q;

    // Instantiate the Top-Level Down Counter
    counter uut (
        .CLK(clk),
        .Reset(reset),
        .q(q)
    );

    // Clock generation: 20ns period
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        // Waveform setup
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        // --- Step 1: System Reset ---
        reset = 1;
        #20; 

        // --- Step 2: Release Reset ---
        reset = 0;
        
        // --- Step 3: Observe Down-Counting ---
        // Let it run for 10 clock cycles
        #200; 

        $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | count(q)=%d", 
                 $time, clk, reset, q);
    end
endmodule