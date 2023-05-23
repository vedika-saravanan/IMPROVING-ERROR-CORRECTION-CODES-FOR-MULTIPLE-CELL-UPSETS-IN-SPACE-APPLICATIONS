library ieee;
use ieee.std_logic_1164.all;

entity final is
    
 port(      clk   : in std_logic;
           enc_in : in std_logic_vector(0 to 15);
           dec_op : out std_logic_vector(0 to 15));
      
end final;

architecture str of final is

component encoder is    
 port(     x : in std_logic_vector(0 to 15);
           c : out std_logic_vector(0 to 7));      
end component;

component fault_inj is    
 port(     clk   : in std_logic;
           x_in  : in std_logic_vector(0 to 15);
           x_out : out std_logic_vector(0 to 15));      
end component;

component corrector_1 is    
 port(    x : in std_logic_vector(0 to 15);
          c : in std_logic_vector(0 to 7);
          s : inout std_logic_vector(0 to 7);
          y : out std_logic_vector(0 to 15)    
     );      
end component;

signal c_op    : std_logic_vector(0 to 7);
signal err_val : std_logic_vector(0 to 15);
signal s       : std_logic_vector(0 to 7);

begin

u0:encoder port map(enc_in,c_op);
u1:fault_inj port map(clk,enc_in,err_val);
u2:corrector_1 port map(err_val,c_op,s,dec_op);


end str;


