`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:00:45 09/26/2019
// Design Name:
// Module Name:    b_registro
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
module b_registro(
    input w_r_reg,
    input regadd,
    input [3:0] wd_reg,
    input enable_reg,
    input rst,
    input clk,
    output reg [3:0] rd_reg1,
    output reg [3:0] rd_reg2
    );

	//Inicializacion de registros
	reg [3:0] data_reg [1:0];

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			data_reg[0] <= 4'b0000;
			data_reg[1] <= 4'b0000;
		end
		else if (enable_reg) begin
      if(w_r_reg) begin
        data_reg[regadd] <= wd_reg;
		  end
      else begin
			rd_reg1 <= data_reg[0];
			rd_reg2 <= data_reg[1];
		  end
    end
	end


endmodule
