library ieee;
use ieee.std_logic_1164.all;


entity detector is
    
 port(   c0,c1,c2,c3,c4,c5,c6,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15 : in std_logic;
                  s0,s1,s2,s3,s4,s5,s6                         : out std_logic
     
     );
      
end detector;

architecture beh of detector is
    
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

process(c0,c1,c2,c3,c4,c5,c6,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)   
begin
 
  s0<=(((((((x0 xor x4) xor x7) xor x8) xor x11) xor x12) xor x13) xor c0);
  s1<=((((((((x1 xor x3) xor x5) xor x7) xor x9) xor x10) xor x11) xor x14) xor c1);
  s2<=((((((((x0 xor x2) xor x6) xor x7) xor x9) xor x12) xor x14) xor x15) xor c2);
  s3<=(((((x1 xor x4) xor x8) xor x9) xor x12) xor c3);
  s4<=(((((((x0 xor x3) xor x4) xor x7) xor x12) xor x13) xor x15) xor c4);
  s5<=(((((((x1 xor x2) xor x5) xor x9) xor x10) xor x12) xor x14) xor c5);
  s6<=((((((((x2 xor x3) xor x6) xor x8) xor x10) xor x11) xor x13) xor x15) xor c6);
 
  
end process;
  
end beh;
  

             