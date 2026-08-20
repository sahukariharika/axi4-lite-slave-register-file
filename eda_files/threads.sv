//04/08/26

// //------always----
// module d(input logic arg,output logic a);
//   initial begin
//   a=arg;
//   end
//   //always arg=~arg;//creates infinate loop
// endmodule

// module tb;
//   logic arg;
//   d dut(arg); 
//   always #3 arg=~arg;
//     initial begin     
//       $monitor("%0t arg=%b",$time,arg);
//         #10 $finish;
//     end
// endmodule 
//---always comb---------
// module d(input logic b,c,output logic a,d);
//  always_comb
//    a=b&c;
// //  always_comb
// //      d<=b&c;
// endmodule

// module tb;
//   logic a,b,c,d;
//   d dut(b,c,a,d);
//   initial begin
//     b=0;c=1;
//     #2;
//     b=1;c=0;
//     #4;
//     $finish;
//   end
//   initial begin
//     $monitor("%0t: a=%0b d=%0b,b=%b,c=%b",$time,a,d,b,c);
//   end
// endmodule 

//-------------fork join-------------
// module tb;
//   initial begin
//     $display("%0t 1",$time);
//     #2;
//     $display("%0t 2",$time);
//     #3 $display("%0t 3",$time);
//   end
// endmodule

//05/08/26

// module tb;
//   logic [7:0]r;
//   initial begin
// fork
//  // $display("%0t 1 %0h ",$time,r);
//   repeat(5)begin
//   begin   
// #50 r = 'h35;
// #100 r = 'hE2;
// #150 r = 'h00;
// #200 r = 'hF7;
//       $display("%0t %0h in",$time,r);
//  end
//   end
// //join 
//     //join_any
// join_none
//     $display("%0t %0h dis",$time,r); 
//   end
// endmodule

//---------------
// module tb;
//   initial begin
    
//     for(int i=0;i<3;i++)
//       fork
//         automatic int j=i;
//         begin         
//           $display(j);
//         end    
//       join_any
//   end
// endmodule
//-------------module inside another module variable calling
// module m;
  
//   initial begin
//    // for(int i=0;i<3;i++)
//     $display("%0t 1",$time);
//     fork
//       #1 $display("%0t 2 ",$time);
//       //#1 $display("%0t 2 %0d",$time,i);
//      begin
//       begin:ab
//         int i=7;
//         #2; $display("%0t 3",$time);
//         #5 $display("%0t 4",$time);
//         #7 $display("%0t 5",$time);
//       end
//        //disable fork;
//       begin:cd
//         #2; $display("%0t 6",$time);
//         #5 $display("%0t 7",$time);
//         #7 $display("%0t 8",$time);
//       end
//      end
//       #2 $display("%0t 9",$time);
//    // join_none
//     join_none
    
//     // disable fork;
//       // #2 $display("%0t 91",$time);
//     #30 $finish;
// end
// endmodule

// module m2;
//   m m1();
//   int i=9;
//   initial begin
//     fork
//       begin
//       #3 $display("%0t 10 %0d ",$time,i);
//       #4 $display("%0t 11 %0d",$time,m1.ab.i);//module to module call
//       end
//     join_any
// end
// initial #60 $finish;
// endmodule
//------------------task inside a funtion using fork_none 

// module tb;
//   int k;
//   task ab();
//     bit[3:0]a=5;
//     fork
//       #3 $display("%0d a",a);
//     join_none
//   endtask
//   function int dis(input bit[3:0]b=7,c=2);
//    	ab();
//     return b+c;
//   endfunction
  
//   initial begin
//     #2;
//     k=dis(1,3);
//     ab();
//     $display("%0d %0d",dis(9,1),k);
//     $display("%0t all",$time);
//   end 
// endmodule

//---------static function,function static 
// module tb;
//   static function int dis(bit[3:0]a=2,b=3);
//     automatic int k;
//     k++;
//     return k;
//   //automatic function int dis(int a=2,int b=3);
//    // return a+b;
//   endfunction 
  
//   function static real sh(real c);//real
//  // function automatic real sh(input int c);
//    // dis();
//     //return c-d;
    
//     return ++c;
//   endfunction
  
//   initial begin    
//    // $display("%0d",dis(10,2));
//    // $display("%0d",sh(10.99991,2.1234789)); 
//     $display("%0f",sh(10)); 
//     $display("%0d",dis());
//         $display("%0d",dis());

