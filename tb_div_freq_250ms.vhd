library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity tb_div_freq_250ms is 
end tb_div_freq_250ms;

architecture behavior of tb_div_freq_250ms is
signal rst: std_logic := '0'; 
signal clk: std_logic := '0'; 
signal tick_fdiv: std_logic; 

    component diviseur_freq_250ms is
-- ---------------------------------------
      Port (  clk     : In    std_logic;
              reset     : In    std_logic;
              baud_rate : Out   std_logic  );
end component;

begin

 clk <= '1' after 10 ns when clk = '0' else
        '0' after 10 ns;
 C2: component diviseur_freq_250ms port map (clk,rst,tick_fdiv);
end behavior; 

