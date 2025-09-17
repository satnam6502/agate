module adder16_tb;

   logic [15:0] a;
   logic [15:0] b;
   logic [16:0] sum;


   adder16 adder16_inst (.x(a), .y(b), .sum(sum));

    initial begin
            a = 16'd2000; b = 16'd10;
        #10 $finish;
    end

    initial
      if ($test$plusargs("trace") != 0) begin: vcd
        $dumpfile("adder16_tb.vcd");
        $dumpvars();
      end: vcd

endmodule: adder16_tb
