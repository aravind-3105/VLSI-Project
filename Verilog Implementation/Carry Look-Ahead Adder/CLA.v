`timescale 1ns/1ps
module CLA (
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output reg [3:0] sum,
    output reg [3:0] C_out);
    reg [3:0] p;
    reg [3:0] g;
    always @(*) begin
        //Propagate   pi = ai xor bi
        p[0] = a[0] ^ b[0];
        p[1] = a[1] ^ b[1];
        p[2] = a[2] ^ b[2];
        p[3] = a[3] ^ b[3];
        //Generate    gi = ai and bi
        g[0] = a[0] & b[0];
        g[1] = a[1] & b[1];
        g[2] = a[2] & b[2];
        g[3] = a[3] & b[3];
        //Carry-Out   c(i+1) = (pi and ci) + gi
        C_out[0] = (p[0] & Cin) | g[0];
        C_out[1] = (p[1] & C_out[0]) | g[1];
        C_out[2] = (p[2] & C_out[1]) | g[2];
        C_out[3] = (p[3] & C_out[2]) | g[3];
        //Sum       sum_i = pi xor ci
        sum[0] = p[0] ^ Cin;
        sum[1] = p[1] ^ C_out[0];
        sum[2] = p[2] ^ C_out[1];
        sum[3] = p[3] ^ C_out[2];
    end
endmodule





