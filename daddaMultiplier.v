`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:37 11/06/2020 
// Design Name: 
// Module Name:    daddaMultiplier 
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
module daddaMultiplier(
    input [63:0] A,
    input [63:0] B,
    output [128:0] C
);
	
	genvar i;
	wire [63:0] temp [63:0];
	wire [127:0] AB[63:0], temp1[63:0], w1[31:0], w2[15:0], w3[7:0], w4[3:0], w5[1:0];
	
	generate
		for(i = 0; i < 64; i = i + 1)
		begin: pp_loop
			partialProduct pp(A, B[i], temp[i]);
			assign temp1[i] = {{64{1'b0}}, temp[i]};
			assign AB[i] = temp1[i] << i;
		end
	endgenerate
	
	adder4_2comp a42c_0(AB[0], AB[1], AB[2], AB[3], w1[0], w1[1]);
	adder4_2comp a42c_1(AB[4], AB[5], AB[6], AB[7], w1[2], w1[3]);
	adder4_2comp a42c_2(AB[8], AB[9], AB[10], AB[11], w1[4], w1[5]);
	adder4_2comp a42c_3(AB[12], AB[13], AB[14], AB[15], w1[6], w1[7]);
	adder4_2comp a42c_4(AB[16], AB[17], AB[18], AB[19], w1[8], w1[9]);
	adder4_2comp a42c_5(AB[20], AB[21], AB[22], AB[23], w1[10], w1[11]);
	adder4_2comp a42c_6(AB[24], AB[25], AB[26], AB[27], w1[12], w1[13]);
	adder4_2comp a42c_7(AB[28], AB[29], AB[30], AB[31], w1[14], w1[15]);
	adder4_2comp a42c_8(AB[32], AB[33], AB[34], AB[35], w1[16], w1[17]);
	adder4_2comp a42c_9(AB[36], AB[37], AB[38], AB[39], w1[18], w1[19]);
	adder4_2comp a42c_10(AB[40], AB[41], AB[42], AB[43], w1[20], w1[21]);
	adder4_2comp a42c_11(AB[44], AB[45], AB[46], AB[47], w1[22], w1[23]);
	adder4_2comp a42c_12(AB[48], AB[49], AB[50], AB[51], w1[24], w1[25]);
	adder4_2comp a42c_13(AB[52], AB[53], AB[54], AB[55], w1[26], w1[27]);
	adder4_2comp a42c_14(AB[56], AB[57], AB[58], AB[59], w1[28], w1[29]);
	adder4_2comp a42c_15(AB[60], AB[61], AB[62], AB[63], w1[30], w1[31]);

	adder4_2comp a42c_16(w1[0], w1[1], w1[2], w1[3], w2[0], w2[1]);
	adder4_2comp a42c_17(w1[4], w1[5], w1[6], w1[7], w2[2], w2[3]);
	adder4_2comp a42c_18(w1[8], w1[9], w1[10], w1[11], w2[4], w2[5]);
	adder4_2comp a42c_19(w1[12], w1[13], w1[14], w1[15], w2[6], w2[7]);
	adder4_2comp a42c_20(w1[16], w1[17], w1[18], w1[19], w2[8], w2[9]);
	adder4_2comp a42c_21(w1[20], w1[21], w1[22], w1[23], w2[10], w2[11]);
	adder4_2comp a42c_22(w1[24], w1[25], w1[26], w1[27], w2[12], w2[13]);
	adder4_2comp a42c_23(w1[28], w1[29], w1[30], w1[31], w2[14], w2[15]);
	
	adder4_2comp a42c_24(w2[0], w2[1], w2[2], w2[3], w3[0], w3[1]);
	adder4_2comp a42c_25(w2[4], w2[5], w2[6], w2[7], w3[2], w3[3]);
	adder4_2comp a42c_26(w2[8], w2[9], w2[10], w2[11], w3[4], w3[5]);
	adder4_2comp a42c_27(w2[12], w2[13], w2[14], w2[15], w3[6], w3[7]);
	
	adder4_2comp a42c_28(w3[0], w3[1], w3[2], w3[3], w4[0], w4[1]);
	adder4_2comp a42c_29(w3[4], w3[5], w3[6], w3[7], w4[2], w4[3]);
	
	adder4_2comp a42c_30(w4[0], w4[1], w4[2], w4[3], w5[0], w5[1]);
	
	recursiveDoubling rd0(w5[0], w5[1], C[127:0], C[128]);

endmodule
