
//--------------------------------------------------------------------------------------------------
// File: Delay in Procedural Assignments.v
// Purpose: Explain the delay's in Procedural Assignments
// Concept: 1. Whenever RHS changes, if no delay is specified the assignmnet happens with zero delay.
//          2. Delays can be Inter-statement "#delay LHS<=RHS" or Intra-statement "LHS<= #delay RHS" 
// 
// Owner: Rohit Kumar Singh
//--------------------------------------------------------------------------------------------------


`timescale 1ns/100ps
module delays(clock, A,out1,out2,out3,out4,out5,out6);
input clock;
input A;
output reg out1; 
output reg out2; 
output reg out3; 
output reg out4; 
output reg out5; 
output reg out6; 

always @(A) begin
assign out1=~A;
assign out2 <= ~A;
assign #5 out3 = ~A;
assign #5 out4 <= ~A;
assign out5 = #5 ~A;
assign out6 <= #5 ~A;
end

endmodule
