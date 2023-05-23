library ieee;
use ieee.std_logic_1164.all;

entity final_1 is    
 port(    clk,wr_en : in std_logic;
           enc_in : in std_logic_vector(0 to 15);
            addr  : in std_logic_vector(7 downto 0);
           dec_op : out std_logic_vector(0 to 15));      
end final_1;


architecture str of final_1 is

component encoder is    
 port(     x : in std_logic_vector(0 to 15);
           c : out std_logic_vector(0 to 8));      
end component;

component sram is
port(   data_in   : in std_logic_vector(0 to 15);
        clk,wr_en : in std_logic;
         addr     : in std_logic_vector(7 downto 0);
        data_out  : out std_logic_vector(0 to 15));
end component;

component fault_inj is    
 port(     clk   : in std_logic;
           x_in  : in std_logic_vector(0 to 15);
           x_out : out std_logic_vector(0 to 15));      
end component;

component corrector_1 is    
 port(    x : in std_logic_vector(0 to 15);
          c : in std_logic_vector(0 to 8);
          s : inout std_logic_vector(0 to 8);
          y : out std_logic_vector(0 to 15)    
     );      
end component;

signal c_op    : std_logic_vector(0 to 8);
signal sram_op,err_val : std_logic_vector(0 to 15);
signal s       : std_logic_vector(0 to 8);

begin

u0:encoder port map(enc_in,c_op);
u1:sram port map(enc_in,clk,wr_en,addr,sram_op);
u2:fault_inj port map(clk,sram_op,err_val);
u3:corrector_1 port map(err_val,c_op,s,dec_op);


end str;



