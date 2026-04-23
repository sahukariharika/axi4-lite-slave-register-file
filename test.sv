
class abc;
  rand bit [8:0] data;

// constraint c1 {
//   data inside {[32'h0000_0003 : 32'hFFFF_FFFC]};
// }
  constraint c2 {
  $countones(data ^ (data << 1)) == 2;
}
endclass

module tb;
  abc c;
  initial begin
    repeat(6)begin
    c=new();
    c.randomize();
    //  $display("c=%0b",c);
      $display("data=%b",c.data);
  end
   
  end
                 
endmodule

// class test;
//   rand bit [7:0] data;

//   constraint c {
//     $countones(data ^ (data << 1)) == 2;
//   }
// endclass

// module tb;
//   initial begin
//     test t = new();
//     repeat (10) begin
//       t.randomize();
//       $display("data = %b", t.data);
//     end
//   end
// endmodule