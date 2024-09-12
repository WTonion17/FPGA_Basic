`timescale 1ns / 1ps	
module counter_10_tb(); 
        reg clk, reset; 
        reg d; 
        wire [3:0] q; 
        wire c; 
        counter_10 dut(.clk(clk), .reset(reset), .d(d), .q(q),.c(c)); 
always
begin
        clk = 1;
	#2;
	clk = 0;
	#2;
end
initial begin
        reset = 1; d = 0; 
        #4; reset = 0; 
        #50; 
        reset = 1; 
        #4; reset = 0; d = 1; 
        #50; 
        $stop; 
end
endmodule
