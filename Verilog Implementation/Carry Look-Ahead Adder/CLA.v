`timescale 1ns/1ps
module CLA (
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output reg [3:0] sum,
    output reg [3:0] C_out
);
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


        // //Propagate   pi = ai xor bi
        // assign p[0] = a[0] ^ b[0];
        // assign p[1] = a[1] ^ b[1];
        // assign p[2] = a[2] ^ b[2];
        // assign p[3] = a[3] ^ b[3];
        // //Generate    gi = ai and bi
        // assign g[0] = a[0] & b[0];
        // assign g[1] = a[1] & b[1];
        // assign g[2] = a[2] & b[2];
        // assign g[3] = a[3] & b[3];
        // //Carry-Out   c(i+1) = (pi and ci) + gi
        // assign C_in[0] = Cin;
        // assign C_in[1] = (p[0] & C_out[0]) & g[0];
        // assign C_in[2] = (p[2] & C_out[1]) & g[2];
        // assign C_in[3] = (p[3] & C_out[2]) & g[3];
        
        // //Sum       sum_i = pi xor ci
        // assign sum[0] = p[0] ^ C_in[0];
        // assign sum[1] = p[1] ^ C_in[1];
        // assign sum[2] = p[2] ^ C_in[2];
        // assign sum[3] = p[3] ^ C_in[3];
endmodule