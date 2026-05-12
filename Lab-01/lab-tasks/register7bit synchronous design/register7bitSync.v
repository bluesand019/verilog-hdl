module register7bitSync (
    input wire clk,
    input wire reset,
    input wire [6:0] d,
    output wire [6:0] q
);

    // Signal declaration
    reg [6:0] q_reg;
    wire [6:0] q_next;

    // Body: State register with asynchronous reset
    always @(posedge clk, posedge reset)
    begin
        if (reset)
            q_reg <= 7'b0000_000;
        else
            q_reg <= q_next;
    end

    // Next-state logic: Combinational path
    assign q_next = d;

    // Output logic: Direct mapping
    assign q = q_reg;

endmodule