library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity tb is 
end tb;
architecture behavior of tb is
signal rst: std_logic := '1'; 
signal clk: std_logic := '0'; 
signal tick: std_logic; 
begin

clk <= '1' after 20 ns when clk = '0' else
	'0' after 20 ns;


 c0: entity work.compteur(behavior) port map (clk,rst,tick);
end behavior; 