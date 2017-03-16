module ff (rst, j, k, d, clk, q, nq);
   
   input rst,j,k,clk,d;
   output reg q, nq;
    
   always@(posedge clk or posedge rst) begin : MAIN
      reg q_tmp;
      
      if( rst == 'b0 )
	q_tmp = 'b0;
      else begin
	 case({j,k})
	   'b00: q_tmp = !q_tmp;
	   'b01: q_tmp = 'b1;
	   'b10: q_tmp = 'b0;
	   'b11: q_tmp = d;
	   default : q_tmp = 'bx;
	   
	 endcase; // case ({j,k})
       end
	 q = q_tmp;
	 nq = ~q_tmp;
	 
      end
   
endmodule 
  
