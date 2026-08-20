
/*module tb;
  int a[][],i,j;

  initial begin
    a=new[4];
    $display(" init %p",a);

    a[0]=new[5];
    foreach(a[i][j])begin
      a[i][j]=i+3;
    end
    $display(" 1st %p",a);


    a[1]=new[2];
    foreach(a[i][j])begin
      a[i][j]=i+2;
    end
    $display(" 2nd %p",a);

    a[2]=new[2];
    foreach(a[i][j])begin
      a[i][j]=i+2*3;
    end
    $display(" 3r %p",a);

    a[3]=new[3];
    foreach(a[i][j])begin
      a[i][j]=i+9;
    end
    $display(" 4th %p",a);

    foreach(a[i,j])begin
      a[i][j]=i;
      $display(" all a[%0d][%0d]=%p",i,j,a[i][j]);
    end
    $display("%p",a);

  //adding index
    a[2]='{19,20,34,45,67};
    a[2]=new[a[2].size()+1](a[2]);
    a[2][a[2].size()-1]=22;
    $display(" last %p",a);
  end
endmodule*/


//------------------------------------------------------------
 /* int a[][$];
 // logic res;//dynamic queue
  //int res;
  //bit res;
  //reg res;
  byte res;//999 as -25 byte range -127 to 127-negative values
  initial begin
    a=new[5];
    $display("%p",a);

    a[1].push_back(999);
    a[1].push_back(133);
    a[1].push_back(102);
    a[1].push_back(166);
    a[1].push_front(22);

    res=a[1].pop_front();
    res=a[1].pop_back();

    $display("%p",a);
    $display("res %0d",res);
  end
endmodule*/


//------------------------------------------------------------

  /*int a[$][];
  initial begin
    a.push_back('{});
    a[0]=new[3];
    a[0][0]=456;
    a[0][1]=423;
    a[0][2]=423;
    a.pop_front();//index pop not possible
    a[0][3]=23;
    a.push_back('{});
    a[1]=new[3];
    a[1][0]=322;
    $display("%p",a);
  end*/
 //------------------------------------------------------------

 /* int a[$][$];
  initial begin
    a.push_back('{});
    a[0][0]=89;
    a[0][1]=19;
    a[0][2]=88;
    a[0].pop_front();//index pop possible
    a[0].pop_back();
    $display("%p",a);
  end */

 //------------------------------------------------------------

 /* int a[][string];
  string k;
  initial begin
    a=new[8];

    a[0]["one"]=10;
    a[0]["bb"]=30;
    a[0]["ab"]=40;
    a[0]["bc"]=90;
    a[3]["shr"]=10;
    a[5]["shr"]=10;
    a[1]["h"]=10;
    a[4]["sh"]=10;
    a[2]["r"]=10;
    a[6]["hr"]=10;

   // $display("\n %p",a[0].num());//num
     $display("%p",a);
    a[0].delete("bb"); //delete
     $display("%p",a);
   // if(a[0].exists("s"))//exist
     // $display("Key 'bb' exists in a[0]");


    if(a[6].first(k)) //first
      $display("first a[0]=%s",k);
    if(a[0].last(k))  //last
      $display("last a[0]=%s",k);
    $display("%p",a[0].prev(k)); //prev
    $display("%p",a[0].next(k)); //last

    $display("%p",a[0].next(k)); //next
  end */
 //------------------------------------------------------------
 /* int a[$][string];
  initial begin

    a.push_back('{});
    a[0]["a"]=12;a[0]["a"]=13;a[0]["b"]=14;a[0]["bb"]=14;a[0]["aaa"]=12;
    a[1]["a"]=12;a[1]["a"]=13;a[1]["b"]=14;a[1]["bb"]=14;a[2]["aaa"]=12;
   // a.pop_front();

    $display("%p",a);
    a.shuffle();
    $display("shu %p",a);
    $display("%p",a[0].size());
  end  */
