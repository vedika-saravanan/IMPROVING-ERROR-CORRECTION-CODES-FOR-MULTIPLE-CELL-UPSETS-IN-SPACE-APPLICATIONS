library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sram is
port(data_in:in std_logic_vector(0 to 15);
     clk,wr_en:in std_logic;
     addr:in std_logic_vector(7 downto 0);
     data_out:out std_logic_vector(0 to 15));
end sram;
     
architecture behav of sram is
     
     type mem is array (0 to 255) of std_logic_vector(0 to 15);
     signal mem_addr:mem;
     
begin
     
 process(clk,wr_en,data_in,addr)
     
 begin
     
    if clk'event and clk='1' then
     
     if wr_en='1' then
         
         mem_addr(conv_integer(addr))<= data_in;
         
     elsif wr_en='0' then
         
         data_out<= mem_addr(conv_integer(addr));
         
     end if;
     
   end if;
     
 end process;
 
 end behav;
  
     