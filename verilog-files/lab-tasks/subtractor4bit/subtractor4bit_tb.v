`timescale 1ns/1ns

module subtractor4bit_tb;
    // Signals
    reg [3:0] A, B;
    reg bin;
    wire [3:0] diff;
    wire bout;

    // Instantiate Unit Under Test (UUT)
    subtractor4bit uut (
        .A(A), 
        .B(B), 
        .bin(bin), 
        .diff(diff), 
        .bout(bout)
    );

    initial begin
        // Setup for Waveform Viewing
        $dumpfile("sub4_sim.vcd");
        $dumpvars(0, subtractor4bit_tb);

        // Header for terminal output
        $display("Time |  A   -  B  - bin | Diff (Binary) | Bout");
        $display("-----------------------------------------------");

        // Case 1: 7 - 3 = 4
        // 0111 - 0011 = 0100
        A = 4'b0111; B = 4'b0011; bin = 1'b0; #10;

        // Case 2: 10 - 5 = 5
        // 1010 - 0101 = 0101
        A = 4'b1010; B = 4'b0101; bin = 1'b0; #10;

        // Case 3: 15 - 15 = 0
        // 1111 - 1111 = 0000
        A = 4'b1111; B = 4'b1111; bin = 1'b0; #10;

        // Case 4: 2 - 5 = (Negative/Underflow)
        // 0010 - 0101 = 1101 (Decimal 13) with Borrow Out = 1
        A = 4'b0010; B = 4'b0101; bin = 1'b0; #10;

        // Case 5: 8 - 0 with an initial borrow input
        // 1000 - 0000 - 1 = 0111 (Decimal 7)
        A = 4'b1000; B = 4'b0000; bin = 1'b1; #10;

        $finish;
    end

    // Monitor using binary format (%b)
    initial begin
        $monitor("%4t | %b - %b - %b  |     %b      |  %b", 
                 $time, A, B, bin, diff, bout);
    end

endmodule