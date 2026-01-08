`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2025 03:23:49 PM
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

module top_tb;

    reg        clk;
    reg        rst;
    reg        vauxp11;

    wire [6:0] seg;
    wire       dp;
    wire [7:0] an;

    top dut (
        .clk     (clk),
        .rst     (rst),
        .vauxp11 (vauxp11),
        .seg     (seg),
        .dp      (dp),
        .an      (an)
    );

    initial begin
        clk = 1'b0;
    end

    always #5 clk = ~clk;   // toggle every 5 ns

    initial begin
        rst     = 1'b1;
        vauxp11 = 1'b0;

        #100;
        rst = 1'b0;

        #100;
        vauxp11 = 1'b1;

 
        #1000;
        $finish;
    end


endmodule