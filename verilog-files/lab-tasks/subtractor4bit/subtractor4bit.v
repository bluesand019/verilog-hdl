module subtractor4bit (
    input wire [3:0] A,          // Minuend
    input wire [3:0] B,          // Subtrahend
    input wire bin,              // Initial borrow in (usually 0)
    output wire [3:0] diff,      // Difference result
    output wire bout             // Final borrow out
);

    // Internal wires to carry the borrow between stages
    wire b1, b2, b3;

    // Stage 0: Least Significant Bit (LSB)
    subtractor1bit stage0 (
        .a(A[0]), 
        .b(B[0]), 
        .borrow_in(bin), 
        .diff(diff[0]), 
        .borrow_out(b1)
    );

    // Stage 1
    subtractor1bit stage1 (
        .a(A[1]), 
        .b(B[1]), 
        .borrow_in(b1), 
        .diff(diff[1]), 
        .borrow_out(b2)
    );

    // Stage 2
    subtractor1bit stage2 (
        .a(A[2]), 
        .b(B[2]), 
        .borrow_in(b2), 
        .diff(diff[2]), 
        .borrow_out(b3)
    );

    // Stage 3: Most Significant Bit (MSB)
    subtractor1bit stage3 (
        .a(A[3]), 
        .b(B[3]), 
        .borrow_in(b3), 
        .diff(diff[3]), 
        .borrow_out(bout)
    );

endmodule