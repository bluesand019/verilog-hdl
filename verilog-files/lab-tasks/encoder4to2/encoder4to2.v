module encoder4to2(
    input [3:0] Y,
    output reg [1:0] A
);
    always @(*) 
    begin
        case (Y)
            4'b0001: A = 2'b00;
            4'b0010: A = 2'b01;
            4'b0100: A = 2'b10;
            4'b1000: A = 2'b11;
            default: A = 2'b00; // Default case for invalid inputs
        endcase
    end     
endmodule
