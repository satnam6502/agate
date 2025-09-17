module nandGate_tb;

   logic a, b, c;

   nandGate nandGate_inst (.i1(a), .i2(b), .o(c));

    initial begin
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 $finish;
    end

    initial
      if ($test$plusargs("trace") != 0) begin: vcd
        $dumpfile("nandGate_tb.vcd");
        $dumpvars();
      end: vcd

endmodule: nandGate_tb
