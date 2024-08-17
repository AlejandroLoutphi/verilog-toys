module fadder (
    input  a_i,
    input  b_i,
    input  carry_i,
    output result_o,
    output carry_o
);

  wire a_xor_b = a_i ^ b_i;
  assign result_o = a_xor_b ^ carry_i;
  assign carry_o  = (a_xor_b & carry_i) | (a_i & b_i);

endmodule
