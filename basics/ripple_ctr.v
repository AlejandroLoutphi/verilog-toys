`include "dff.v"

module ripple_ctr #(
    parameter Width = 4
) (
    input clk_i,
    input rst_ni,
    output [Width-1 : 0] o
);

  genvar width_c;

  wire [Width : 0] dff_clks;
  assign dff_clks[0] = clk_i;
  assign o = ~dff_clks[Width : 1];

  generate
    for (width_c = 0; width_c < Width; width_c = width_c + 1) begin : g_dffs
      dff #(
          .ResetState(1)
      ) bit_n (
          .clk_i(dff_clks[width_c]),
          .rst_ni(rst_ni),
          .i(o[width_c]),
          .o(dff_clks[width_c+1])
      );
    end
  endgenerate
endmodule
