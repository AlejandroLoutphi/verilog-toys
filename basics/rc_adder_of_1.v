`include "hadder.v"

module rc_adder_of_1 #(
    parameter Width = 4
) (
    input [Width-1 : 0] i,
    output [Width-1 : 0] result_o,
    output carry_o
);

  genvar width_c;
  wire [Width-1 : 0] couts;

  assign carry_o = couts[Width-1];

  hadder adder_0 (
      .a_i(1'b1),
      .b_i(i[0]),
      .result_o(result_o[0]),
      .carry_o(couts[0])
  );

  generate
    for (width_c = 1; width_c < Width; width_c = width_c + 1) begin : g_hadders
      hadder adder_n (
          .a_i(couts[width_c-1]),
          .b_i(i[width_c]),
          .result_o(result_o[width_c]),
          .carry_o(couts[width_c])
      );
    end
  endgenerate
endmodule
