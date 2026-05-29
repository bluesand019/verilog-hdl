module counter
(
    input wire clk,
    input wire reset,
    output wire [6:0] q
);

    // Signal declarations
    reg [6:0] q_reg;     // The actual flip-flops (state)
    wire [6:0] q_next;   // The combinational logic result

    // 1. State Register Block
    // Updates only on the rising edge of the clock
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q_reg <= 7'b0000_000;
        else
            q_reg <= q_next;
    end

    // 2. Next-State Logic Block
    // Computes the incremented value for the next cycle
    assign q_next = q_reg + 1'b1;

    // 3. Output Logic Block
    // Connects the internal register to the output port
    assign q = q_reg;

endmodule