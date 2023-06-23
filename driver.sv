import packet::packet;
include "interface.sv";
class driver;
mailbox drv_mbx=new(10);
virtual haif haif;
static int drv_ctrl=0;
int num=0;
task run();
  $display("T=%0t [Driver] starting...",$time);
  forever begin
    packet item=new;
    #11 $display("T=%0t [Driver] Waiting item",$time);
    drv_mbx.get(num);
    if(num==101)begin
      $display("The mailbox values are sent");
    end
  else begin
    $display("mailbox values are not received");
  end
    drv_mbx.get(item.a);
    drv_mbx.get(item.b);
    drv_mbx.get(item.cout);
    drv_mbx.get(item.sum);
    item.print("Driver");
    haif.a=item.a;
    haif.b=item.b;
    $display("T=%0t[Driver] Item Updated to Interface",$time);
    drv_ctrl=drv_ctrl+1;
    num=0;
  end 
endtask
endclass
