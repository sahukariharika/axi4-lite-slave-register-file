//03/08/26
//----------scheduling scemantics

// module tb;
//  logic clk,a;
  
//   always #5 clk=~clk;
//   initial begin
//     clk=0;
//     a=0;
//     #2 a=1; 
//    // $finish;
//   end
  
//   property p;
//     @(posedge clk)a;
//   endproperty
  
//   assert property(p);
// endmodule

// //active
// module tb;
//   int a,b;
//   initial begin
//     a=4;
//     b=7;
//    // $display("a=%0d,b=%0d",a,b);
//   end
//   initial begin
//     a=9;
//     b=2;
//   end
//    initial begin
//     a=3;
//     b=3;
//   end
  
//   initial begin
//     #1 $display(a);
//     #2 $display(b);
//   end
// endmodule

// //inactive - #0
// module tb;
//   initial begin
//     $display("A");
//     #0;
//     $display("B");
//     #1;
//     $display("d");
//   end
//   initial begin
//     $display("c");
//   end
  
// endmodule

//NBA region 

// module tb;
//   int a,b,c;
//   initial begin
//     a=2;b=4;
    
//    a<=b; b<=20;c=10;c<=15;  //  Evaluate RHS in Active,update LHS in NBA
//     //a=b;b=20;//immediate change 
//     $display("%0t a=%0d b=%0d",$time,a,b);
//     $strobe("strobe %0d %0d %0d ",a,b,c);
//     #0;
//     $display("%0t a=%0d b=%0d",$time,a,b);
//     #1;
//     $display("%0t a=%0d b=%0d",$time,a,b);
//     $monitor("%0d ",a);
//   end
// endmodule

//--------------race condition 
// module tb;
//   logic clk,q,d;
//   always #4 clk=~clk;
//   always @(posedge clk)
//     q<=d;
//   always @(posedge clk)
//     q=~q;
//   initial begin
//     clk=0;
//     d=0;
//     #10 $finish;
//   end
//   always @(posedge clk)
//     $display("%0t d=%0b q=%0b",$time,d,q);
// endmodule

//non blocking ordering

// module tb;
//   int a,b;
//   initial begin
//    a=1;b=10;
//     a<=2;
//     a=3;
//     a<=a;a<=5;
//     a<=b;
    
//     #0;
//     $display("%0d",a);
//     #1;
//     $display("%0d",a);
//   end
// endmodule

// module tb;
// int a,b;
// initial begin
// a=1;
// b=2;
// a<=b;
// b<=a;
// #0;
// $display(a,b);
// #1;
// $display(a,b);
// end
// endmodule

module tb;
  int a;
  logic clk;
  
  always #3 clk=~clk;
  always @(posedge clk)
    a=5;
  always @(posedge clk)
    a<=15;
  
  always @(posedge clk)
    $display("%0t %0d",$time,a);
  
  initial begin
  clk=0;
    #5 $finish;
  end
endmodule
