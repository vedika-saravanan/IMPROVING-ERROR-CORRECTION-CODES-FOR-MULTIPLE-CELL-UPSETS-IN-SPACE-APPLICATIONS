library ieee;
use ieee.std_logic_1164.all;

entity encoder1 is    
 port(     x : in std_logic_vector(0 to 15);
           c : out std_logic_vector(0 to 6));      
end encoder1;

architecture beh of encoder1 is
begin

process(x)
begin
 
  c(0)<=((((((x(0) xor x(4)) xor x(7)) xor x(8)) xor x(11)) xor x(12)) xor x(13));
  c(1)<=(((((((x(1) xor x(3)) xor x(5)) xor x(7)) xor x(9)) xor x(10)) xor x(11)) xor x(14));
  c(2)<=(((((((x(0) xor x(2)) xor x(6)) xor x(7)) xor x(9)) xor x(12)) xor x(14)) xor x(15));
  c(3)<=((((x(1) xor x(4)) xor x(8)) xor x(9)) xor x(12));
  c(4)<=((((((x(0) xor x(3)) xor x(4)) xor x(7)) xor x(12)) xor x(13)) xor x(15));
  c(5)<=((((((x(1) xor x(2)) xor x(5)) xor x(9)) xor x(10)) xor x(12)) xor x(14));
  c(6)<=(((((((x(2) xor x(3)) xor x(6)) xor x(8)) xor x(10)) xor x(11)) xor x(13)) xor x(15));
    
    
end process;
  
end beh;
  

             