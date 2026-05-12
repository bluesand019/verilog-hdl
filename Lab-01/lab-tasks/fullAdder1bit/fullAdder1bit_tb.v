module fullAdder1bit_tb;
    reg a;
    reg b;
    reg carryIn;
    wire sum;
    wire carryOut;

    // Instantiate the full adder
    fullAdder1bit uut (
        .a(a),
        .b(b),
        .carryIn(carryIn),
        .sum(sum),
        .carryOut(carryOut)
    );

    initial begin
        // Test all combinations of inputs
        $display("a b carryIn | sum carryOut");
        $display("-----------------------------");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, carryIn} = i; // Assign inputs based on loop index
            #10; // Wait for outputs to stabilize
            $display("%b %b %b | %b %b", a, b, carryIn, sum, carryOut);
        end
        $finish; // End simulation
    end
endmodule