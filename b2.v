module counter_10 
( 
   input clk, reset, 
   input d, 
   output reg [3:0] q, 
   output reg c 
);
 
always@(posedge clk,posedge reset) 
begin
   if(reset) begin
      q <= 4'h0; 
      c <= 1'b0; 
   end
   else begin
     if(!d) begin 
        if (q == 4'h9) begin
            q <= 4'h0; 
            c <= 1'b1; 
        end
        else begin
           q <= q + 1'b1; 
           c <= 1'b0; 
        end
     end
   else begin
     if (q == 4'h0) begin
        q <= 4'h9; 
        c <= 1'b1; 
     end
     else begin 
        q <= q - 1'b1; 
        c <= 1'b0; 
     end
   end
   end
end

endmodule 