//------------------------------------------------------------
  /*int a[string][string];
  initial begin
    a["row"]["b"]=10;a["row"]["b"]=20;a["row"]["bb"]=10;a["row1"]["b"]=10;
    $display("%p",a);
  end*/
//------------------------------------------------------------
 /* int a[string];
  initial begin
    a["abc"]=100;
    a["abcd"]=90;
   a["abcd"]=40;
    a["oo"]=40;
    //if(a.exists("abb"))
    if(a["abb"])
      $display("exist on %d",a);
//     else
//       $display(" noexist %d",a);
  end
endmodule*/


 //module top;
//   int a[int];
//   initial begin
//     a[10]=200;
//     a[20]=300;
//     a[30]=400;
//     $display("%p",a);

//     if(a[15]==500)
//         $display("True");
//     end
// endmodule

//---------------------------dynamic

//   module tb;
//     int a[][][],i,j,k;
//     initial begin
//       a = new[3];

//       a[0] = new[3];
//       a[1] = new[3];
//       a[2] = new[3];

//       a[0][0] = new[3];
//       a[1][1] = new[3];
//       a[2][1] = new[3];

//       foreach(a[i,j,k])begin
//         a[i][j][k]=i+j+k;
//         $display("a[%0d][%0d][%0d]=%0d",i,j,k,a[i][j][k]);
//       end
//        $display("%p",a);
//     end
//   endmodule

//--------------- 2d dynamic - queue-

// module tb;
//   int a[][][$];
//   initial begin
//     a = new[3];

//     a[0] = new[2];
//     a[1] = new[3];
//     a[2] = new[2];


//     a[0][0].push_back(20);
//     a[1][1].push_back(10);
//     a[1][0].push_back(20);
//     a[1][2].push_back(30);
//     a[2][1].push_back(10);
//     $display("%p",a);
//     a[1][1].pop_front();

//     $display("%p",a);
//   end
// endmodule

//---------------que 2d dynamic

// module tb;
//   int a[$][][];
//   initial begin
//     a.push_back('{});
//     a[0] = new[3];
//     a[1] = new[2];
//     a[2] = new[3];
//     a[0][0] = new[2];
//     a[1][1] = new[2];

//     a[0][0][0]=7;
//     a[0][0][1]=7;
//     a[1][1][0]=7;
//     $display("%p",a);
//   end
// endmodule

//--------------

