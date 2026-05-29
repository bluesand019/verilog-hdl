module subtractor1bit
(
    input a,
    input b,
    input borrow_in,
    output diff,
    output borrow_out
);
    assign diff = a ^ b ^ borrow_in; // XOR for difference
    assign borrow_out = (~a & b) | ((~a | b) & borrow_in); // Borrow out logic
endmodule