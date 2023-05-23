library ieee;
use ieee.std_logic_1164.all;


entity corrector is
    
 port(    x : in std_logic_vector(0 to 15);
          c : in std_logic_vector(0 to 7);
          s : inout std_logic_vector(0 to 7);
          y : out std_logic_vector(0 to 15)
     
     );
      
end corrector;

architecture beh of corrector is
    
    constant i0:std_logic_vector(0 to 7):="10000000";
    constant i1:std_logic_vector(0 to 7):="01000000";
    constant i2:std_logic_vector(0 to 7):="00100000";
    constant i3:std_logic_vector(0 to 7):="00010000";
    constant i4:std_logic_vector(0 to 7):="00001000";
    constant i5:std_logic_vector(0 to 7):="00000100";
    constant i6:std_logic_vector(0 to 7):="00000010";
    constant i7:std_logic_vector(0 to 7):="00000001";
   

  type par_chk_mat is array  (0 to 7) of std_logic_vector(0 to 23);
  signal h : par_chk_mat:=("100000001001100110010001",
                           "010000000100110011001100",
                           "001000000010010001101000",
                           "000100000000001000100011",
                           "000010001000100011000111",
                           "000001000100010001011110",
                           "000000100010000101110010",
                           "000000010001001010001010");
  
  
  
      
begin

process(x,c,s)   
begin
 
  s(0)<=(((((((x(0) xor x(3)) xor x(4)) xor x(7)) xor x(8)) xor x(11)) xor x(15)) xor c(0));
  s(1)<=(((((((x(1) xor x(4)) xor x(5)) xor x(8)) xor x(9)) xor x(12)) xor x(13)) xor c(1));
  s(2)<=(((((x(2) xor x(3)) xor x(9)) xor x(10)) xor x(12)) xor c(2));
  s(3)<=((((x(6) xor x(10)) xor x(14)) xor x(15)) xor c(3));
  s(4)<=(((((((x(0) xor x(4)) xor x(8)) xor x(9)) xor x(13)) xor x(14)) xor x(15)) xor c(4));
  s(5)<=(((((((x(1) xor x(5)) xor x(9)) xor x(11)) xor x(12)) xor x(13)) xor x(14)) xor c(5));
  s(6)<=((((((x(2) xor x(7)) xor x(9)) xor x(10)) xor x(11)) xor x(14)) xor c(6));
  s(7)<=(((((x(3) xor x(6)) xor x(8)) xor x(12)) xor x(14)) xor c(7));
 
  if s="10101110" then
      
     y(0 to 11)<=x(0 to 11);
     y(12)<=not x(12);
     y(13)<=not x(13);
     y(14)<=not x(14);
     y(15)<=not x(15);
     
  elsif  s="11101110" then
      
     y(0)<=not x(0);
     y(1)<=not x(1);
     y(2)<=not x(2);
     y(3 to 15)<=x(3 to 15);  
   
  else
      
     y<=x;       
   
  end if;
  
  
      
end process;
  
end beh;
  

             