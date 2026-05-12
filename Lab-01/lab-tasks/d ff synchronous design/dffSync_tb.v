`timescale 1ns/1ns

module dffSync_tb;
    // 1. Declare signals
    reg clk;
    reg reset;
    reg en;
    reg d;
    wire q;

    // 2. Instantiate the Unit Under Test (UUT)
    dffSync uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .d(d),
        .q(q)
    );

    // 3. Clock Generation (Fixed initialization)
    initial clk = 0; 
    always #10 clk = ~clk; // 20ns period

    // 4. Stimulus Process
    initial begin
        // Setup for GTKWave
        $dumpfile("dffSync_sim.vcd");
        $dumpvars(0, dffSync_tb);

        // --- Initial State ---
        reset = 1; en = 0; d = 0;
        #20; // Hold reset through first clock edge

        // --- Release Reset ---
        reset = 0; 
        #20;

        // --- Test 1: Load Data (Enable = 1) ---
        d = 1; en = 1;
        #20; // Q should become 1 after the posedge

        // --- Test 2: Hold Data (Enable = 0) ---
        d = 0; en = 0; 
        #20; // Q should stay 1 because enable is low

        // --- Test 3: Change Data (Enable = 1) ---
        en = 1;
        #20; // Q should become 0

        // --- Test 4: Asynchronous Reset Check ---
        // Since your sensitivity list includes 'posedge reset'
        #5; reset = 1; 
        #15; // Q should drop to 0 immediately

        $finish;
    end

    // 5. Monitor
    initial begin
        $monitor("Time=%0t | clk=%b res=%b en=%b d=%b | q=%b", 
                 $time, clk, reset, en, d, q);
    end

endmodule