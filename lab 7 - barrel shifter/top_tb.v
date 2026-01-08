`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2025 03:36:51 PM
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
                reg en;
                reg [1:0] mode;
                reg alien_human;
                reg [$clog2(32)-1:0] speed;
                
                wire [6:0] disp_seg;
                wire disp_dp;
                wire [7:0] disp_an;
top TB(
                .clk(clk),
                .rst(rst),
                .en(en),
                .mode(mode),
                .alien_human(alien_human),
                .speed(speed),
                .disp_seg(disp_seg),
                .disp_dp(disp_dp),
                .disp_an(disp_an)
    );
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst = 1;
        en = 0;
        mode = 2'b00;
        alien_human = 0;
        speed = 0;
        
        #20
        rst = 0;
        en = 1;
        
        #500 // run in human mode
        alien_human = 1;
        
        #500 // run in alien mode
        $finish;
        end
endmodule
