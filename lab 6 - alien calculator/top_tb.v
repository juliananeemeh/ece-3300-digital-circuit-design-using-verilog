`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 02:54:33 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();

reg clk;
reg rst;
reg switch;
reg [3:0] a;
reg [3:0] b;
reg [1:0] op;

wire [7:0] result_leds;
wire [3:0] a_led;
wire [3:0] b_led;
wire disp_dp;
wire [6:0] disp_seg;
wire [7:0] disp_an;

top TB(             
                .clk(clk),
                .rst(rst),
                .switch(switch),
                .a(a),            
                .b(b),              
                .op(op), 
                .result_leds(result_leds),
                .a_led(a_led),
                .b_led(b_led),
                .disp_dp(disp_dp),
                .disp_seg(disp_seg),
                .disp_an(disp_an)
       );
       
       always #5 clk = ~clk;
       initial begin
       clk = 0;
            rst = 1;
            switch = 0;
            a = 0;
            b = 0;
            op = 2'b00;
            
            #20 rst = 0;
            
            // addition
            a = 1;
            b = 2;
            #50
            
            // a - b
            op = 2'b01;
            #50
            
            // b - a
            op = 2'b10;
            #50
            
            // a * b
            op = 2'b11;
            #50
            
            // alien mode
            switch = 1;
            #100
            $finish;
            end
            
            
endmodule
