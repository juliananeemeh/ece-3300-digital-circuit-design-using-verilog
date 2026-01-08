`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 09:41:59 PM
// Design Name: 
// Module Name: 7seg_driver
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


module seven_seg_driver(
    input [3:0] digit,
    input dp_sw,
    output dp,
    output [7:0] an,
    output reg [6:0] seg_cc
    );

always@(digit)
    begin
        case(digit)
            4'd0 : seg_cc = 7'b100_0000;
            4'd1 : seg_cc = 7'b111_1001;
            4'd2 : seg_cc = 7'b010_0100;
            4'd3 : seg_cc = 7'b011_0000;
            4'd4 : seg_cc = 7'b001_1001;
            4'd5 : seg_cc = 7'b001_0010;
            4'd6 : seg_cc = 7'b000_0010;
            4'd7 : seg_cc = 7'b111_1000;
            4'd8 : seg_cc = 7'b000_0000;
            4'd9 : seg_cc = 7'b001_0000;
            4'd10 : seg_cc = 7'b000_1000;
            4'd11 : seg_cc = 7'b000_0011;
            4'd12 : seg_cc = 7'b100_0110;
            4'd13 : seg_cc = 7'b010_0001;
            4'd14 : seg_cc = 7'b000_0110;
            4'd15 : seg_cc = 7'b000_1110;
            default : seg_cc = 7'b111_1111;
            endcase
    end
assign dp = dp_sw;
assign an = 8'b1111_1110;

endmodule