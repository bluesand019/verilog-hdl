`timescale 1ps/1ps

module mux4to1_tb;

reg [3:0] I;
reg [1:0] S;
wire Y;

mux4to1 uut(I, S, Y);

initial begin
    $dumpfile("mux4to1wave.vcd");
    $dumpvars(0, mux4to1_tb);


    #10 I=4'b0001; S=2'b00;
    #10 I=4'b0010; S=2'b01;
    #10 I=4'b0100; S=2'b10;
    #10 I=4'b1000; S=2'b11;
    $finish;

end

initial begin
    $monitor("I=%b, S=%b, Y=%b", I, S, Y);
end
endmodule