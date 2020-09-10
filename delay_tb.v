
//--------------------------------------------------------------------------------------------------
// File: Delay in Procedural Assignments_testbech.v
// Purpose: Explain the delay's in Procedural Assignments
// Concept: 1. Whenever RHS changes, if no delay is specified the assignmnet happens with zero delay.
//          2. Delays can be Inter-statement "#delay LHS<=RHS" or Intra-statement "LHS<= #delay RHS" 
// 
// Owner: Rohit Kumar Singh
//--------------------------------------------------------------------------------------------------


`timescale 1ns/1ns
module delays_tb();
reg A;
reg  out1,out2,out3,out4,out5,out6;
integer output_file;


//--------------------------------------------------------------------------------------
// $monitor will print whenever a signal changes in the design
// This initial block runs concurrently with the other
// blocks in the design and starts at time 0

initial begin
output_file = $fopen("question2.txt","w"); // w = For writing
$monitor("[%t], A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b",
				 $time, A,out1, out2, out3, out4, out5, out6);

end
//--------------------------------------------------------------------------------------

always@(*) begin
//NO Delays
	out1=~A;
	out2 <= ~A; //

	// Inter-assignment delay: Evaluate at t=0, then wait for #5 time units and assign A. 
	#5 out3 = ~A;
	#5 out4 <= ~A;

	// Intra-assignment delay: First execute the statement then wait for 5 time units and then assign A.
	out5 = #5 ~A; //
	out6 <= #5 ~A; //
end


	
//--------------------------------------------------------------------------------------	
initial begin
//output_file = $fopen("question2.txt","w"); // w = For writing
$display("%0t << Starting the Simulation >>",$time);
$fwrite(output_file,"%0t << Starting the Simulation >> \n",
				 $time);
A=1;
$fwrite(output_file,"%0t, A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b \n",
				 $time,A,out1, out2, out3, out4, out5, out6);

#10 A=0;
	

$fwrite(output_file,"%0t, A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b \n",
				 $time,A,out1, out2, out3, out4, out5, out6);
				 
#10 A=1;
	

$fwrite(output_file,"%0t, A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b \n",
				 $time,A,out1, out2, out3, out4, out5, out6);
				 
#10 A=0;
	

$fwrite(output_file,"%0t, A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b \n",
				 $time,A,out1, out2, out3, out4, out5, out6);
				 
#3 A=1;
	

$fwrite(output_file,"%0t, A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b \n",
				 $time,A,out1, out2, out3, out4, out5, out6);
				 
#3 A=0;
	

$fwrite(output_file,"%0t, A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b \n",
				 $time,A,out1, out2, out3, out4, out5, out6);

#9 A=1;
	

$fwrite(output_file,"%0t, A=%b,out1=%b,out2=%b,out3=%b,out4=%b,out5=%b,out6=%b \n",
				 $time,A,out1, out2, out3, out4, out5, out6);
				 
#15;
$fwrite(output_file,"%0t << Ending the Simulation >> \n",
				 $time);
$display(" %0t << Ending the Simulation >>",$time);

$fclose(output_file);
end 
//--------------------------------------------------------------------------------------	


endmodule