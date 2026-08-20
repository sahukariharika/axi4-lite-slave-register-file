/*typedef union tagged {
  void Invalid;       // No value
  int Value;          // Integer value
  string Error;       // Error message
} Result;

module tb;
  Result r;
  initial begin
    r = tagged Invalid;
    if (r matches tagged Invalid)
      $display("No value present");

    r = tagged Value (47);
    if (r matches tagged Value .v)
      $display("Got value: %0d", v);

    r = tagged Error ("Bad input");
    if (r matches tagged Error .msg)
      $display("Error: %s", msg);
  end
endmodule*/


/*module tb;
  typedef union tagged{
  void in;
    int add;
    string bad;
  }res;
  res r;
  initial begin
    r=tagged in;
    if(r matches tagged in)
      $display("no value");
    
    r=tagged add(66);
    if(r matches tagged add.a)
      $display("value : %0d",a);
    
    r=tagged bad("ok raa");
    if(r matches tagged bad.b)
      $display("re : %s",b);
  end
  
endmodule*/

module tb;
  // Define a tagged union with three variants
  typedef union tagged {
    void Invalid;       // No value
    int Value;          // Integer value
    string Error;       // Error message
  } Result;

  Result r;

  initial begin
    // Case 1: Invalid
   /* r = tagged Invalid;
    if (r matches tagged Invalid)
      $display("T=%0t Tag=Invalid", $time);*/

    // Case 2: Value
    #10 r = tagged Value (42);
    if (r matches tagged Value .v)
      $display("T=%0t Tag=Value Data=%0d", $time, v);

    // Case 3: Error
    #10 r = tagged Error ("Bad input");
    if (r matches tagged Error .msg)
      $display("T=%0t Tag=Error Data=%s", $time, msg);	

    #10 $finish;
  end
endmodule

//union packed
module tb;
  typedef union packed {
    int a;
    //int b;
    logic [31:0]c;
  } u_t;

  u_t u;

  initial begin
   // u.a = 32'hDEAD_BEEF;
   // u.a=$urandom_range("99","77");
    u.c=6'b1100xx;
    //$display("a=%h c[1]=%h c[0]=%h", u.a, u.c[1], u.c[0]);
    // $displ(ay("a=%h b=%h", u.a, u.b);
    $display("a=%h c=%h",u.a,u.c);

    if (u.a == u.c)//{u.c[1], u.c[0]})
   // if (u.a == u.b)
      $display("Equal!");
    else
      $display("Not equal!");
  end
endmodule

//TYPEDEF
//VECTOR

/*module tb;
typedef int int1;

  int1 a=10;
  int1 b=20;

  initial begin
    $display("i=%0d , b=%0d",a,b);
  end

endmodule */

/*module tb;
  typedef struct{
    rand bit[3:0] a;
  	rand int b;
  }s_t;
     s_t s;
    initial begin

      repeat(3)begin
        if (!s.randomize())
          $display("not");
        else
          $display("val:%0d %0d",s.a,s.b);
      end
    end
endmodule*/

/*class ab;
  typedef union packed {
   rand bit [7:0]  x;   // 8-bit field
    rand int        y;   // 32-bit field (shares bits with x)
  } myUnion;
endclass

module packed_union_rand_example;
   myUnion u;   // Declare the union itself as rand

  initial begin
    repeat (3) begin
      if (!randomize(u))
        $display("Randomization failed!");
      else
        $display("x = %0d, y = %0d", u.x, u.y);
    end
  end
endmodule*/

/*class StructExample;
  typedef struct {
    rand bit [3:0] a;   // randomizable field
    rand int       b;   // randomizable field
  } myStruct;

  rand myStruct s;      // randomizable struct instance

  function void run();
    repeat (3) begin
      if (!randomize(s))
        $display("Randomization failed!");
      else
        $display("a = %0d, b = %0d", s.a, s.b);
    end
  endfunction
endclass

module test;
  initial begin
    StructExample obj = new();
    obj.run();
  end
endmodule
*/

/*class UnionExample;
  typedef union packed {
    bit [31:0]x;   // 8-bit field
    int       y;   // 32-bit field
  } myUnion;

  rand myUnion u;       // randomizable union object

  function void run();
    repeat (3) begin
      if (!randomize(u))
        $display("Randomization failed!");
      else
        $display("x = %0d, y = %0d", u.x, u.y);
    end
  endfunction

  constraint a_c{
    u.x inside {[1:9]};
  }
endclass

module test;
  initial begin
    UnionExample obj = new();
    obj.run();
  end
endmodule*/

class StructExample;
  typedef struct packed  {
   	 bit [3:0] a;   // randomizable field
     int       b;   // randomizable field
  } myStruct;

 rand myStruct s;      // randomizable struct instance

  function void run();
    repeat (3) begin
      if (!randomize(s))
        $display("Randomization failed!");
      else
        $display("a = %0d, b = %0d", s.a, s.b);
    end
  endfunction

 /* constraint a_c{
    s.b inside {[1:9]};
    s.a inside {[1:9]};
  }*/
endclass

module test;
  initial begin
    StructExample obj = new();
    obj.run();
  end
endmodule





