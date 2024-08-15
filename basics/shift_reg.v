
`timescale 1ns / 1ps

module shift_reg #(
    parameter Width = 1,
    parameter Size  = 4
) (
    input clk_i,
    input we_i,
    input rst_ni,
    input [Width-1 : 0] data_i,
    output [Width-1 : 0] data_o
);

  integer size_c;
  reg [Width-1 : 0] mem[0 : Size-1];

  assign data_o = mem[Size-1];

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      for (size_c = 0; size_c < Size; size_c = size_c + 1) begin
        mem[size_c] <= 0;
      end
    end else if (we_i) begin
      mem[0] <= data_i;
      for (size_c = 1; size_c < Size; size_c = size_c + 1) begin
        mem[size_c] <= mem[size_c-1];
      end
    end
  end
endmodule


module tb_shift_reg;
  localparam WIDTH = 8;
  localparam SIZE = 3;
  reg clk;
  reg we_i;
  reg rst_ni;
  reg [WIDTH-1 : 0] data_i;
  wire [WIDTH-1 : 0] data_o;

  shift_reg #(
      .Width(WIDTH),
      .Size (SIZE)
  ) uut (
      .clk_i (clk),
      .we_i  (we_i),
      .rst_ni(rst_ni),
      .data_i(data_i),
      .data_o(data_o)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("tb_shift_reg.vcd");
    $dumpvars(0, tb_shift_reg);
    clk <= 0;
    we_i <= 0;
    data_i <= 8'hf0;
    rst_ni <= 0;
    #1 rst_ni <= 1;
    #13 we_i <= 1;
    #10 data_i <= 8'ha0;
    #10 we_i <= 0;
    #5 data_i <= 8'h80;
    we_i <= 1;
    #10 data_i <= 8'h60;
    #10 data_i <= 8'h49;
    #10 data_i <= 8'h20;
    rst_ni <= 0;
    #10 data_i <= 8'h15;
    #10 data_i <= 8'h19;
    rst_ni <= 1;
    #10 data_i <= 8'hc3;
    $finish;
  end
endmodule
