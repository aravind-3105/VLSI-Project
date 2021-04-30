`timescale 1ns/1ps
module FF (
    input [3:0] a,
    input [3:0] b,
    input clk,
    output reg [3:0] C_out,
    output reg [3:0] sum

);
    reg Cin;
    wire [3:0] Q_C_out;
    wire [3:0] Q_sum;
    reg [3:0] Q_a;
    reg [3:0] Q_b;
    initial Cin = 0; 

    //Flip-flop for A
    always @(posedge clk) begin
        Q_a = a;
    end
    //Flip-flop for B
    always @(posedge clk) begin
        Q_b = b;
    end
    // D_FF fpA(.D(a),
    //         .clk(clk),
    //         .Q(Q_b));

    // D_FF fpB(.D(b),
    //         .clk(clk),
    //         .Q(Q_b));

    CLA cl(.a(Q_a),
            .b(Q_b),
            .Cin(Cin),
            .sum(Q_sum),
            .C_out(Q_C_out));

    // D_FF fpSum(.D(Q_sum),
    //         .clk(clk),
    //         .Q(sum));

    // D_FF fpCarry(.D(Q_C_out),
    //         .clk(clk),
    //         .Q(C_out));

    //Flip-flop for Carry-Out
    always @(posedge clk) begin
        C_out = Q_C_out;
    end
    //Flip
    always @(posedge clk) begin
        sum = Q_sum;
    end
endmodule