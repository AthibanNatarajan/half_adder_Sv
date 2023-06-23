include "env.sv";
include "packet.sv";
import packet::*;
class test;
 env e0;
 mailbox drv_mbx;
 int num=101;
 function new();
 drv_mbx = new();
 e0 = new();
 endfunction
 virtual task run();
 $display("T=%0t Test Task fn is started",$time);
 e0.d0.drv_mbx = drv_mbx;
 fork
 e0.run();
 apply_stim();
 join_any
 endtask
 virtual task apply_stim();
 while(e0.d0.drv_ctrl<=4)begin
 packet item;
 $display ("T=%0t [Test] Starting stimulus ...",$time);
 #10 item = new();
 item.randomise();
 drv_mbx.put(num);
 drv_mbx.put(item.a);
 drv_mbx.put(item.b);
 $display ("T=%0t item successfully sent",$time);
 #10 item = new();
 item.randomise();
 drv_mbx.put(num);
 drv_mbx.put(item.a);
 drv_mbx.put(item.b);
 $display ("T=%0t item successfully sent",$time);
 #10 item = new();
 item.randomise();
 drv_mbx.put(num);
 drv_mbx.put(item.a);
 drv_mbx.put(item.b);
 $display ("T=%0t item successfully sent",$time);
#10 item = new();
 item.randomise();
 drv_mbx.put(num); 
 drv_mbx.put(item.a);
 drv_mbx.put(item.b);
 $display ("T=%0t item successfully sent",$time);
 end
 endtask
endclass
