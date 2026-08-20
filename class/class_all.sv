// ////accessing values,Instance variables ////
// // class all;
// //    int a;
// //   function new(int b);
// //     b=67;
// //     b=77;
// //     $display("in1 a=%0d",b);
// //   endfunction 
  
// //   function void dis();
// //     $display("in2 a=%0d",a);
// //   endfunction
// // endclass

// // module tb;
// //   all a1;
// //   initial begin
// //     a1=new(0);   
// //     a1.a=20;   
// //     a1.dis();
// //     $display("a=%0d",a1.a);//,a2.a);
// //     // $display("a1.a=%0d,a2.a=%0d",a1.a,a2.a);
// //   end
  
// // endmodule

// //---------------------Static variables  -------------------------------------

// // class all;
// //    static int a=0;
// //   function new();
// //     ++a;
// //   endfunction
// // endclass

// // module tb;
// //   all a1,a2;
// //   initial begin
// //     repeat(4)begin
// //     a1=new();
// //     $display("%0d",all::a);
// //     end
// //   end
// // endmodule

// //---------------------extern---------------------

// // class pack;
// //   int a;
//   //extern function void set_id(int val);
// //  extern function void display();
//    // extern function void send(logic [7:0]b);
//       //extern function new(bit[7:0]c);
// //     extern task drive(int d);
// //       endclass
      
// //     function void pack::set_id(int val);
// //         a=val;
// //    endfunction
      
// //       function void pack::display();
// //         $display("a=%0d",a);
// //       endfunction
      
// //       function void pack::send(logic [7:0]b);
// //         a=b;
// //       endfunction
        
// //         function pack::new(bit[7:0]c);
// //           a=c;
// //         endfunction
      
// //       task pack::drive(int d);
// //         $display("%0d",a);
// //       endtask
     
// //       module tb;
// //         initial begin
//           //pack p=new(99);// with constructor
//         // p.set_id(33);
//        //  p.send(66);
// //           pack p=new();
// //           p.drive(1);
// //           p.drive(0);
         
//          // p.display();
// //         end
// //       endmodule
  
// //---extern with task--------------

// //   class Driver;
// //   extern task drive(int sig);
// // endclass

// // task Driver::drive(int sig);
// //   $display("Driving signal = %0d", sig);
// // endtask

// // module tb;
// //   Driver drv;
// //   initial begin
// //      drv = new();
// //     drv.drive(1);
// //     drv.drive(0);
// //   end
// // endmodule

// //------------------------------std::randomize------
// // //randomize(object)-rand,randc inside class
// // //std::randomize- not in class,no need of rand,randc
// // class pack;
// //  rand int a;
// // endclass

// // module tb;
// //   pack p;
// //   int c;
// //   initial begin
// //     p=new();
// //     p.randomize();
// //     std::randomize(c);
// //     $display("a=%0d c=%0d",p.a,c);
// //   end
// // endmodule

// //--------------------assignment directly ---------------------------------
// // module tb;
// //   int da[];   // dynamic array
// //   int q[$];   // queue

// //   initial begin
// //     da = new[4];
// //     da = '{10, 20, 30, 40};

// //     // Cast dynamic array to queue
// //     q = da;
// //     $display("Queue size=%0d", q.size());
// //     foreach(q[i]) $display("q[%0d]=%0d", i, q[i]);
// //   end
// // endmodule

// //--------------------

// class A;
//   //int a;
//   byte b;
//   real a;
//   bit[3:0]c;
  
//   function new();
//     a=55;
//     $display("%0f",a);  endfunction 
// endclass

// module tb;
//   A a1,a2;
//   initial begin
//    a1=new();
//    a2=new();
    
//     a1.a=3.77;
//     a1.b=int'(a1.a);
//     a2.b=77;
//     $display("a1=%0d,a=%0d",a1.a,a2.b);
//   //  $display("a1=%0d,a2=%0d",a1.a,a2.b);  
//   end
// endmodule

//----------------allocating multiple address-------------------------

// class A;
//   rand int b;
// endclass

// module tb;
//   A a[];
//   A b1;
//   initial begin
//     a=new[10];
//     foreach(a[i])begin
//       a[i]=new();
//       b1=new();
//       b1.randomize();
//       a[i]=b1;   
//    end
//     $display("a=%p",a);
//   end
// endmodule

//----------------2d DA allocating multiple address-------------------------

// class A;
//   rand bit b;
// endclass

// module tb;
//   A a[][];
//   A b1;
  
//   initial begin 
//    a=new[6];
//     foreach(a[i])begin
//       a[i]=new[4];
//    // a[i].randomize();
//      end
    
