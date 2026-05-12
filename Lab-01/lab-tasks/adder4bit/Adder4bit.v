module Adder4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);

wire Cin1, Cin2, Cin3;
Adder1bit cir1(A[0], B[0], Cin,  S[0], Cin1);
Adder1bit cir2(A[1], B[1], Cin1, S[1], Cin2);
Adder1bit cir3(A[2], B[2], Cin2, S[2], Cin3);
Adder1bit cir4(A[3], B[3], Cin3, S[3], Cout);

endmodule