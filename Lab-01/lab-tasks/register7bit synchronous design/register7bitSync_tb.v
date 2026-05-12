`timescale 1ns/1ns

module register7bitSync_tb;
    // 1. Signals for Testbench
    reg clk;
    reg reset;
    reg [6:0] d;
    wire [6:0] q;

    // 2. Instantiate the Unit Under Test (UUT)
    register7bitSync uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // 3. Clock Generation: Toggles every 10ns (20ns period)
    initial clk = 0;
    always #10 clk = ~clk;

    // 4. Stimulus Process
    initial begin
        // Setup for GTKWave
        $dumpfile("register_sim.vcd");
        $dumpvars(0, register7bitSync_tb);

        // --- Step 1: Initialize with Reset ---
        reset = 1; d = 7'b0000000;
        #20; // Hold reset through first clock edge

        // --- Step 2: Release Reset and Load Data ---
        reset = 0; d = 7'b1010101; 
        #20; // Q should catch d at the next posedge (t=30)

        // --- Step 3: Change Input Data ---
        // Note: Q should not change until the next clock pulse
        d = 7'b0101010; 
        #20;

        // --- Step 4: Finalize ---
        #20;
        $finish;
    end

    // 5. Console Monitoring
    initial begin
        $monitor("Time=%0t | rst=%b | d=%b | q=%b", $time, reset, d, q);
    end

endmodule