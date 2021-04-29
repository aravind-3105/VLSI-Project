`timescale 1ns/1ps
module tb;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire [3:0] C_out;
    reg clk;
    wire [3:0] Q_a;
    wire [3:0] Q_b;

    FF CLA_timed(.a(a),
                .b(b),
                .clk(clk),
                .C_out(C_out),
                .sum(sum));

initial clk = 1;
    initial begin
      $monitor("\ta=%d,b=%dsum=%d,cout=%d,",a,b,sum,C_out[3]);
        $dumpfile("DUMP_CLA.vcd");
     	$dumpvars(0,tb);
		a = 0;
		b = 0;
        #10 a = 4'd3; b = 4'd2;
        #20 a = 4'd7; b = 4'd2; 
        #20 a = 4'd2; b = 4'd13;
        #20 a = 4'd2; b = 4'd2;
        #20 a = 4'd4; b = 4'd8; 
        #20 a = 4'd3; b = 4'd13;
        #20 a = 4'd5; b = 4'd6;
        #20;
        #20;
        $finish;
	end

        always #10 clk = ~clk;
endmodule