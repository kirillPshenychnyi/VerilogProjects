module shift_register(clk, rst, pi, q);
   
   parameter width = 4;
 
   input clk,rst, pi;	
   output [width-1:0] q;
	
   wire [width-1:0] q_tmp;
   wire [width-1:0] nq_tmp;
   wire       n_pi;
	
   not(n_pi, pi);
	
   //clk, rst, j, k, q, nq
   jk_ff_tt first(  .clk(clk), .rst(rst),  .k(pi),       .j(n_pi),      .q(q_tmp[0]), .nq(nq_tmp[0]) );

   genvar     i;
   generate for( i = 0; i < width - 1; i = i + 1 )
     begin
	jk_ff_tt jf_ff( .clk(clk), .rst(rst),  .k(q_tmp[i]), .j(nq_tmp[i]), .q(q_tmp[i+1]), .nq(nq_tmp[i+1]) );
     end
   endgenerate
   
  genvar     y;
  generate 
     for( y = 0; y < width; y = y + 1 )
     begin
	 assign q[y] = q_tmp[y];
    end
  endgenerate
   
endmodule
