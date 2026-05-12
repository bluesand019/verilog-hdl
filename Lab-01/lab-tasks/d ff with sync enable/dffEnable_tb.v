`timescale 1ns/1ns

module dffEnable_tb;
    reg clk;
    reg reset;
    reg en;
    reg d;
    wire q;

    // Instantiate the design
    dffEnable circuit1 (clk, reset, en, d, q);

    // 1. Correct Clock Initialization and Generation
    initial clk = 0;
    always #10 clk = ~clk;

    // 2. Stimulus Block
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, dffEnable_tb);

        // INITIAL STATE: Reset active, Enable off
        reset = 1; en = 0; d = 0;
        #20; 

        // TEST 1: Release reset, set D=1, but KEEP ENABLE OFF
        // Q should stay 0 even though D is 1.
        reset = 0; en = 0; d = 1;
        #20;

        // TEST 2: TURN ENABLE ON
        // Q should finally become 1 on the next posedge clk.
        en = 1;
        #20;

        // TEST 3: Toggle D while enabled
        d = 0;
        #20;

        $finish;
    end

    // 3. Monitor for Console Output
    initial begin
        $monitor("time=%0t | clk=%b reset=%b en=%b d=%b | q=%b", 
                 $time, clk, reset, en, d, q);
    end

endmodule