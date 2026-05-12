`timescale 1ns/1ns

module dffReset_tb;
    reg clk, reset, d;
    wire q;

    // Instantiate your D-FF (Make sure the module name matches your design)
    dffReset circuit1 (clk, reset, d, q);

    // FIX: Clock initialization and generation
    initial clk = 0; 
    always #10 clk = ~clk;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, dffReset_tb);

        // Stimulus
        reset = 1; d = 0; #20; // Hold reset for 20ns
        reset = 0; d = 1; #20; // Release reset, set D high
        
        $finish;
    end

    initial begin
        $monitor("clk=%b, reset=%b, d=%b, q=%b", clk, reset, d, q);
    end
endmodule