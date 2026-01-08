`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 11:32:17 AM
// Design Name: 
// Module Name: barrel_shifter_8bit
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


module barrel_shifter_8bit(
                                input [2:0] sel,
                                input [7:0] b,
                                output [7:0] p                       
                          );
                          
                          wire [7:0] v; // level 1 output
                          wire [7:0] w; // level 2 outputs
                     
                     // level 1
    mux_2x1 m1(
                .m_sel(sel[0]),
                .m_I0(b[0]),
                .m_I1(b[1]),
                .m_Op(v[0])
    );
    mux_2x1 m2(
                .m_sel(sel[0]),
                .m_I0(b[1]),
                .m_I1(b[2]),
                .m_Op(v[1])
    );
    mux_2x1 m3(
                .m_sel(sel[0]),
                .m_I0(b[2]),
                .m_I1(b[3]),
                .m_Op(v[2])
    );
    mux_2x1 m4(
                .m_sel(sel[0]),
                .m_I0(b[3]),
                .m_I1(b[4]),
                .m_Op(v[3])
    );
    mux_2x1 m5(
                .m_sel(sel[0]),
                .m_I0(b[4]),
                .m_I1(b[5]),
                .m_Op(v[4])
    );
    mux_2x1 m6(
                .m_sel(sel[0]),
                .m_I0(b[5]),
                .m_I1(b[6]),
                .m_Op(v[5])
    );
    mux_2x1 m7(
                .m_sel(sel[0]),
                .m_I0(b[6]),
                .m_I1(b[7]),
                .m_Op(v[6])
    );
    mux_2x1 m8(
                .m_sel(sel[0]),
                .m_I0(b[7]),
                .m_I1(b[0]),
                .m_Op(v[7])
    );
                     // level 2
               mux_2x1 m9(
                .m_sel(sel[1]),
                .m_I0(v[0]),
                .m_I1(v[2]),
                .m_Op(w[0])
    );
    mux_2x1 m10(
                .m_sel(sel[1]),
                .m_I0(v[1]),
                .m_I1(v[3]),
                .m_Op(w[1])
    );
    mux_2x1 m11(
                .m_sel(sel[1]),
                .m_I0(v[2]),
                .m_I1(v[4]),
                .m_Op(w[2])
    );
    mux_2x1 m12(
                .m_sel(sel[1]),
                .m_I0(v[3]),
                .m_I1(v[5]),
                .m_Op(w[3])
    );
    mux_2x1 m13(
                .m_sel(sel[1]),
                .m_I0(v[4]),
                .m_I1(v[6]),
                .m_Op(w[4])
    );
    mux_2x1 m14(
                .m_sel(sel[1]),
                .m_I0(v[5]),
                .m_I1(v[7]),
                .m_Op(w[5])
    );
   mux_2x1 m15(
                .m_sel(sel[1]),
                .m_I0(v[6]),
                .m_I1(v[0]),
                .m_Op(w[6])
    );
    mux_2x1 m16(
                .m_sel(sel[1]),
                .m_I0(v[7]),
                .m_I1(v[1]),
                .m_Op(w[7])
    );
    
                     // level 3   
   mux_2x1 m17(
                .m_sel(sel[2]),
                .m_I0(w[0]),
                .m_I1(w[4]),
                .m_Op(p[0])
    );
    mux_2x1 m18(
                .m_sel(sel[2]),
                .m_I0(w[1]),
                .m_I1(w[5]),
                .m_Op(p[1])
    );
    mux_2x1 m19(
                .m_sel(sel[2]),
                .m_I0(w[2]),
                .m_I1(w[6]),
                .m_Op(p[2])
    );
    mux_2x1 m20(
                .m_sel(sel[2]),
                .m_I0(w[3]),
                .m_I1(w[7]),
                .m_Op(p[3])
    );  
    mux_2x1 m21(
                .m_sel(sel[2]),
                .m_I0(w[4]),
                .m_I1(w[0]),
                .m_Op(p[4])
    );
    mux_2x1 m22(
                .m_sel(sel[2]),
                .m_I0(w[5]),
                .m_I1(w[1]),
                .m_Op(p[5])
    );
    mux_2x1 m23(
                .m_sel(sel[2]),
                .m_I0(w[6]),
                .m_I1(w[2]),
                .m_Op(p[6])
    );
    mux_2x1 m24(
                .m_sel(sel[2]),
                .m_I0(w[7]),
                .m_I1(w[3]),
                .m_Op(p[7])
    );
endmodule
