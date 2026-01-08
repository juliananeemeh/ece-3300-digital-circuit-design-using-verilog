`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 09:54:53 PM
// Design Name: 
// Module Name: 7_seg_driver_tb
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


module seven_seg_driver_tb(

    );
    
    reg [3:0] digit;
    reg dp_sw;
    wire dp;
    wire [6:0] seg_cc;
    wire [7:0] an;
    seven_seg_driver TB 
    (
    .digit(digit),
    .dp_sw(dp_sw),
    .dp(dp),
    .seg_cc(seg_cc),
    .an(an)
    );
    
    integer i;
    initial 
        begin
            //enable dp
            dp_sw =  1'b1;
            digit = 0;
            for (i=0; i <16; i = i +1)
                begin
                    digit = i;
                    #10;
                end
            $finish;
        end
        
endmodule
