//27/07/26

// //----------------packages with import------------------

// package hai;
//  int d=10,a=40,b=22;;
// function void display();
//   $display("package");
//   endfunction 
// endpackage
// //with import
// // module tb;
// //   //import hai::*;//import all
// //   import hai::b;//single variable
// //   initial begin 
// //    // $display("%0d",d); $display();
// //     $display(b);
// //   end
// // endmodule 
// ------------------//without import ----------
// module tb;
//   initial begin
//     $display(hai::b); $display(hai::a); //without import 
//     hai::display();
//   end 
// endmodule
//---------------------------------------------------

// //-------------import interface
// interface in;
//   //logic clk;
//   logic a=99;
  
//   function void dis();
//     $display("function %0d",a);
//   endfunction
  
//   task w(input int b);
//     $display("write %0d",b);
//   endtask
  
//   task r();
//     $display("read");
//   endtask
  
//   modport MAS( 
//     import w,
//     import r,
//     import dis);
// endinterface
    
// module tb(in.MAS v);
//   initial begin
//     v.w(2);
//     v.r;
//     v.dis();
//   end 
// endmodule
    
// module abc;
//   in i();
//   tb t(i);
// endmodule


//-------------export in interface 

// interface in;
//   int c;
//     extern task w();
//       extern function int mul(input int a,b);
//     modport soo(export w,export mul);
//  	initial begin
//       w(); 
    
//       c=mul(2,3);
//       $display("c value is %0d",c);
      
//     end
// task automatic exe();
//  w();
 
// endtask
// endinterface

// module tb(in.soo s) ;
//   task s.w();
//     $display("write");
//   endtask
  
//   function int s.mul(input int a,b);
//     return a*b;
//   endfunction 
// endmodule
              
// module tb1;
//   in i();
//   tb t(i);
//   initial begin
// //     i.w();
//     i.mul(6,7);
//     $display("%0d",i.mul(6,7));
//     i.exe();
    
//   end
// endmodule

//--------------- import,export in  class
// interface inr;
//   logic[3:0]d;
//   logic[4:0]b;
  
//   task sh(int a);
//     $display("inter %0d",a);
//   endtask
  
//   function int dis(int c,d);
//     return c/d;  
//   endfunction 
  
//   extern task t1(int f);
//     extern function int g(int h,j);
//      // modport mo(import dis,import sh,export task t1(int f),export g);
//       modport mo(import dis,import sh,export t1,export g);
             
// endinterface
               
// class cl;
//   virtual inr.mo in;
//   int x;
//   function new(virtual inr.mo in);
//     this.in=in;
//   endfunction
//   task don();
//     in.sh(23);
//     x=in.dis(9,3);
//     $display("don %0d",x);
   
//   endtask
// endclass

//  module tb(inr.mo in);
//  // inr i();
//   cl c;
//   task in.t1(int f);
//     $display("mod %0d",f);
//   endtask
  
//   function int in.g(int h,j);
//     return h-j;
//   endfunction
  
//   initial begin
//     c=new(in);
//    in.sh(7);
//     $display("in mod %0d", in.dis(20,4));
// //    in.dis(6,3); 
// //     $display("fun %0d",in.dis(2,3));
//   c.don();
//     $display("don call %0d",c.x);
//     in.t1(8);
//     $display("t1 %0d",in.g(34,12));
//   end
    
    
// endmodule

//  module t2();
//    inr it();
//    tb t3(it);     
//  endmodule

//28/07/26
//--------------packages

// package ab;
// int a=5,b=9,c=1;
// task to();
//   $display("task %0d",a);
// endtask 
// endpackage

// package cd;
// import ab::*;
// function int fun(int a,b);
//   return a**b;
// endfunction
// export ab::*;
// //import ab::a;
// task bow();
//   $display("bowww");
// endtask 
// endpackage 

