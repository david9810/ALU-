`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:18 10/03/2019 
// Design Name: 
// Module Name:    alu 
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
module alu(
	input clk,
    input rst,
    input [3:0] rd_reg1,
    input [3:0] rd_reg2,
    input [2:0] alu_op,
    output reg [3:0] alu_output
    );

always @(posedge clk or posedge rst) begin
	if (rst) begin
		alu_output <= 3'b000;
	end
	else case (alu_op)
		3'b000:begin 			//Suma
			alu_output = rd_reg1 + rd_reg2;
		end
		3'b001:begin 			//Negador
			alu_output = ~rd_reg1;
		end
		3'b010:begin 			//Corrimiento a la derecha
			alu_output = rd_reg1>>1;
		end
		3'b011:begin 			//Corrimiento a la izquierda
			alu_output = rd_reg1<<1;
		end
		3'b100:begin 			//Comparacion A > B
			alu_output = (rd_reg1 > rd_reg2) ? 4'b0001 : 4'b0000;
		end
		3'b101:begin 			//Comparacion A == B
			alu_output = (rd_reg1 == rd_reg2) ? 4'b0001 : 4'b0000;
		end
		3'b110:begin 			//Operacion de guardar
			alu_output = rd_reg2;
		end
		3'b111:begin 			// Operacion de cargar
			alu_output = rd_reg1;
		end

		default: begin
			alu_output = 4'b0000;
		end
	endcase
end


endmodule
