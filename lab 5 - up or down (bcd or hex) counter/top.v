`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 02:15:15 PM
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
                input [1:0] mode,
                input [$clog2(WIDTH_TOP)-1:0] speed,
                output [6:0] seg,
                output [7:0] an,
                output dp_sw
          );
          
          wire clk_speed;
          wire [31:0] count_disp;
          wire enout;

          speed_controller #(.WIDTH_SPEED(WIDTH_TOP)) SPEED
          (
            .clk(clk),
            .rst(rst),
            .speed(speed),
            .clk_speed(clk_speed)
          );
          
          updownbcdhex_8 #(.WIDTH_COUNT(8), .WIDTH_UP(4)) COUNTER
          (
            .sys_clk(clk_speed),
            .sys_rst(rst),
            .sys_en(en),
            .mode(mode),
            .sys_count(count_disp),
            .enout(enout)
          );
          
          dsp_driver DRIVER
          (
            .disp_clk(clk),
            .disp_rst(rst),
            .disp_inp(count_disp),
            .disp_sw_dp(8'b0),
            .disp_seg(seg),
            .disp_dp(dp_sw),
            .disp_an(an)
          );
          
endmodule
