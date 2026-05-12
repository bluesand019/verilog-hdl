module counter
(
    input wire CLK,
    input wire Reset,
    output wire [6:0] q
);

    // Internal wires to connect the components
    wire [6:0] d_temp, q_temp;

    // Memory element (Reused from your previous project)
    register register_circuit1 (
        .clk(CLK), 
        .rst(Reset), 
        .d(d_temp), 
        .q(q_temp)
    );

    // Arithmetic element: Decrements the current state
    subOne sub_circuit1 (
        .I(q_temp), 
        .O(d_temp)
    );

    // Route the internal register state to the module output
    assign q = q_temp;

endmodule

//command
//iverilog -o output counter.v counter_tb.v register.v subOne.v