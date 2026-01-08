`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 04:45:35 PM
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
                input  switch,
                input  [3:0] a,              //  A
                input  [3:0] b,              //  B
                input  [1:0] op, 
                output [7:0] result_leds,
                output [3:0] a_led,
                output [3:0] b_led,
                output disp_dp,
                output [6:0] disp_seg,
                output [7:0] disp_an              // operation select
                        
           );
    wire [7:0] result;
    ops OPERATION(
        .a(a),
        .b(b),
        .op(op),
        .result(result)

    );
    assign result_leds = result;
    assign a_led = a;
    assign b_led = b;
seg7_driver DRIVER (
                        .disp_clk(clk), 
                        .disp_rst(rst), 
                        .disp_inp(disp_inp),
                        .switch(switch),
                        .op(op),
                        .disp_seg(disp_seg),
                        .disp_dp(disp_dp),
                        .disp_an(disp_an)
                  );
wire [31:0] disp_inp;
assign disp_inp = {a,{2'b0,op},b,4'b0,4'b0,4'b0,result[7:4], result[3:0]};

endmodule
