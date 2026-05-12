module counter
(
    input wire clk,
    input wire reset,
    output reg [6:0] q
);

    // Sequential logic: State and Increment combined
    // This uses an asynchronous reset as seen in your previous designs
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 7'b0000_000; // Reset to zero
        else
            q <= q + 1'b1;    // Increment logic inside the register block
    end

endmodule