//     foreach(a[i,j])begin
//       a[i][j]=new();
//       a[i][j].randomize();
//       b1=new();
//       b1.randomize();
//       a[i][j]=b1;
//     end
//     $display("a=%p",a);
//     $display("b1=%p",b1);
//   end
// endmodule

/////////////////////15/7/26/////////////////////////////////
//----------------------------object creation-------------

// class A;
//   rand int a;
// endclass

// class B;
//   A a;
//   function new();
//     a=new();
//     $display("a=%d",a);
//   endfunction
// endclass

// module tb;
//   B b[];
//   initial begin
//     b=new[3];
//     foreach(b[i])begin
//       b[i]=new();
//       //b.randomize();
//     end
//     $display("b=%p",b);
//   end
// endmodule


//--------------------------parameterized class---------------------
//---------------------type parametrization ---------------

// class A #(type T=int);
//  rand T b;
//   rand T c;
//   function void display();
// //     b=6;
// //     c=9;
//     $display("b=%0d,c=%0d",b,c);
//   endfunction
  
//   constraint d{ b inside {[2:10]};
//                c inside {[11:20]};
//               }
//   endclass


//   module tb;
//     A a[];
//     initial begin
//       a=new[3];
//       foreach(a[i])begin
//         a[i]=new();
//         a[i].randomize();
//         a[i].display();
//       end
//        $display("a=%0d",a);
//     end
//   endmodule

// class A #(type T=int);
//   T a;
  
//   function void display();
    
//     $display("a=%p",a);
//   endfunction 
// endclass

// module tb;
//   A #(int) a1;
//   A #(real) a2;
//   A #(string)a3;
//   A #(bit[4:0])a4;
  
//   initial begin 
//     a1=new();
//     a2=new();
//     a3=new();
//     a4=new();
    
//     a1.a=44;
//     a2.a=3.44;
//     a3.a="kabab";
//     a4.a=5'b1100;
    
//     a1.display();
//     a2.display();
//     a3.display();
//     a4.display();
//     $display("%p %p %p%p",a1,a2,a3,a4);
//   end
// endmodule


//----------------que------------

// class A #(type T=int);
//   T a[$];
  
//   function void push_b(T item);
//     a.push_back(item);
//   endfunction 
  
  
//   function void push_f(T item);
//     a.push_front(item);
//   endfunction 
  
//   function T pop();
//     return a.pop_front();
//   endfunction 
  
//   function T pop1();
//     return a.pop_back();
//   endfunction
// endclass
// module tb;
//   A #(int)a1;
//   A #(string)a2;
//   initial begin
//     a1=new();
//     a2=new();    
//     a1.push_b(44);
//     a1.push_b(75);
//     a1.push_b(14);
//     a1.push_b(23);
//     a1.push_b(90);
    
//     a1.push_f(12);
//     a1.push_f(15);
//     a1.push_f(14);
//     a1.push_f(53);
//     a1.push_f(24);
    
//     a2.push_b("haari");
//      a2.push_b("h");
//      a2.push_b("ari");
    
//     a2.push_f("haarika");
//     a2.push_f("aha");
//     a2.push_f("ahooari");
    
//     $display("pop front %0d",a1.pop());
//     $display("pop front %0s",a2.pop());
    
//     $display("pop back %0d",a1.pop1());
//     $display("pop back %0s",a2.pop1());
   
//   end
// endmodule

//--------------------------------value parameterization---------------------



// class A#(parameter int WI=7);
//   int a[WI-1:0];
//   byte b[WI-1:0];
//   logic [WI-1:0]c;
  
//   function void display();
//     $display("%p",a);
//   endfunction
// endclass

// module tb;
//   A a1;

//  A #(4) a2;
//   A #(2) a3;
//   initial begin 
//     a1=new();
   
//     a2=new();
//     a3=new();
//    foreach(a2.a[i]) a2.a[i]=88;
//     foreach(a1.b[i]) a1.b[i]=79;
//     foreach(a3.a[i])begin a3.a[i]=56;a3.a[i]=66;end
    
    
//     a1.c=234;
//     $display("a1 %p",a1);
//     $display("a2 %p",a2);
//     $display("a3  %p",a3);
    
    
//   end
// endmodule

//--------------------------------------type,value parameterization


// class A #(type T=int,parameter int W=6);
//   T mem[W];
//   function void display();
//     //$display("%p %p",mem[0],W);
//     $display("%p, W=%0d",$typename(mem[0]),W);
//   endfunction
// endclass

// module tb;
//   A #(byte,2) a1;
//   A #(string,4) a2;
//   initial begin 
//     a1=new();
//      a2=new();
    
    
//     a1.display();
//     a2.display();
//   end 
// endmodule

//////////////////////16/7/26///////////////////////////
// -----------------actual formats-----

// class A;
//   int a;
//   int b;
  
