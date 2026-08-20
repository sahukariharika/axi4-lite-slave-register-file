

// Code your testbench here
// or browse Examples
/*
class A;
  bit [3:0]a;
  int b;
endclass

module test;
  A a1,a2;
  initial begin
    a1=new();
    a1.a=15;
    a1.b=56;
    a2=new();

   a2=a1;
    a2.a=12;
    a2.b=34;

    $display(a1);
    $display("%s",$typename(a1));
    $display(a2);
  end
endmodule
*/
///////////////// dynamic class handles of type class ////////////
/*
class A;
  int a;
  bit [3:0]b;

//   function new(int c,bit[3:0] d);
//     a=c;
//     b=d;
//   endfunction

endclass

module test;
  A a1[];
  initial
    begin
      a1=new[3];

      //a1[0]=new(10,6);

      foreach(a1[i])
        a1[i]=new;

      a1[0].a=1;
      a1[1].a=23;
      a1[2].a=34;

      a1[0].b=2;
      a1[1].b=5;
      a1[2].b=7;

      foreach(a1[i])begin
        a1[i].a=i*1+10;
      a1[i].b=i+3;
      end

      $display("%p",a1);
      $display("%0d,%0d,%0d",a1[0].a,a1[1].a,a1[2].a);
      $display("%0d,%0d,%0d",a1[0].b,a1[1].b,a1[2].b);
      $display("%p",a1[0]);

    end
endmodule
*/
////////////// class instantiation in another class with rand variables ///////////
/*
class A;
  int a;
  bit [3:0]b;
endclass

class B;
  rand int a;
  rand bit [4:0]b;
     A c;
endclass

module test;
  B b1;
  initial
    begin
      b1=new();
      b1.c=new();

      b1.a=10;
      b1.b=19;

      b1.c.a=12;
      b1.c.b=9;

      $display("%0d",b1.a);
      $display("%0d",b1.b);

      $display("%0d",b1.c.a);
      $display("%0d",b1.c.b);
    end
endmodule
*/

//////////// with randomization ////////////
/*
class A;
   rand int a;
  rand bit [3:0]b;
endclass

class B;
  rand int a;
  rand bit [4:0]b;
  rand A c;
endclass

module test;
  B b1, b2;
  initial
    begin
      b1=new();
    // b2=new();
      b1.c=new();
    // b2.c=new();
      if(b1.randomize())
        $display("a=%0d,b=%0d",b1.c.a,b1.c.b);
        $display("a=%0d,b=%0d",b1.a,b1.b);
//       b2.a=45;
//       b2.b=5;
//       $display("%p",b2);
//       b2=b1;
//       $display("%p",b2);
    end
endmodule
*/

////////////// constructors //////////////
/*
class c;
  int c1=1;
  int c2=2;
  int c3=5;

  function new(int a);
    c2=8;
    c3=a;
    $display("BASE CLASS NEW c2=%0d,c3=%0d:",c2,c3);
  endfunction

endclass

class b extends c;
  int d1=4;
  int d2=40;

  function new();
   // $display("d1=%d, before super,",d1);
    super.new(d2);
    $display("d1=%d,c3=%0d after super,",d1,c3);
//     this.d1=x;
//     this.d2=y;


  endfunction

endclass

module test;
  b B;
  c C;
  initial
    begin
   //   C=new(12);
      B=new();
      $display("%p",B);

     // B.c3=50;

    end
endmodule
*/

/*
class A;
  int a=7;
  int b;

  function new(int x);
    a=x;
    b=9;
  endfunction
endclass

class B extends A;
  int c=a;

  function new();
    super.new(34);
  endfunction

endclass

module test;
  B b1;
  initial
    begin
      b1=new();
      $display("assigned values are : %p",b1);
    end
  endmodule
*/

///////////// queue handle of type class/////////////
/*
class A;
  int a;
  bit [3:0]b;
endclass

module test;
  A a1[$];
  A a2;
  initial
    begin

      for(int i=0;i<3;i++)
        begin
          a2=new();
          a2.a=i;
          a2.b=i+3;
          a1.push_back(a2);
          $display("%p",a2);
        end

      $display("%p",a1);

      foreach(a1[i])
       begin
         $display("a1[%0d].a=%0d,a1[%0d].b=%0d",i,a1[i].a,i,a1[i].b);
       end

    end
endmodule
*/

////////////// associative array handle of class type ////////

class A;
  int a;
  bit [5:0]b;
  byte c;
endclass

module test;
  A a1[int];
  initial
    begin

      a1[1]=new();
      a1[1].a=56;
      a1[1].b=15;
      a1[1].c=5;
      $display("%p",a1[1]);

      a1[2]=new();

      foreach(a1[i])
        begin
          a1[i].a=i*4+1;
          $display("%p,%p",a1[1].a,a1[2].a);
        end

    end
endmodule




















