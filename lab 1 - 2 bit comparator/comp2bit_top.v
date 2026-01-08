`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 03:28:25 PM
// Design Name: 
// Module Name: comp2bit_top
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


module comp2bit_top(
    input [3:0] sw,
    output [4:0] ld
    );
    reg [1:0] swA;
    reg [1:0] swB;
    wire [4:0] led;
    comp2bit U1 (
                .a (swA),
                .b (swB),
                .Ga (led[4]),
                .La (led[3]),
                .E (led[2]),
                .Gb (led[1]),
                .Lb (led[0])
                );
endmodule
