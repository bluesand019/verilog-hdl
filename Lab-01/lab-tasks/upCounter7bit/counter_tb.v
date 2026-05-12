`timescale 1ns/1ns

module counter_tb;
    // 1. Signal Declarations
    reg clk;
    reg reset;
    wire [6:0] q;

    // 2. Instantiate the Top-Level Counter
    // This connects the internal register and addOne modules
    counter counter_circuit1 (
        .CLK(clk),
        .Reset(reset),
        .q(q)
    );

    // 3. Clock Generation
    // Period is 20ns (10ns high, 10ns low)
    initial clk = 0; // Crucial fix: initialize to 0
    always #10 clk = ~clk;

    // 4. Stimulus Block
    initial begin
        // Setup waveform dumping for GTKWave
        $dumpfile("counter_sim.vcd");
        $dumpvars(0, counter_tb);

        // --- Step 1: Initial Reset ---
        // Forces the internal register to 0000000
        reset = 1;
        #20; 

        // --- Step 2: Release Reset ---
        // The counter should begin incrementing on the next posedge clk
        reset = 0;
        
        // --- Step 3: Run Simulation ---
        // Let it run for several clock cycles to see it count: 0, 1, 2, 3...
        #100; 

        // --- Step 4: Test Asynchronous Reset mid-count ---
        reset = 1;
        #10;
        reset = 0;
        
        #40;
        $finish;
    end

    // 5. Console Monitor
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | count(q)=%d (%b)", 
                 $time, clk, reset, q, q);
    end

endmodule

// command
// iverilog -o output counter.v counter_tb.v register7bit.v adder.v