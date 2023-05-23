library ieee;
use ieee.std_logic_1164.all;


entity corrector is
    
 port(    x : in std_logic_vector(0 to 15);
          c : in std_logic_vector(0 to 8);
          s : inout std_logic_vector(0 to 8);
          y : out std_logic_vector(0 to 15)
     
     );
      
end corrector;

architecture beh of corrector is
    
    constant i0:std_logic_vector(0 to 8):="100000000";
    constant i1:std_logic_vector(0 to 8):="010000000";
    constant i2:std_logic_vector(0 to 8):="001000000";
    constant i3:std_logic_vector(0 to 8):="000100000";
    constant i4:std_logic_vector(0 to 8):="000010000";
    constant i5:std_logic_vector(0 to 8):="000001000";
    constant i6:std_logic_vector(0 to 8):="000000100";
    constant i7:std_logic_vector(0 to 8):="000000010";
    constant i8:std_logic_vector(0 to 8):="000000001";
   

  type par_chk_mat is array  (0 to 8) of std_logic_vector(0 to 24);
  signal h : par_chk_mat:=("1000000001000111100000000",
                           "0100000000100010001100010",
                           "0010000000010001010010001",
                           "0001000000001000100011000",
                           "0000100001000010000100101",
                           "0000010000100001000100100",
                           "0000001000010000100110001",
                           "0000000100001000010001010",
                           "0000000010000100001001100");
  
  
  
      
begin

process(x,c,s)   
begin
   
  s(0)<=(((((x(0) xor x(4)) xor x(5)) xor x(6)) xor x(7)) xor c(0));
  s(1)<=(((((x(1) xor x(5)) xor x(9)) xor x(10)) xor x(14)) xor c(1));
  s(2)<=(((((x(2) xor x(6)) xor x(8)) xor x(11)) xor x(15)) xor c(2));
  s(3)<=((((x(3) xor x(7)) xor x(11)) xor x(12)) xor c(3));
  s(4)<=((((x(5) xor x(10)) xor x(13)) xor x(15)) xor c(4));
  s(5)<=((((x(1) xor x(6)) xor x(10)) xor x(13)) xor c(5));
  s(6)<=(((((x(2) xor x(7)) xor x(10)) xor x(11)) xor x(15)) xor c(6));
  s(7)<=((((x(3) xor x(8)) xor x(12)) xor x(14)) xor c(7));
  s(8)<=((((x(4) xor x(9)) xor x(12)) xor x(13)) xor c(8));
  
  if s="011101100" then
      
     y(0 to 11)<=x(0 to 11);
     y(12)<=not x(12);
     y(13)<=not x(13);
     y(14)<=not x(14);
     y(15)<=not x(15);
     
  elsif  s="011111101" then
     
     y(0 to 3)<=x(0 to 3);
     y(4)<=not x(4);
     y(5)<=not x(5);
     y(6)<=not x(6);
     y(7)<=not x(7);      
     y(8 to 15)<=x(8 to 15);  
   
  else
      
     y<=x;       
   
  end if;
  
  
      
end process;
  
end beh;
  

             