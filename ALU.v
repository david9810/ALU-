`timescale 1ns / 1ps
module ALU (
  input clk,
  input rst,
  input [2:0] opcode,
  input [4:0] operad,
  input [3:0] rd_reg1,
  input [3:0] rd_reg2,
  output [3:0] result,
);
//Declaración salidas de cada bloque
wire[3:0] out_suma;
wire[3:0] out_neg;
wire[3:0] out_sh;
wire[3:0] out_comp;
wire[3:0] out_reg1;
wire[3:0] out_reg2;

//Declaración entradas enable de cada bloque
reg [5:0] enable;
wire enable_suma;
wire enable_neg;
wire enable_sh;
wire enable_comp;
wire enable_reg;



assign enable_suma= enable[1];
assign enable_neg= enable[2];
assign enable_sh= enable[3];
assign enable_comp= enable[4];
assign enable_reg= enable[5];

always @(posedge clk) begin
    case(opcode)
      3'b000: enable<=2;
      3'b001: enable<=4;
      3'b010: enable<=8;
      3'b011: enable<=9;
      3'b100: enable<=16;
      3'b101: enable<=17;
      3'b110: enable<=32;
      3'b111: enable<=33;
    endcase
end
//instanciación de los bloques
shift sh (.enable_sh(enable_sh),.reg_sh(reg_sh),.reg_sel(reg_sel),.ans(out_suma));
b_registro reg (.enable_reg(enable_reg),.w_r_reg(w_r_reg),.regadd(regadd),.wd_reg(wd_reg),.rd_reg1(out_reg1),.rd_reg2(out_reg2));
sum su (.enable_suma(enable_suma),.rd_reg1(out_reg1),.rd_reg2(out_reg2),.ans(out_suma));


endmodule
