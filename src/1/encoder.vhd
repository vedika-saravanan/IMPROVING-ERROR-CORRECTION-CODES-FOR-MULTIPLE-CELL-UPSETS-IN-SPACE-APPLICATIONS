library ieee;
use ieee.std_logic_1164.all;

entity encoder is
    
 port(    x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15 : in std_logic; 
                      c0,c1,c2,c3,c4,c5,c6                      : out std_logic);
      
end encoder;

architecture beh of encoder is
begin

process(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)
begin
 
  c0<=((((((x0 xor x4) xor x7) xor x8) xor x11) xor x12) xor x13);
  c1<=(((((((x1 xor x3) xor x5) xor x7) xor x9) xor x10) xor x11) xor x14);
  c2<=(((((((x0 xor x2) xor x6) xor x7) xor x9) xor x12) xor x14) xor x15);
  c3<=((((x1 xor x4) xor x8) xor x9) xor x12);
  c4<=((((((x0 xor x3) xor x4) xor x7) xor x12) xor x13) xor x15);
  c5<=((((((x1 xor x2) xor x5) xor x9) xor x10) xor x12) xor x14);
  c6<=(((((((x2 xor x3) xor x6) xor x8) xor x10) xor x11) xor x13) xor x15);
    
    
end process;
  
end beh;
  

             