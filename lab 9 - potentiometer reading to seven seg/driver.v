`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2025 12:29:17 PM
// Design Name: 
// Module Name: dsp_driver
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


module driver(
                        input disp_clk, 
                        input disp_rst, 
                        input [31:0] disp_inp,
                        input [7:0] disp_sw_dp,
                        output [6:0] disp_seg,
                        output disp_dp,
                        output [7:0] disp_an
                  );
                  
                  // TIMING ENGINE
                  reg [19:0] count_tmp;
                  
                  always@(posedge disp_clk)
                    begin: TIME_SOURCE
                        if(disp_rst)
                            count_tmp <=0;
                        else
                            count_tmp <= count_tmp + 1;
                    end
                  
                    reg [3:0] digit;
                    wire [2:0] tmp_digsel;
                    assign tmp_digsel = count_tmp[15:13];
                    always@(*)
                        begin
                            case(tmp_digsel)
                            3'd0: digit = disp_inp[3:0];
                            3'd1: digit = disp_inp[7:4];
                            3'd2: digit = disp_inp[11:8];
                            3'd3: digit = disp_inp[15:12];
                            3'd4: digit = disp_inp[19:16];
                            3'd5: digit = disp_inp[23: 20];
                            3'd6: digit = disp_inp[27:24];
                            3'd7: digit = disp_inp[31:28];
                            default: digit = 4'hZ;
                            endcase
                        end    
                              
                  reg [6:0] tmp_disp_seg;
                  always@(digit)
                    begin:SEG_ENC
                        case (digit)
                            4'h0: tmp_disp_seg = 7'b1000_000;
                            4'h1: tmp_disp_seg = 7'b1111_001;
                            4'h2: tmp_disp_seg = 7'b0100_100;
                            4'h3: tmp_disp_seg = 7'b0110_000;
                            4'h4: tmp_disp_seg = 7'b0011_001;
                            4'h5: tmp_disp_seg = 7'b0010_010;
                            4'h6: tmp_disp_seg = 7'b0000_010;
                            4'h7: tmp_disp_seg = 7'b1111_000;
                            4'h8: tmp_disp_seg = 7'b0000_000;
                            4'h9: tmp_disp_seg = 7'b0011_000;
                            4'hA: tmp_disp_seg = 7'b0001_000;
                            4'hB: tmp_disp_seg = 7'b0000_011;
                            4'hC: tmp_disp_seg = 7'b1000_110;
                            4'hD: tmp_disp_seg = 7'b0100_001;
                            4'hE: tmp_disp_seg = 7'b0000_110;
                            4'hF: tmp_disp_seg = 7'b0001_110;
                        default: tmp_disp_seg = 7'bZZZZ_ZZZ;
                        endcase
                    end
                    assign disp_seg = tmp_disp_seg;
                    

 
                     reg [7:0] tmp_an;
                     always@(*)
                        begin
                            case(tmp_digsel)
                            3'd0: tmp_an = 8'b1111_1110;
                            3'd1: tmp_an = 8'b1111_1101;
                            3'd2: tmp_an = 8'b1111_1011;
                            3'd3: tmp_an = 8'b1111_0111;
                            3'd4: tmp_an = 8'b1110_1111;
                            3'd5: tmp_an = 8'b1101_1111;
                            3'd6: tmp_an = 8'b1011_1111;
                            3'd7: tmp_an = 8'b0111_1111;
                            default: tmp_an = 8'hZZ;
                            endcase
                        end
                     assign disp_an = tmp_an;                 
                     assign disp_dp = 1'b1;
endmodule