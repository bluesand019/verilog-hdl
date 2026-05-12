module dff
(
    input wire clk,
    input wire d,
    output reg q
);
    always @(posedge clk) //posedge means positive edge
    begin
        q <= d;
    end
endmodule