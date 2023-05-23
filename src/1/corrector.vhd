library ieee;
use ieee.std_logic_1164.all;


entity corrector is
    
 port(    x : in std_logic_vector(0 to 15);
          c : in std_logic_vector(0 to 6);
          s : inout std_logic_vector(0 to 6);
          y : out std_logic_vector(0 to 15)
     
     );
      
end corrector;

architecture beh of corrector is
    
    constant i0:std_logic_vector(0 to 6):="1000000";
    constant i1:std_logic_vector(0 to 6):="0100000";
    constant i2:std_logic_vector(0 to 6):="0010000";
    constant i3:std_logic_vector(0 to 6):="0001000";
    constant i4:std_logic_vector(0 to 6):="0000100";
    constant i5:std_logic_vector(0 to 6):="0000010";
    constant i6:std_logic_vector(0 to 6):="0000001";
   

  type par_chk_mat is array  (0 to 6) of std_logic_vector(0 to 22);
  signal h : par_chk_mat:=("10000001000100110011100",
                           "01000000101010101110010",
                           "00100001010001101001011",
                           "00010000100100011001000",
                           "00001001001100100001101",
                           "00000100110010001101010",
                           "00000010011001010110101");
  
  
  
      
begin

process(x,c,s)   
begin
 
  s(0)<=(((((((x(0) xor x(4)) xor x(7)) xor x(8)) xor x(11)) xor x(12)) xor x(13)) xor c(0));
  s(1)<=((((((((x(1) xor x(3)) xor x(5)) xor x(7)) xor x(9)) xor x(10)) xor x(11)) xor x(14)) xor c(1));
  s(2)<=((((((((x(0) xor x(2)) xor x(6)) xor x(7)) xor x(9)) xor x(12)) xor x(14)) xor x(15)) xor c(2));
  s(3)<=(((((x(1) xor x(4)) xor x(8)) xor x(9)) xor x(12)) xor c(3));
  s(4)<=(((((((x(0) xor x(3)) xor x(4)) xor x(7)) xor x(12)) xor x(13)) xor x(15)) xor c(4));
  s(5)<=(((((((x(1) xor x(2)) xor x(5)) xor x(9)) xor x(10)) xor x(12)) xor x(14)) xor c(5));
  s(6)<=((((((((x(2) xor x(3)) xor x(6)) xor x(8)) xor x(10)) xor x(11)) xor x(13)) xor x(15)) xor c(6));
 
  if s="1111110" then
      
     y(0)<=not x(0);
     y(1)<=not x(1);
     y(2 to 15)<=x(2 to 15);
     
  elsif  s="0011011" then
      
     y(0 to 11)<=x(0 to 11);
     y(12)<=not x(12);
     y(13)<=not x(13);
     y(14 to 15)<=x(14 to 15);  
  
  elsif  s="0110110" then
      
     y(0 to 1)<=x(0 to 1);
     y(2)<=not x(2);
     y(3)<=not x(3);
     y(4 to 15)<=x(4 to 15); 
     
     
      
  elsif  s="0010101" then
      
     y(0 to 14)<=x(0 to 14);
     y(15)<=not x(15);    
   
  --elsif  s="0111100" then
  else
      
     y<=x;       
   
  end if;
  
  
      
end process;
  
end beh;
  

             