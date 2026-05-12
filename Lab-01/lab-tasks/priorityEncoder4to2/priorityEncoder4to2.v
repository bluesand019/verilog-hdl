module priorityEncoder4to2(
    input [3:0] Y,
    output reg [1:0] A
);
    //data flow level modeling
    // assign A[1] = (~Y[3] & Y[2]) | Y[3]; // A[1] is 1 if input 2 or 3 is active
    // assign A[0] = (~Y[3] & ~Y[2] & Y[1]) | Y[3]; // A[0] is 1 if input 1 is active and inputs 2 and 3 are not active, or if input 3 is active
    
    //behavioral level modeling
    always @(*)
     begin
        casez (Y)
            4'b0001: A = 2'b00; // if input 0 is active, output is 00
            4'b001?: A = 2'b01; // if input 1 is active, output is 01
            4'b01??: A = 2'b10; // if input 2 is active, output is 10
            4'b1???: A = 2'b11; // if input 3 is active
            default: A = 2'b00; // default case, output is 00
        endcase
    end
    endmodule