include "interface.sv";
import packet::packet;
include "monitor.sv";
include "scoreboard.sv";
include "driver.sv";
class env;
 driver d0; 
 monitor m0; 
 scoreboard s0; 
 mailbox scb_mbx; 
 virtual haif haif;
 function new();
 d0 = new;
 m0 = new;
 s0 = new;
 scb_mbx = new();
 endfunction
 virtual task run();
 $display("T = %0t Environment run fn started",$time);
 d0.haif = haif;
 m0.haif = haif;
 m0.scb_mbx = scb_mbx;
 s0.scb_mbx = scb_mbx;
 $display("T = %0t Interface values are initiated",$time);
 fork
 d0.run();
 m0.run();
 s0.run();
 join_any
 endtask
endclass
