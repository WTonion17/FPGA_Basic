module sequence_detector_1001
( input wire clk,reset,
  input wire w,
  output reg z
);

localparam [2:0] s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;

reg [2:0] state_reg, state_next;

always @(posedge clk, posedge reset)
      if(reset)
            state_reg <= s0;
      else 
            state_reg <= state_next;


always @*
      case(state_reg)
          s0:if(w) 
               state_next = s1;
             else
               state_next = s0;
          s1:if(w) 
               state_next = s1;
             else
               state_next = s2;
          s2:if(w) 
               state_next = s4;
             else
               state_next = s3;
          s3:if(w) 
               state_next = s4;
             else
               state_next = s0;
          s4:if(w) 
               state_next = s1;
             else
               state_next = s2;
      default: state_next = s0;
endcase


always @(state_reg)
begin 
      case(state_reg)
          s0: z = 0;
          s1: z = 0;
          s2: z = 0;
          s3: z = 0;
          s4: z = 1;
endcase
end

endmodule

