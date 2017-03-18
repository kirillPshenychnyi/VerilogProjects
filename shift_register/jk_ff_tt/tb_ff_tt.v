module testbench();

   reg tb_clk,tb_j,tb_k,tb_rst;
   wire tb_q, tb_nq;
   
   jk_ff_tt dut(
	  .j(tb_j),
	  .k(tb_k),
	  .rst(tb_rst),
	  .clk(tb_clk),
	  .q(tb_q),
	  .nq(tb_nq)
       );

   initial begin
      $dumpfile("waveform.vcd");
      $dumpvars;
   end

   event reset_trigger;
   event reset_done;
   
   initial begin
      forever begin
	 @(reset_trigger);
	 tb_rst = 'b1; 
	 tb_rst = 'b0;
	 @(posedge tb_clk);
	 tb_rst = 'b1;
	 -> reset_done;
	 
      end
   end

   initial begin
      tb_clk = 'b0;
      tb_j = 'b0;
      tb_k = 'b0;

      -> reset_trigger;

      @(reset_done); 
      tb_j = 'b0;
      tb_k = 'b1;

      repeat(2)
	@(posedge tb_clk);

      #5; 
      tb_j = 'b1;
      tb_k = 'b0;
     
      repeat(2)
       @(posedge tb_clk);

      #5;    
      tb_j = 'b1;
      tb_k = 'b1;
 
      repeat(2)
	@(posedge tb_clk);

      #5;
      tb_j = 'b0;
      tb_k = 'b0;
      
   end
   
   initial
     #150 $finish;
   
   always 
     #10 tb_clk = ~tb_clk;
     
endmodule // testbench

  
