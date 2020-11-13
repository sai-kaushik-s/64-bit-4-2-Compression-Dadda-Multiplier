`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:09 11/06/2020 
// Design Name: 
// Module Name:    adder4_2comp 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module adder4_2comp(
    input [127:0] A1,
    input [127:0] A2,
    input [127:0] A3,
    input [127:0] A4,
    output [127:0] S1,
    output [127:0] S2
    );
	
	wire [127:0] w1, w2;

	carrySaveAdder fa1 (A1, A2, A3, w1, w2);
	carrySaveAdder fa2 (A4, w1, w2, S1, S2);


endmodule
