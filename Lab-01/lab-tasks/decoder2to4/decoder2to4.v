module decoder2to4 (
    input A0, A1, E,
    output Y0, Y1, Y2, Y3
);
    assign Y0 = ~A1 & ~A0 & E;
    assign Y1 = ~A1 & A0 & E;
    assign Y2 = A1 & ~A0 & E;
    assign Y3 = A1 & A0 & E;
endmodule