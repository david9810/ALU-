module ALU (
  input main_clk,
  input rst,
  input [2:0] opcode,
  input [4:0] operad,
  output [3:0] result,
);


reg [7:0] enable;
wire enable_suma;
wire enable_neg;
wire enable_shr;
wire enable_shl;
wire enable_compma;
wire enable_compig;
wire enable_save;
wire enable_load;

assign enable_suma= enable[0];
assign enable_neg= enable[1];
assign enable_shr= enable[2];
assign enable_shl= enable[3];
assign enable_compma= enable[4];
assign enable_compig= enable[5];
assign enable_save= enable[6];
assign enable_load= enable[7];

always @(*) begin
    case(opcode)
      3'b000: enable<=1;
      3'b001: enable<=2;
      3'b010: enable<=4;
      3'b011: enable<=8;
      3'b100: enable<=16;
      3'b101: enable<=32;
      3'b110: enable<=64;
      3'b111: enable<=128;
