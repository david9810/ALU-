`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:16 09/26/2019 
// Design Name: 
// Module Name:    shift 
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
module shift(
		input clk,
		input [1:0]shift_enable,
		input in_reg,
		output shifted_reg
    );

always @(posedge clk)
begin
	if(shift_enable[0]==1)
	begin
		case(shift_enable[1])
			0: shifted_reg<=in_reg<<1;
			1: shifted_reg<=in_reg>>1;
		endcase
	end
end

endmodule