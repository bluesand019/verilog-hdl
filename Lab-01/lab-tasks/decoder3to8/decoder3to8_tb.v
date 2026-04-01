`timescale 1ns/1ps

module decoder3to8_tb;

reg [2:0] I;
wire [7:0] Y;

integer i;

decoder3to8 uut(I, Y);

initial
    begin
        $dumpfile("decoder3to8wave.vcd");
        $dumpvars(0, decoder3to8_tb);
    

for(i=0; i<8; i++) begin
    I = i;
    #10;
end
$finish;
    end

    initial begin
        $monitor("I=%b, Y=%b", I, Y);
    end
    endmodule