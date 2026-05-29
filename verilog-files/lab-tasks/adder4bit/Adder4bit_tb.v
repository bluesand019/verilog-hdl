`timescale 1ns/1ps

module Adder4bit_tb();
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

    Adder4bit uut(A, B, Cin, S, Cout);
    initial begin
        $dumpfile("test4b.vcd");
        $dumpvars(0, Adder4bit_tb);

        Cin = 1'b0;
        A = 4'b0000;
        B = 4'b0000;

        #20;
        Cin = 1'b0;
        A = 4'b0001;
        B = 4'b0010;

        #20;
        Cin = 1'b0;
        A = 4'b1100;
        B = 4'b1110;


        #20;
        Cin = 1'b1;
        A = 4'b0000;
        B = 4'b0000;

        #20;
        Cin = 1'b1;
        A = 4'b0000;
        B = 4'b0011;

       

        $finish;
    end

    initial begin
        $monitor("Cin = %b, A = %b, B=%b, Cout =%b, S =%b\n",Cin, A, B, Cout, S);
    end
endmodule