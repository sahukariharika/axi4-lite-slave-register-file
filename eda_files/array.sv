// Code your testbench here
// or browse Examples
//
// dynamic array
module tb;
  int a[],b[];
  //int i;
  initial begin
    //repeat(5)begin
    a=new[5];
    for(int i=0;i<5;i++)begin
    a[i]=$urandom_range(2,10);
    $display("a[%0d]=%p",i,a[i]);
    end
    b=new[10](a);
    for(int i=0;i<10;i++)begin   
     // b[i]=$urandom_range(2,10);      
      $display("b=%p",b.size());
      b.delete();
      $display("b=%p",b);
  end
  end
  
endmodule


/*module arrayswap();
  int array[];
  int temp;
  int n;
  initial begin
    array=new[100];
    foreach(array[i])
      array[i]=i+1;

    n=array.size();
    $display("before swap elements are : %p",array);
    for(int j = 0; j<10; j++) begin
      int a = 0;
      for(int i=0;i<5;i++)
      begin
        temp=array[i+a];
       //$display("temp values are:%p",temp);
        array[i+a]=array[n-5+i-a];
        array[n-5+i-a]=temp;
      end
      a = a+5;
      end
    $display("after swap:%p",array);

  end
endmodule*/


module tb;
  int a[],i,temp,n;
  int b=0;
  initial begin
    a=new[50];
    foreach(a[i])
      a[i]=i+1;
    n=a.size();
    $display("a=%p",a);
    for(int j=0;j<5;j++)begin

      for (int i=0;i<5;i++)begin
        temp=a[i+b];
        a[i+b]=a[n-5+i-b];
        a[n-5+i-b]=temp;
      end
      b=b+5;
    end
     $display("after swap:%p",a);

  end

endmodule


//reverse of numbers
//
//module tb;
  bit[7:0]a[9:0];
  //int i;

  initial begin
    for (int i=0;i<10;i++)begin
    a[i]=i+1;

    end
  end
      initial begin
        $display("a is %p",a);
    end


  initial begin
    int temp=0;
    for (int j=0;j<5;j++)begin
      temp=a[j];
      a[j]=a[$size(a)-1-j];
    a[$size(a)-1-j]=temp;

  end
  end

  initial begin
   $display("a %p",a);
  end

endmodule




