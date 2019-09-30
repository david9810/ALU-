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
		input enable_sh,
		input reg_sh,
		input [3:0] reg_sel,
		output [3:0]shifted_reg,
    );

always @(posedge clk)
begin
	if(enable_sh)begin
		if(reg_sh) begin
			shifted_reg<=reg_sel<<1;
		end
		else begin
			shifted_reg<=reg_sel>>1;
		end
	end
end

endmodule
