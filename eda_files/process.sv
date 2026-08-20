
//10/08/26
//process examples

class pack;
  task dis();
    #1;
    $display("%0t: i inside pack1.0",$time);
    #10;
    $display("%0t: i inside pack1.1",$time);
  endtask
endclass

class pack1;
  task dis;
    #3 $display("%0t: i inside pack2.0",$time);
    #1;
    $display("%0t: i inside pack2.1",$time);
  endtask
endclass

class pack2;
  task dis;
    #5; $display("%0t: i inside pack3.0",$time);
    #1;
    $display("%0t: i inside pack3.1",$time);
  endtask

  task displaycom();
    #1;
    $display("%0t,hihi",$time);
  endtask
endclass

class main;
  process p1,p2,p3,p4;
  pack k;
  pack1 k1;
  pack2 k2;


  function new();
    k=new();
    k1=new();
    k2=new();
  endfunction

  task run();
    fork
      begin
        p1=process::self();
        k.dis();
      end
      begin
         p2=process::self();
        k1.dis();
      end
      begin
        p3=process::self;
        k2.dis();
      end
      begin
        p4=process::self;
        k2.displaycom();
      end
    join_any
    p1.suspend();
    $display("%0t, dis 1 %s",$time,p1.status());
    p2.suspend();
    $display("%0t, dis 2 %s",$time,p2.status());
    p2.resume();
    $display("%0t, dis 2 %s",$time,p2.status());
    p1.resume();
     $display("%0t, dis 1 %s",$time,p1.status());
//     p1.kill();
//     $display("%0t, dis 1 %s",$time,p1.status());
      p1.await();
    $display("%0t, dis 1 %s",$time,p1.status());

  endtask

endclass

module tb;
  main m;
  initial begin
    m=new();
    m.run();
    #100;
    $finish;
  end
endmodule
