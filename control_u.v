`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:51 10/04/2019 
// Design Name: 
// Module Name:    control_u 
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
module control_u(
    input [7:0] instruction,
    input load,
	input clk,
	input rst,
    output reg [2:0] alu_op,
    output reg wa_reg,
    output reg [3:0] wd_reg,
    output reg ra_reg1,
    output reg ra_reg2,
    output reg w_enable,
    output reg ready
    );

always @(posedge clk or posedge rst) begin
	if (rst) begin
		alu_op <= 3'b000;
		wa_reg <= 0;
		wd_reg <= 4'b0000;
		ra_reg1 <= 0;
		ra_reg2 <= 0;
		w_enable <= 0;
		ready <= 0;
	end
	else if (load) begin
		alu_op <= instruction[7:5];
		case (alu_op)
			3'b000:begin
				ra_reg1=instruction[0];
				ra_reg2=instruction[1];
				w_enable=1'b0;
			end
			3'b001:begin
				ra_reg1=instruction[4];
				w_enable=1'b0;
			end
			3'b010:begin
				ra_reg1=instruction[4];
				w_enable=1'b0;
			end
			3'b011:begin
				ra_reg1=instruction[4];
				w_enable=1'b0;
			end
			3'b100:begin
				ra_reg1=instruction[4];
				ra_reg2=instruction[3];
				w_enable=1'b0;
			end
			3'b101:begin
				ra_reg1=instruction[4];
				ra_reg2=instruction[3];
				w_enable=1'b0;
			end
			3'b110:begin
				wa_reg=instruction[4];
				wd_reg=instruction[3:0];
				w_enable=1'b1;
			end
			3'b010:begin
				ra_reg1=instruction[4];
				w_enable=1'b0;
			end
		endcase
	end
end

b_registro b_registro(.clk(clk), .rst(rst), .wa_reg(wa_reg), .ra_reg1(ra_reg1), .ra_reg2(ra_reg2), .wd_reg(wd_reg), .w_enable(w_enable), .alu_op(alu_op));

endmodule
