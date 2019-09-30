`timescale 1ns / 1ps

module ALU_TB;

  reg[4:0] operad;
  reg[2:0] opcode;
  reg [3:0] rd_reg1,
  reg [3:0] rd_reg2,
  reg clk;
  reg rst;

  wire [3:0] an;

  ALU uut (
      .operad(operad),
      .opcode(opcode),
      .rd_reg1(rd_reg1),
      .rd_reg2(rd_reg2),
      .clk(clk),
      .rst(rst),
      .result(an)
    );

    inital begin

      opcode=0; //suma
      operad=1;  //save reg2
      rd_reg1=5;
      rd_reg2=4;
      clk=0;
      rst=1;
      #10;
      rst=0
      #50 opcode=0; //suma

      end
      always #1 clk=~clk;

endmodule
