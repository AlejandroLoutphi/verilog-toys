module hadder (
    input  a_i,
    input  b_i,
    output result_o,
    output carry_o
);

  assign result_o = a_i ^ b_i;
  assign carry_o  = a_i & b_i;

endmodule
