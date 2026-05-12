`timescale 1ns/1ps

module register7bit_tb;
    reg clk;
    reg rst;
    reg [6:0] d;
    wire [6:0] q;

    // Instantiate the register7bit module
    register7bit uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // 1. Fixed Clock Generation (Repeating)
    initial clk = 0;
    always #5 clk = ~clk; 

    // 2. Test sequence
    initial begin
        // Setup for GTKWave
        $dumpfile("register7bit.vcd");
        $dumpvars(0, register7bit_tb);

        // Initialize inputs
        rst = 1; 
        d = 7'b1010101; 

        #10; // Wait 10 units (rst is high during first posedge)
        rst = 0; // Release reset

        #10; // Q should catch d = 7'b1010101 here
        d = 7'b0101010; // Change data

        #10; // Q should catch the new data here
        $finish; 
    end
    
    // Optional: Monitor output to console
    initial begin
        $monitor("Time=%0t | rst=%b | d=%b | q=%b", $time, rst, d, q);
    end
endmodule