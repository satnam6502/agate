module twoSorter8_tb;

   logic [7:0] a;
   logic [7:0] b;
   logic [7:0] lower, higher;


   twoSorter8 twoSorter8_inst (.x(a), .y(b), .lower(lower), .higher(higher));

    initial begin
            a = 8'd17; b = 8'd3;
        #10 a = 8'd4;  b = 8'd6;
        #10 $finish;
    end

    initial
      if ($test$plusargs("trace") != 0) begin: vcd
        $dumpfile("twoSorter8_tb.vcd");
        $dumpvars();
      end: vcd

endmodule: twoSorter8_tb
