package packet;
class packet;
rand bit a;
rand bit b;
bit      sum;
bit      cout;

function void print(string tag="");
  $display("[%s]  A value = %0b; B value =%0b",tag,a,b);
endfunction
 function void randomise();
  static int count=0;
  if(count==0)begin
    a=0;
    b=0;
    $display("case 1 passed count=%0d",count);
  end
  else if(count==1)begin
    a=0;
    b=1;
    $display("case 2 passed count=%0d",count);
  end
  else if(count==2)begin
    a=1;
    b=0;
    $display("case 3 passed count=%0d",count);
  end
  else if(count==3)begin
    a=1;
    b=1;
    $display("case 4 passed count=%0d",count);
  end
  else
    count=0;
  $display("%0d",count);
  count=count+1;
  
endfunction
function void scoreboard_ref_val();
  if((a==1)&&(b==1))begin
    sum=0;
    cout=1;
  end
else if(((a==1)&&(b==0))||((a==0)&&(b==1)))begin
  sum=1;
  cout=0;
end
else begin
  sum=0;
  cout=0;
end
endfunction
endclass
endpackage