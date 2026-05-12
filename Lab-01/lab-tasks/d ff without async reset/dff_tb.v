module dff_tb;
    reg clk, d;
    wire q;

    dff circuit1 (clk, d, q);

    // Clock generation
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, dff_tb);

        d = 0; #25;  // Change 'd' slightly after the clock edge
        d = 1; #20;
        d = 0; #20;

        $finish;
    end

    initial begin
        $monitor("time=%0t, clk=%b, d=%b, q=%b", $time, clk, d, q);
    end
endmodule