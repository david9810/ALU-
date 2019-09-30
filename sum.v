`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:03:00 09/26/2019
// Design Name:
// Module Name:    sum
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
module suma(
		input clk,
		input [3:0]rd_reg1,
		input [3:0]rd_reg2,
		input enable_suma,
		output [3:0]ans
    );

always @(posedge clk)
begin
if(enable_suma)
begin
ans<= rd_reg1+rd_reg2;
end
end

endmodule
