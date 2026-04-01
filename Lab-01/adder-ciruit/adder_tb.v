`timescale 1ns/1ps

module adder_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    wire [4:0] sum;

    // Instantiate the DUT (Device Under Test)
    adder dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Optional: dump waveforms
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_tb);

        // Test cases
        a = 4'd0;  b = 4'd0;  #10;
        a = 4'd3;  b = 4'd4;  #10;
        a = 4'd7;  b = 4'd8;  #10;
        a = 4'd15; b = 4'd1;  #10;

        $finish;
    end

    // Monitor values
    initial begin
        $monitor("time=%0t a=%d b=%d sum=%d", $time, a, b, sum);
    end

endmodule
