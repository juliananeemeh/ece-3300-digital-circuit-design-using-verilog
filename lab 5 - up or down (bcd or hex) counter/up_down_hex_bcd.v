`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 01:48:17 PM
// Design Name: 
// Module Name: up_down_hex_bcd
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


module up_down_hex_bcd #(parameter WIDTH = 4)
(
                            input clk,
                            input rst,
                            input en,
                            input [1:0] mode,
                            output reg [WIDTH-1:0] count,
                            output wire enout          
);

assign enout = en && (
                        (mode == 2'b00 && count == 9) ||
                        (mode == 2'b01 && count == 0) ||
                        (mode == 2'b10 && count == 15)||
                        (mode == 2'b11 && count == 0)
                        );

always@(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                count<=0;
            end
        else if(en)
            begin
                case(mode)
                  2'b00: begin // UP BCD
                    if (count == 9) 
                            count <= 0;
                    else
                        count <= count + 1;
                    end
                  2'b01: begin // DOWN BCD
                    if (count == 0)
                            count <= 9;
                    else
                        count <= count -1;
                    end
                  2'b10: begin // UP HEX
                    if (count == 15)
                            count <= 0;
                    else
                        count <= count + 1;
                    end           
                  2'b11: begin // DOWN HEX
                    if (count == 0)
                            count <= 15;
                    else
                        count <= count - 1;
                    end
                  default:
                    count <= 0;
                    endcase
            end
    end
endmodule