//   end
// endmodule

//----------------add(ad(a,b),add(c,d))

// module m;
//   function int add(int a,b);
//     return a+b;
//   endfunction
//     initial begin
//       $display("%0d",add(add(2,3),add(3,3)));
//     end
// endmodule
//------class inside static,automatic task,function--
//  class ab;
// // //   task static d();
// // //   //static task d();
// // //     automatic int c;
// // //     --c;
// // //     $display("c %0d",c);
// // //   endtask 
// //   //   //task automatic i();
// // //   automatic task i();
// // //     static int a;
// // //    a++;
// // //     $display("a %0d",a);
// // //   endtask
  
//   function static int d();
//     automatic int c=2;
//     int c=2;
//     return c--;
//   endfunction 
// 	 int e;
//   function automatic int i();
//    // automatic int b=3;
//    // return b++;
//     return e++;
//   endfunction
// endclass
// module tb;
//   ab a1,a2;
//   initial begin
//   a1=new();
//     a2=new();
// //     a1.d();a1.d();
// //     a1.i();a1.i();
//    // a1.d(1);
//     $display("%0d %0d",a1.d(),a1.i());
//     $display("%0d %0d",a1.d(),a1.i());
//     $display("a2 %0d %0d",a1.d(),a2.i());
//     $display("a2 %0d %0d",a1.d(),a2.i());
//   end
// endmodule 

//06/08/26
//-------factorial function 
// module tb;
//   function int fact(int n);
//     int f,i;
//     f=1;
//     for(i=1;i<=n;i++)
//       f=f*i;
//     return f;
//   endfunction
  
//   initial begin
//     $display("6!=%0d",fact(6));                        
//   end  
// endmodule
//--------recursion

// module tb;
//   int t;
//   function automatic int fact(int n=5); 
//     if(n<=1)
//       return 1;
//     t=fact(n-1);
//       return n*t;
//   endfunction
//   initial begin   
//     $display("6!=%0d",fact());                        
//   end  
// endmodule

//---------------array as return type

// module tb; 
//   typedef real c[];
//   function automatic c af();
//     c t;
//     t=new[10];
//     foreach(t[i])
//       begin
//         t[i]=(i+1)*2.8945;
//       end
//     return t;
//   endfunction
  
//   c b;  
//   initial begin
//     b=af();
//     foreach(b[i])
//       $display("b[%0f]=%0f",i,b[i]);
//   end  
// endmodule
//----queue as return 

// module tb;
//   typedef int q[$];
//   function q qf();
//      q t,t1;
//     t.push_back(10);
//     t.push_back(11);
//     t.push_back(13);
//     t.push_back(18);
//     t.push_back(19);     
//     t.pop_front();
    
//     t1.push_back(101);
//     t1.push_back(112);
//     t1.push_back(133);
//     t1.push_back(184);
//     t1.push_back(196);     
//     t1.pop_front();
//    // return t1;
//     return t;
    
//   endfunction 
//   q t1,t;
//   initial begin
//    t1=qf();
//     t=qf();
// foreach(t1[i])
// begin
//  $display("b[%0d]=%0d",i,t1[i]);
// end

//   foreach(t[i])
//     begin
//       $display("b[%0d]=%0d",i,t[i]);
//     end
//   $display("t %p",t);
//   end  
// endmodule

//----class fn array 

// class pac;
//   typedef int a[];
//   a a1;
//   function a cf(int c);
//     a1=new[c];
//     foreach(a1[i])
//       begin
//         a1[i]=i+1;
//       end
//     return a1;
//   endfunction
// endclass

// module tb;
//   pac p;
//   initial begin
//     p=new();
//     void'(p.cf(4));
//     foreach(p.a1[i])
//       begin
//         $display("a1[%0d]=%0d",i,p.a1[i]);
//       end
//     $display("%p",p.cf(7));
//   end
// endmodule

//----associative array
// module tb;
//   typedef int aa[int];
//   aa a1;
//   function aa af();
//     aa a;
// //     a[0]=1;
// //     a[1]=2;
// //     a[2]=3;
//     foreach(a[i])
//     begin
//       a[i]=i+2;
//     end
//     return a;
//   endfunction 
//   initial begin
//     a1=af();
//     foreach(a1[i])
//       begin
//         $display("a1[%0d]=%0d",i,a1[i]);
//       end
//   end
// endmodule

//-----------
