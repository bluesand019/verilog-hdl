module decoder2to4_tb;
    reg A0, A1, E;
    wire Y0, Y1, Y2, Y3;

    decoder2to4 uut (
        .A0(A0),
        .A1(A1),
        .E(E),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin
        $dumpfile("simulation.vcd");
        $dumpvars(0, decoder2to4_tb);
        // Test case 1: E = 0 (all outputs should be 0)
        A0 = 0; A1 = 0; E = 0; #10;
        $display("Test case 1: E=0 -> Y0=%b Y1=%b Y2=%b Y3=%b", Y0, Y1, Y2, Y3);

        // Test case 2: E = 1, A1A0 = 00
        A0 = 0; A1 = 0; E = 1; #10;
        $display("Test case 2: E=1, A1A0=00 -> Y0=%b Y1=%b Y2=%b Y3=%b", Y0, Y1, Y2, Y3);

        // Test case 3: E = 1, A1A0 = 01
        A0 = 1; A1 = 0; E = 1; #10;
        $display("Test case 3: E=1, A1A0=01 -> Y0=%b Y1=%b Y2=%b Y3=%b", Y0, Y1, Y2, Y3);

        // Test case 4: E = 1, A1A0 = 10
        A0 = 0; A1 = 1; E = 1; #10;
        $display("Test case 4: E=1, A1A0=10 -> Y0=%b Y1=%b Y2=%b Y3=%b", Y0, Y1, Y2, Y3);

        // Test case 5: E = 1, A1A0 = 11
        A0 = 1; A1 = 1; E = 1; #10;
        $display("Test case 5: E=1, A1A0=11 -> Y0=%b Y1=%b Y2=%b Y3=%b", Y0, Y1, Y2, Y3);
        $finish;
    end
endmodule
