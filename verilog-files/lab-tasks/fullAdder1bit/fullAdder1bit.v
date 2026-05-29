module fullAdder1bit(
    input a,
    input b,
    input carryIn,
    output sum,
    output carryOut
);
    assign sum = a ^ b ^ carryIn; // XOR for sum
    assign carryOut = (a & b) | (carryIn & (a ^ b)); // AND-OR for carry out
endmodule