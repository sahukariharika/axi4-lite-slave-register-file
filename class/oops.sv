//INHERITANCE


//without allocating memory for parent also getting value - child extends from parent 
class inher;
  rand int a;
  
  function void print();
    $display("a=%0d",a);
  endfunction
  constraint a_c {
    a inside {[10:20]};
  }
endclass

// class child extends inher;
//   rand int b;  
//   function void print();
//     super.print();
//     $display("b=%0d",b);
//   endfunction
//   constraint b_c {
//     b inside {[100:200]}; 
//   }
// endclass

// module tb;
//   child ch;
//   inher p;
//   initial begin 
//     ch=new();
//     p=new();
//     p.randomize();
//       ch.randomize();
//     p.print();
//     ch.print();
//   end
// endmodule


//encapsulation 

class encap;
  local int a;
  protected int b;
  int c;
  function void print();
    $display("a=%0d",a);
    $display("b=%0d",b);
    $display("c=%0d",c);
  endfunction 
endclass

// module encap;
//   encap e;
//   initial begin
//     e=new();
// //     e.a=100; //local,protected not able to assign in module
// //      e.b=200;
//     e.c=300;
//     e.print();
//   end
  
// endmodule
//protected
class encaps;
  local int a;
  protected int b;
  int c;
  function void print();
    $display("a=%0d",a);
    $display("b=%0d",b);
    $display("c=%0d",c);
  endfunction 
endclass

class enc extends encaps;
  function new();
  //  a=100; //local not able to assign into another class
    b=200; 
    c=300;
  endfunction
endclass

// module tb;
//   encaps en;
//   enc e;
//   initial begin
//     e=new();
//     e.print();
//     en=new();
//     en.print();
//   end 
// endmodule

//local
class sam;
  local int a;
  protected int b;
  int c;
  function new();
    a=450; //accessible in only parent class
  endfunction
  function void print();
    $display("a=%0d",a);
    $display("b=%0d",b);
    $display("c=%0d",c);
  endfunction 
endclass

// class sam1 extends sam;
//   function new(); //atomatically cale new method
//   //  a=100; //local not able to assign into another class
//     b=200; 
//     c=300;
//   endfunction
// endclass

// module tb;
//    sam s;
//   sam1 s1;
//   initial begin
//     s1=new();
//     s1.print();
//   end 
// endmodule


//overidding of encapsulation values


// class sam;
//   local int a;
//   protected int b;
//   int c;
//   function new();
//     a=450; //accessible in only parent class
//   endfunction
  
//   function set(input int p,q);
//     a=p;
//     b=q;
//   endfunction
//   function void print();
//     $display("a=%0d",a);
//     $display("b=%0d",b);
//     $display("c=%0d",c);
//   endfunction 
// endclass



// module tb;
//    sam s;
  
//   initial begin
//     s=new();
//     s.set(20,30);
//     s.c=150;
//     s.print();
//   end 
// endmodule

class poly;
  rand int a;
  
 virtual function void print(); //virtual - not a main part
    $display("a=%0d",a);
  endfunction
  constraint a_c {
    a inside {[10:20]}; 
  }
endclass

class child extends poly;
  rand int b;  
  function void print();
    super.print();
    $display("b=%0d",b);
  endfunction
  constraint b_c {
    b inside {[100:200]}; 
  }
endclass

// module tb;
//   child c;
//   poly p;
//   initial begin 
//     c=new();
    
//     c.randomize();
//     // p=c; 
//     $cast(p,c);
//     p.print();
    
//   end
// endmodule


virtual class vir;//in abstraction cannot allo memory
  
endclass
module test;
  vir v;
 initial begin
   v=new();
  end
  
endmodule

//17/7/26

//----------------access parent class, without virtual-------------
// class A; //without virtual 
 
//   int a;
  
//   virtual task dis();$display("A %p",a); endtask //using virtual
  
// endclass

// class B extends A;
//   int a;
//   task dis(); $display("B %p ",a); endtask
// endclass

// module tb;
//   A a1;
//   B b1;
//   initial begin
   
//     b1=new();
//     a1=b1;
//     b1.dis();
//     a1.dis();
//   end
// endmodule
//-----------------multiple child-----
// class p;
//   int a=1;
//   virtual task dis();
//     $display("p %0d",a);
//   endtask
// endclass


// class c1 extends p;
//   int a; 
//     task dis();
//     this.a=10;
//     $display("c1 %p",a); 
//    //super.dis(); 
//  endtask
// endclass

// class c2 extends c1;
//   int a;
//   virtual task dis(); 
//     this.a=20; 
//     $display("c2 %p",a); 
//    // super.dis();
//   endtask
// endclass
// class c3 extends c2;
//   int a;
//   task dis(); 
//     this.a=30; 
//     $display("c3 %p",a); 
//     //super.dis();
    
//   endtask
// endclass

// module tb;
//   p p1;
//   c1 d1;c2 d2;c3 d3;
//   initial begin
//    // p1=new(); 
//     d1=new();p1=d1; p1.dis(); 
// //     if($cast(p1,d1)) p1.dis();
// //     else
// //       $display("no");
    
//     d2=new(); d1=d2; d1.dis();
    
//    // d3=new(); d2=d3; d2.dis();
//     d3=new(); p1=d3; p1.dis();
//    // d3=new(); d2=d3; p1.dis();
//   end
// endmodule

//------------------------------------------

// class Parent;

// virtual function void show();
//    $display("Parent");
// endfunction

// endclass


// class Child extends Parent;

// function void show();
  
//    $display("Child");
//   //super.show();
// endfunction

// endclass



// module tb;

// Parent p;

// initial begin

//    Child c=new();

//    p=c;

//    p.show();

// end

// endmodule

//-----------------------------------------$cast------------
// class p;
//   int a=1;
//   virtual task dis();
//     $display("p %0d",a);
//   endtask
// endclass


// class c1 extends p;
//   int a=10; 
//     task dis();
//     $display("c1 %p",a);  
//  endtask
// endclass

// class c2 extends c1;
//   int b=20;
//   virtual task dis();     
//     $display("c2 %p",b);   
//   endtask
// endclass

// module tb;
//   p p1;
//   c2 c;
//   initial begin
//     p1=new();
//     c=new();
//     if($cast(p1,c))
//     //if($cast(c,p1))
//       c.dis();
//       $display("%p %p",c.a,c.b);
//       //else
//        // $display("no");
    
//   end  
// endmodule 

