`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 10:19:17 PM
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

module top(
                input clk,
                input rst,
                input en,
                input [1:0] mode,
                input load_lfsr, // ???
                input alien_human,
                input [$clog2(32)-1:0] speed,
                output [6:0] disp_seg,
                output disp_dp,
                output [7:0] disp_an
    );

    wire clk_speed;

    speed_controller SPEED (
        .clk(clk),
        .rst(rst),
        .speed(speed),
        .clk_speed(clk_speed)
        );

    wire [31:0] count_disp;
    wire enout;
    updownbcdhex_8 COUNTER (
        .sys_clk(clk_speed),
        .sys_rst(rst),
        .sys_en(en),
        .mode(mode),
        .sys_count(count_disp),
        .enout(enout)
        );
   
   wire [31:0] lfsr_out;
   lfsr RANDOM(
                .clk(clk_speed),
                .rst(rst),
                .load_lfsr(load_lfsr),
                .lfsr_inp(count_disp),
                .lfsr_out(lfsr_out)
           );

    driver DISP (
        .disp_clk(clk),
        .disp_rst(rst),
        .disp_inp(lfsr_out),
        .switch(alien_human),
        .disp_seg(disp_seg),
        .disp_dp(disp_dp),
        .disp_an(disp_an)
        );
endmodule
