`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 03:31:42 PM
// Design Name: 
// Module Name: comp2bit_tb
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


module comp2bit_tb();

    reg [1:0] A;
    reg [1:0] B;
    wire Ga,Gb,E,La,Lb;
    
        comp2bit TB (
            .a(A),
            .b(B),
            .Ga(Ga),
            .Gb(Gb),
            .E(E),
            .La(La),
            .Lb(Lb)
         );
         
        
        integer i,j;
        initial begin
        for(i=0; i<4; i=i+1) 
            begin
            for (j=0; j<4; j=j+1)
                begin
                A = i;
                B = j;
                #10;
            end
        end
        $finish;
        end
endmodule
