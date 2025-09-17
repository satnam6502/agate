module nandGate(
  input  logic i1,
  input  logic i2,
  output logic o);
  logic net3;
  logic net2;
  logic net1;
  logic net0;

  assign o = net3;
  not (net3, net2);
  and (net2, net0, net1);
  assign net1 = i2;
  assign net0 = i1;
endmodule: nandGate