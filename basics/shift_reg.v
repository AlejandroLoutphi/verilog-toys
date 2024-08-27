`include "dff_w_we.v"

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

  wire [Width-1 : 0] mem[0 : Size];

  genvar size_c;

  assign mem[0] = data_i;
  assign data_o = mem[Size];

  generate
    for (size_c = 0; size_c < Size; size_c = size_c + 1) begin : g_dffs
      dff_we #(
          .Width(Width)
      ) dffs (
          .clk_i(clk_i),
          .rst_ni(rst_ni),
          .we_i(we_i),
          .i(mem[size_c]),
          .o(mem[size_c+1])
      );
    end
  endgenerate
endmodule
