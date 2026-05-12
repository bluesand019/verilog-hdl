`timescale 1ns/1ns

module counter_tb;
    reg clk;
    reg reset;
    wire [6:0] q;

    // Instantiate the single-module counter
    counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        $dumpfile("up_behavioral.vcd");
        $dumpvars(0, counter_tb);

        reset = 1; #20;
        reset = 0; #200;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | count=%d", $time, reset, q);
    end
endmodule