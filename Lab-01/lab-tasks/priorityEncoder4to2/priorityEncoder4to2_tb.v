module priorityEncoder4to2_tb;
    reg [3:0] Y; // 4-bit input
    wire [1:0] A; // 2-bit output

    // Instantiate the priority encoder
    priorityEncoder4to2 uut (
        .Y(Y),
        .A(A)
    );

    initial begin
        // Test case 1: Only input 0 is active
        Y = 4'b0001; #10;
        $display("Test case 1: Y = %b, A = %b", Y, A);

        // Test case 2: Only input 1 is active
        Y = 4'b0010; #10;
        $display("Test case 2: Y = %b, A = %b", Y, A);

        // Test case 3: Only input 2 is active
        Y = 4'b0100; #10;
        $display("Test case 3: Y = %b, A = %b", Y, A);

        // Test case 4: Only input 3 is active
        Y = 4'b1000; #10;
        $display("Test case 4: Y = %b, A = %b", Y, A);

        // Test case 5: Multiple inputs active (input 1 and input 2)
        Y = 4'b0110; #10;
        $display("Test case 5: Y = %b, A = %b", Y, A);

        // Test case 6: No inputs active
        Y = 4'b0000; #10;
        $display("Test case 6: Y = %b, A = %b", Y, A);

        $finish; // End the simulation
    end
endmodule