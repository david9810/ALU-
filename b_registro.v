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
    input wa_reg,
    input ra_reg1,
    input ra_reg2,
    input [3:0] wd_reg,
    input w_enable,
    input rst,
    input clk,
    input wire [3:0] alu_op,
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
		else if (w_enable) begin
			data_reg[wa_reg] <= wd_reg;
		end
		else begin
			rd_reg1 <= data_reg[ra_reg1];
			rd_reg2 <= data_reg[ra_reg2];
		end
	end

alu alu(.clk(clk), .rst(rst), .alu_op(alu_op), .rd_reg1(rd_reg1), .rd_reg2(rd_reg2));

endmodule