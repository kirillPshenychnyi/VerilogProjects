
module testbench();

   reg clk, rst;
   wire  [15:0] q_out;
   reg pi;

   initial
     begin
	$dumpfile("waveform.vcd");
	$dumpvars;	
     end

   initial
     #700 $finish;
   
   initial		 
    begin
       clk = 'b0;				
       rst = 'b1; 
       pi = 'b1;		 	 
      
       #340 pi = 'b0;
       
    end
	
   shift_register #(16) dut (.clk(clk), .rst(rst), .pi(pi), .q(q_out) );
		
   always
     #10 clk = ~clk;		
		
endmodule
