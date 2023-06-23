module half_adder_design(
  output wire sum,
  output wire cout,
  input wire a,
  input wire b
);
  assign sum = a ^ b;
  assign cout = a & b;
endmodule
