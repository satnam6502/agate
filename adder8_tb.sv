module adder8_tb;

   logic cin;
   logic [7:0] a;
   logic [7:0] b;
   logic [7:0] sum;
   logic cout;


   adder8 adder8_inst (.x(a), .y(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
            cin = 0; a = 8'd12; b = 8'd5;
        #10 $finish;
    end

    initial
      if ($test$plusargs("trace") != 0) begin: vcd
        $dumpfile("adder8_tb.vcd");
        $dumpvars();
      end: vcd

endmodule: adder8_tb
