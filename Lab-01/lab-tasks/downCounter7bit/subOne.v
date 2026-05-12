module subOne
(
    input wire [6:0] I,
    output wire [6:0] O
);
    // Combinational logic to decrement the input by 1
    assign O = I - 1;
endmodule