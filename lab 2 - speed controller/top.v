`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 04:57:24 PM
// Design Name: 
// Module Name: top
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


module top #(parameter WIDTH_TOP = 32)
(
                input clk,
                input rst,
                input en,
                input [$clog2(WIDTH_TOP)-1:0] speed,
                output [3:0] led
                );
                wire clk_speed;
                speed_controller #(.WIDTH_SPEED(WIDTH_TOP)) TOP_SPEED
                      (
                            .clk(clk),
                            .rst(rst),
                            .speed(speed),
                            .clk_speed(clk_speed)
                       );
                 
                up_counter #(.WIDTH(4)) TOP_LED
                        (
                        .clk(clk_speed),
                        .rst(rst),
                        .en(en),
                        .count(led)
                        );
            

endmodule
