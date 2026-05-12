module register
(
    input wire clk,
    input wire rst,
    input wire [6:0] d,
    output reg [6:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 7'b0000000; // Reset to 0
        end else begin
            q <= d; // Load data on clock edge
        end
    end
endmodule