`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2025 12:06:57 PM
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
        
    wire [31:0] shift;
    reg [1:0] tmp = 0;
    
    always@(posedge clk_speed)
        begin
            if(rst)
             tmp <= 0;
            else
                begin
                if(en)
                 tmp<= tmp+1;
                end
        end
        
    barrel_shifter b1(
                        .sel(tmp),
                        .b(count_disp[3:0]),
                        .p(shift[3:0])
                     );
    
    barrel_shifter b2(
                        .sel(tmp),
                        .b(count_disp[7:4]),
                        .p(shift[7:4])
                     );
    barrel_shifter b3(
                        .sel(tmp),
                        .b(count_disp[11:8]),
                        .p(shift[11:8])
                     );
    barrel_shifter b4(
                        .sel(tmp),
                        .b(count_disp[15:12]),
                        .p(shift[15:12])
                     );
    barrel_shifter b5(
                        .sel(tmp),
                        .b(count_disp[19:16]),
                        .p(shift[19:16])
                     );
    barrel_shifter b6(
                        .sel(tmp),
                        .b(count_disp[23:20]),
                        .p(shift[23:20])
                     );
    barrel_shifter b7(
                        .sel(tmp),
                        .b(count_disp[27:24]),
                        .p(shift[27:24])
                     );
    barrel_shifter b8(
                        .sel(tmp),
                        .b(count_disp[31:28]),
                        .p(shift[31:28])
                     );
    
                  
    driver DISP (
        .disp_clk(clk),
        .disp_rst(rst),
        .disp_inp(shift),
        .switch(alien_human),
        .disp_seg(disp_seg),
        .disp_dp(disp_dp),
        .disp_an(disp_an)
        );
endmodule
