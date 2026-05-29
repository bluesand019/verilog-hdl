module encoder4to2_tb;
    reg [3:0] Y;
    wire [1:0] A;

    encoder4to2 uut (
        .Y(Y),
        .A(A)
    );

    initial begin
        $dumpfile("encoder4to2_tb.vcd");
        $dumpvars(0, encoder4to2_tb);
        // Test case 1: Y = 0001
        Y = 4'b0001; #10;
        $display("Y: %b, A: %b", Y, A);

        // Test case 2: Y = 0010
        Y = 4'b0010; #10;
        $display("Y: %b, A: %b", Y, A);

        // Test case 3: Y = 0100
        Y = 4'b0100; #10;
        $display("Y: %b, A: %b", Y, A);

        // Test case 4: Y = 1000
        Y = 4'b1000; #10;
        $display("Y: %b, A: %b", Y, A);

        // Test case 5: Invalid input (Y = 0000)
        Y = 4'b0000; #10;
        $display("Y: %b, A: %b", Y, A);

        // Test case 6: Invalid input (Y = 1111)
        Y = 4'b1111; #10;
        $display("Y: %b, A: %b", Y, A);

        $finish;
end
endmodule
