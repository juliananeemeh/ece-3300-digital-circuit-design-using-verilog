`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 03:01:14 PM
// Design Name: 
// Module Name: comp2bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comp2bit(
    input [1:0] a,
    input [1:0] b,
    output Ga,
    output E,
    output La,
    output Gb,
    output Lb
    );
 
    assign Ga = ((~b[1] & a[1]) | (~b[1] & ~b[0] & a[0]) | (~b[0] & a[1] & a[0]));
    assign Lb = Ga;
    assign E = ((a[1] & a[0] & b[1] & b[0]) | (~a[1] & a[0] & ~b[1] & b[0]) | (a[1] & ~a[0] & b[1] & ~b[0]) | (~a[1] & ~a[0] & ~b[1] & ~b[0])); 
    assign La = ((~a[1] & b[1]) | (~a[1] & ~a[0] & b[0]) | (~a[0] & b[1] & b[0]));
    assign Gb = La;
endmodule
