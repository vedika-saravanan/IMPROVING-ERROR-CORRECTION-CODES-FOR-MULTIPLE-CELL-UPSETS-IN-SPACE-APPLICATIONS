library ieee;
use ieee.std_logic_1164.all;

entity fault_inj is    
 port(     clk   : in std_logic;
           x_in  : in std_logic_vector(0 to 15);
           x_out : out std_logic_vector(0 to 15));      
end fault_inj;

architecture beh of fault_inj is
    signal count : integer:=0;
begin

process(clk,x_in,count)
begin
    
if clk'event and clk='1' then
count<=count + 1;
case count is

when 1=>

     x_out(0) <= not x_in(0);
     x_out(1) <= not x_in(1);
     x_out(2 to 15) <= x_in(2 to 15);
     
when 2=>      
     
     x_out(0 to 1) <= x_in(0 to 1);
     x_out(2) <= not x_in(2);
     x_out(3) <= not x_in(3);
     x_out(4 to 15) <= x_in(4 to 15);
     
when 3=>      
     
     x_out(0 to 3) <= x_in(0 to 3);
     x_out(4) <= not x_in(4);
     x_out(5) <= not x_in(5);
     x_out(6 to 15) <= x_in(6 to 15);
     
when 4=>      
     
     x_out(0 to 5) <= x_in(0 to 5);
     x_out(6) <= not x_in(6);
     x_out(7) <= not x_in(7);
     x_out(8 to 15) <= x_in(8 to 15);
     
when 5=>      
     
     x_out(0 to 7) <= x_in(0 to 7);
     x_out(8) <= not x_in(8);
     x_out(9) <= not x_in(9);
     x_out(10 to 15) <= x_in(10 to 15);
     
when others=>

end case;

end if;

end process;

end beh;
     
    
    