module test;
  int a[$][$][];
  initial
    begin
      a.push_back('{ });

      a[0][0]=new[2];
      a[0][1]=new[1];

      a[1][0]=new[2];

      a[0][0][0]=4;
      a[0][0][1]=6;
      a[0][1][0]=8;

      a[0][0]=new[10](a[0][0]);
      a[1][0]=new[10](a[0][0]);

      a[1][0][0]=9;
      a[1][0][1]=10;
      $display("%p",a);


    end
endmodule


// Code your testbench here
// or browse Examples
////////3-D DYNAMIC ARRAY//////////

// module test;
//   int a[][][];
//   int i,j,k;
//    initial
//     begin
//       a=new[2];

//       a[0]=new[2];
//       a[1]=new[3];

//       a[0][0]=new[2];
//       a[0][1]=new[3];

//       a[1][0]=new[2];
//       a[1][1]=new[1];
//       a[1][2]=new[3];

//       foreach(a[i,j,k])
//         begin
//         a[i][j][k]=i+j+k;
//         $display("a[%0d][%0d][%0d]=%0d",i,j,k,a[i][j][k]);
//        end

//       foreach(a[i,j,k])
//         begin
//           a[i][j][k]=i*2+j+k;
//         end
//       $display("%p",a);

//     end
// endmodule

//////////////  2-D DYNAMIC AND QUEUE ///////////
/*
module test;
  int a[][][$];
  initial
    begin
      a=new[2];

      a[0]=new[1];
      a[1]=new[1];

      a[0][0].push_back(10);
      a[1][0].push_back(19);

      $display("%p",a);

    end
endmodule
*/
///////////////// QUEUE AND 2-D DYNAMIC ///////////////
/*
module test;
  int q[$][][];
  initial
    begin
      q.push_back('{ } );
      q[0]=new[2];
      q[1]=new[2];

      q[0][0]=new[2];
      q[0][1]=new[1];

      q[1][0]=new[2];

      q[0][0][0]=3;
      q[0][0][1]=5;
      q[0][1][0]=6;

      q[1][0][0]=4;

      $display("%p",q);
    end
endmodule
*/
///////////// 2-D QUEUE AND DYNAMIC /////////////

module test;
  int a[$][$][];
  initial
    begin
      a.push_back('{ });

      a[0][0]=new[2];
      a[0][1]=new[1];

      a[1][0]=new[2];

      a[0][0][0]=4;
      a[0][0][1]=6;
      a[0][1][0]=8;

      a[0][0]=new[10](a[0][0]);

      a[1][0][0]=9;
      a[1][0][1]=10;
      $display("%p",a);

    end
endmodule

/////////////// 2-D QUEUE AND ASSOCIATIVE /////////////
/*
module test;
  int a[$][$][int];
  initial
    begin

      a.push_back('{ });

      a[0][0][0]=1;

      a[1][0][0]=4;
      a[1][0][1]=7;

      a[1][1][0]=6;
      $display("%p",a);

    end
endmodule
*/
///////////  2-D DYNAMIC AND ASSOCIATIVE ///////////
/*
module test;
  bit [5:0] a[][][bit];
  initial
    begin
      a=new[2];

      a[0]=new[2];
      a[1]=new[3];

      a[0][0][1]=6'd12;
      a[1][0][0]=6'd15;

      $display("%p",a);

    end
endmodule
*/
//////////// ASSOCIATIVE AND 2-D DYNAMIC////////////
/*
module test;
  int a[int][][];
  initial
    begin

      a[0]=new[3];
      a[1]=new[2];

      a[0][0]=new[2];
      a[1][1]=new[1];

      $display("%p",a);

      a[0][0]='{1,2,3,4,5};
      a[1][0]='{0,1};

      a[0][0]='{1,2};

      $display("%p",a);

    end
endmodule
*/
///////////// 2-D ASSOCIATIVE AND DYNAMIC ////////////
/*
module test;
  bit[3:0] a[bit][bit][];
  initial
    begin
      a[0][0]=new[2];
      a[1][0]=new[3];

      a[0][0][1]=3;

      a[0][0]=new[10](a[0][0]);

      $display("%p",a);
    end
endmodule
*/
//////////// DYNAMIC AND QUEUE AND AA ////////////
/*
module test;
  int a[][$][int];
  initial
    begin

      a=new[3];
      a[0].push_back('{ });

      a[0][0][0]=12;

      a[1].push_front('{ });
      a[1][0][1]=56;
      a[1][0][0]=34;

     //a[1].pop_front();


      $display("%p",a);
      $display("no of elements=%0d",a[1][0].num());
    end
endmodule
*/
//////////// DYNAMIC AND ASSOCIATIVE AND DYNAMIC ///////////
/*
module test;
  int a[][int][];
  initial
    begin
      a=new[3];

      a[0][0]=new[2];
      a[1][1]=new[3];
      a[1][2]=new[2];
      a[2][0]=new[2];

      a[0][0][0]=2;
      a[0][0][1]=3;

      a[1][1]=new[6](a[1][1]);

      a[1][1][0]=5;
      a[1][1][2]=9;

      $display("%p",a);
    end
endmodule
*/
///////////// DYNAMIC AND QUEUE AND DYNAMIC /////////////

// module test;
//   int b[][$][];
//   initial
//     begin
//       b=new[2];

//       b[0].push_back('{ });

//       b[0][0]=new[2];
//       b[0][0][0]=34;
//       b[0][0][1]=23;

//       b[0][0]=new[4](b[0][0]);


//       b[0][1]=new[1];
//       b[1][0]=new[3];

//       $display("%p",b);
//     end
// endmodule





