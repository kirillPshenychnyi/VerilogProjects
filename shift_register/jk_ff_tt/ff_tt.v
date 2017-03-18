module jk_ff_tt(clk, rst, j, k, q, nq);

   input clk, rst, j, k;
   output q,nq;
   
   wire nclk;
   wire m_q, m_nq;
   wire s_q, s_nq;
   
   assign nclk = ~clk;

   ff master ( .clk(clk), .rst(rst), .j(j), .k(k), .q(m_q), .nq(m_nq) );

   ff slave ( .clk(nclk), .rst(1'b1), .j(m_nq), .k(m_q), .q(q), .nq(nq) );
   
   
   
endmodule // jk_ff_tt