// module tb;
//   import cd::*;
//   //import cd::a;
//   initial begin
//     //$display("%0d %0d %0d ",a,b,c);
//     $display("%0d",fun(2,3));
//   //  bow();
//   end
// endmodule

// //----%p,%m
// module ch;
//   int a;
//   task dis(int c);
//     //c=7;
//     $display("%m",c);
//     endtask
// endmodule
// module hoo;
//   ch c();
//   initial begin
//     c.dis(9);
//   end
//   endmodule

//mux, decoder 

// module tb(
//   input logic s0,s1;
//   input logic i0,i1,i2,i3;
//   output logic y;
//   output logic [3:0]d);
//   assign y= s1? (s0? i3 :i2):(s0 ? i1:i0);
  
//   initial begin
    
//   end
// endmodule

// module m4_con(
// input i3,i2,i1,i0,s1,s0,
//   output y);
// assign y=s1 ?(s0 ? i3:i2):(s0 ? i1:i0);
// endmodule


// module tb;
// reg i3,i2,i1,i0,s1,s0;
// wire y;
//    m4_con dut(.*);
//    initial begin
//    repeat (8) begin
//    {i3,i2,i1,i0,s1,s0}=$random;
//    #2;
//    $display("i3=%b i2=%b i1=%b i0=%b s1=%b s0=%b y=%b",i3,i2,i1,i0,s1,s0,y);
//    end
//    end
//    endmodule

//29/07/26
//----------mux,decoder

// //`define M
// `define DEC
// module tb(
//   input logic s1,s0,
//   input logic i0,i1,i2,i3,
//   output logic y,
//   output logic [3:0]d);
  
//   `ifdef M
//  // assign y=s1?(s0? i0:i1):(s0? i2:i3);
//   assign y = (~s1&~s0&i0) | (~s1&s0&i1) | (s1&~s0&i2) | (s1&s0&i3);
//   assign d=4'b0000;
//  // $display("mux");
  
//   `elsif DEC
//   assign d[0]=~s1&~s0;
//   assign d[1]=~s1&s0;
//   assign d[2]=s1&~s0;
//   assign d[3]=s1&s0;
//   assign y=1'b0;
//   //$display("decoder");
  
//   `else
//   initial 
//     $display("enter mux or decoder");
  
//   `endif 
// endmodule

// module tb1;
//  logic s1,s0;
//  logic i0,i1,i2,i3;
//  logic y;
//  logic [3:0]d; 
//   tb dut (s1,s0,i0,i1,i2,i3,y,d);
  
//   initial begin
//     repeat (5) begin
//       //{s1,s0,i3,i2,i1,i0}=$urandom_range(2,8);
//    #2;
//       begin	
//       s0=0;s1=0;
//       s0=0;s1=1;
//       s0=1;s1=0;
//       s0=1;s1=1;
//       end
//       $monitor("i3=%b i2=%b i1=%b i0=%b s1=%b s0=%b y=%b,d=%b",i3,i2,i1,i0,s1,s0,y,d);
//       //$monitor("i0=%b i1=%b i2=%b i3=%b s1=%b s0=%b y=%b,d=%b",i0,i1,i2,i3,s1,s0,y,d);
//   end
//   end
// endmodule
                 
//----implements----------
// interface class a;
//   pure virtual function int add(int d,e);    
// endclass
  
// interface class b;
//   pure virtual task t(int t1);
// endclass

// virtual class c;
//   pure virtual function void f(int f1);  
// endclass
  
//   class c1 extends c implements a,b;
//      virtual function int add(int d,e);
//     $display("%0d %0d",d,e);
//   endfunction
    
//     virtual task t(int t1);
//       $display("t1 %0d ",t1);
//     endtask 
//     function void f(int f1);
//       $display("f1 %0d",f1);
//     endfunction    
//   endclass
    
// module tb;
//   b b1;
//   c1 c2;
//   initial begin
//     c2=new();
//     b1=c2;
//     c2.add(3,2);
//     c2.f(7);
//     c2.t(6);
//   end
// endmodule

//
