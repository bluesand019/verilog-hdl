`timescale 1ns / 1ps

module tb_demux1to4();

    // 1. Declare Signals
    reg tb_I;
    reg [1:0] tb_S;
    wire [3:0] tb_Y;

    // 2. Instantiate the Unit Under Test (UUT)
    demux1to4 uut (
        .I(tb_I),
        .S(tb_S),
        .Y(tb_Y)
    );

    // 3. Stimulus Process
    initial begin
        // Setup GTKWave dumping
        $dumpfile("demux_sim.vcd");
        $dumpvars(0, tb_demux1to4);

        $display("Time\t I \t S \t | Y[3] Y[2] Y[1] Y[0]");
        $monitor("%0t\t %b \t %b \t | %b    %b    %b    %b", 
                 $time, tb_I, tb_S, tb_Y[3], tb_Y[2], tb_Y[1], tb_Y[0]);

        // Initialize Input
        tb_I = 1'b1; // We want to see this '1' travel across outputs
        
        // Test routing to each output
        tb_S = 2'b00; #10; // Y should be 0001
        tb_S = 2'b01; #10; // Y should be 0010
        tb_S = 2'b10; #10; // Y should be 0100
        tb_S = 2'b11; #10; // Y should be 1000

        // Test with Input as '0'
        tb_I = 1'b0;
        tb_S = 2'b10; #10; // Y should be 0000 even though S=10
        
        // Test change of input mid-way
        tb_S = 2'b01; #5;
        tb_I = 1'b1;  #5;  // Y[1] should toggle from 0 to 1

        $finish;
    end

endmodule