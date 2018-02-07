--diviseur de frequence à 104 microsecondes

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity compteur is 
 port(
	clk,rst : in std_logic;
	tick	: out std_logic
);
end compteur;
architecture behavior of compteur is
signal CMPT: std_logic_vector(12 downto 0) := (others => '0'); 
begin
process(clk,rst)
begin
if rst='1' then 
	CMPT <= (others =>'0');
else
	if CMPT = "1010001010000" then
		CMPT <= (others =>'0');
		tick <= '1';
	else 
		CMPT <= CMPT + 1;
		if(falling_edge(clk)) then
			tick <= '0';
		end if;
	end if;
end if;
end process;
end behavior; 
