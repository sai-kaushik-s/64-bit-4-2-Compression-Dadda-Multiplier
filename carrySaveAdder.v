`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:09:33 11/06/2020 
// Design Name: 
// Module Name:    carrySaveAdder 
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
module carrySaveAdder(
    input [127:0] A,
    input [127:0] B,
    input [127:0] Ci,
    output [127:0] S,
    output [127:0] Ca
    );
	
	genvar i;
	generate
		for(i = 0; i < 127; i = i + 1)
		begin: carry_save_adder
			fullAdder fa(A[i], B[i], Ci[i], S[i], Ca[i + 1]);
		end
	endgenerate
	assign Ca[0] = 1'b0;
	assign S[127] = A[127] ^ B[127] ^ Ci[127];

endmodule
