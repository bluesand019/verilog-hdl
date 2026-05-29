module demux1to4(
    input wire I,
    input wire [1:0] S,
    output reg [3:0] Y
);
    always @(*) begin
        // 1. Default state: All outputs are 0
        Y = 4'b0000; 

        // 2. Only the selected bit gets the value of I
        case (S)
            2'b00: Y[0] = I;
            2'b01: Y[1] = I;
            2'b10: Y[2] = I;
            2'b11: Y[3] = I;
            default: Y = 4'b0000;
        endcase
    end
endmodule