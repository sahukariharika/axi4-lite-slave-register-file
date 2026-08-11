
module top;
integer a=1;
real r=1;
time t;
r
initial begin
	$display("##### default values of the varibales###########  ");
	$display("\t a=%0d",a);
	$display("\t r=%0d",r);
	$display("\t t=%0d",t);
	
		
	$display("\t time =%0t",$time);
		a=100;
		r=202.25;
		t=10.55;//giving  dalay of  10 ns 
		#10.55;
		
	$display("##### after assigning  values of the varibales###########  ");
	$display("\t a=%0d",a);
	$display("\t r=%f",r);
	$display("\t t=%0d",t);
	$display("\t time =%0t",$time);
	
end

endmodule