//   function new(int a1,byte b1);
//     a=a1+2;
//     b=b1;
//     endfunction 
// endclass

// module tb;
//   A a2;
//   initial begin
  
//     a2=new(10,5);
    
//     $display("%p",a2);
//   end 
// endmodule

//--------------------------------This-----------------

// class A;
//   int a;
//   byte b;
  
//   function new(int a,byte b);
//     this.a=a*7;
//     this.b=b;
//   endfunction
// endclass

// module tb;
//   A a1;
//   initial begin
//     a1=new(20,200);
//     $display("%p %p",a1.a,a1.b);
//   end  
// endmodule


//-----------------DA,Q,AS----------------

// class A;
//   int a2[];
//   int q[$];
//   string aa[int];
  
//   function new();
//     a2=new[3];
//   endfunction 
  
//   function void fill();
//     foreach(this.a2[i])
//       this.a2[i]=i+1;
    
    
//     this.q.push_back(10);
//     this.q.push_back(20);
//     this.q.push_back(30);
    
//     this.q.push_front(40);
//     this.q.push_front(50);
    
//     this.aa[1]="hai";
//     this.aa[2]="hari";
//     this.aa[3]="harika";
//     endfunction
    
//      function void disc();
//       foreach(this.a2[i]) $display("dyn %0d",a2[i]);
//       foreach(this.q[i]) $display("que %0d",q[i]);
//       foreach(this.aa[i]) $display("%0d -> %s",i,aa[i]);
//     endfunction   
// endclass

// class B extends A;
 
//   function new();
//     super.new();
//   endfunction
  
//   function void fill1();
//     super.fill();
//   endfunction
  
//   function void disc1();
//     super.disc();
//   endfunction
  
  
// endclass

// module tb;
//   A a1;
//   B a4;
//   initial begin
//     a1=new();
//     a4=new();
//     a1.fill();
//     a1.disc();
//     a4.fill1();
//     a4.disc();
    
//          $display("a1 %p",a1.a2);
//         $display("a1 %p",a1);
//     $display("a4 %p",a4);
//   end
// endmodule

/////////////////////////////17/7/26//////////////////////////////////
//----------------------virtual classess---------------------------------

// class A;
//   int a2[];
//   int q[$];
//   string aa[int];
  
//   function new();
//     a2=new[3];
//   endfunction 
  
//   function void fill();
//     foreach(a2[i])
//       a2[i]=i+1;
    
    
//    q.push_back(10);
//    q.push_back(20);
//   q.push_back(30);
    
//    q.push_front(40);
//    q.push_front(50);
    
//     aa[1]="hai";
//     aa[2]="hari";
//     aa[3]="harika";
//     endfunction
    
//      function void disc();
//       foreach(a2[i]) $display("dyn %0d",a2[i]);
//       foreach(q[i]) $display("que %0d",q[i]);
//       foreach(aa[i]) $display("%0d -> %s",i,aa[i]);
//     endfunction   
// endclass

// class B extends A;
 
//   function new();
//     super.new();
//   endfunction
  
//   function void fill1();
//     super.fill();
//   endfunction
  
//   function void disc1();
//     super.disc();
//   endfunction
  
  
// endclass

// module tb;
//   A a1;
//   B a4;
//   initial begin
//     a1=new();
//     a4=new();
//     a1.fill();
//     a1.disc();
//     a4.fill1();
//     a4.disc();
    
//     $display("a1 %p %p ",a1.a2,a1.aa);
    
//         $display("a1 %p",a1);
//     $display("a4 %p %p",a4.a2,a4.aa);
//     $display("a4 %p",a4);
//   end
// endmodule


//------------------------------------------------------------------------

class A;
  rand int data;
  rand byte b;
  
  virtual task one();
    $display(" A one %p",data);
  endtask
  
  task two();
    $display(" A two %0d",b);
  endtask
  
  task thr();
    one();two();
  endtask 
  
  constraint c{ data inside {[2:9]};b inside {[10:15]};}
endclass

class B extends A;
  rand A a1;
  rand int data;
 rand byte b;
  
  task one();this.data=data;
    $display("B one data %p",data);super.one(); endtask
  
  task two();this.b=b;$display("B two b %p",b); super.two(); endtask
  
  task thr(); this.data=data;$display("B thr data %p",data);
    
    super.thr(); endtask
  
   constraint c1{ data inside {[2:9]};b inside {[10:15]};}  

endclass

module tb;
  A a1;B b1;
  initial begin
    a1=new();
     a1.randomize();
    
    b1=new();
 b1.randomize();   
    a1.one(); a1.two();// a1.thr(); 
    b1.one();b1.two();b1.thr();
    
    //$display("A %p",a1);
    $display("B %p",b1.data);
    $display("B %p",b1);
  end  
endmodule

