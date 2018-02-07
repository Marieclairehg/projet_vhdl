library IEEE;
use IEEE.std_logic_1164.all;

entity tb_conversion is
end entity tb_conversion;

architecture testbench of tb_conversion is

signal NOTE : std_logic_vector(3 downto 0);
signal OCTAVE : std_logic_vector(1 downto 0);
signal GENRE : std_logic_vector(1 downto 0);
signal FREQ : std_logic_vector(11 downto 0);
signal FETCH : std_logic;
signal CLK : std_logic

begin
  
TB : entity work.conversion(struct)

port map( NOTE=>NOTE , OCTAVE=>OCTAVE , GENRE=>GENRE , FREQ=>FREQ , FETCH=>FETCH , CLK=>CLK);
      
     
stimulus : process
begin
  
    --TEST GENRE
  --Do noire octave 1  262Hz 
  NOTE <= '0001'; OCTAVE <= '00'; GENRE <= '00'
  wait for 1 s;
  --Do croche octave 1  262Hz 
  NOTE <= '0001'; OCTAVE <= '00'; GENRE <= '01'
  wait for 1 s;
    --Do double croche octave 1  262Hz 
  NOTE <= '0001'; OCTAVE <= '00'; GENRE <= '10'
  wait for 1 s;
    --Do blanche octave 1  262Hz 
  NOTE <= '0001'; OCTAVE <= '00'; GENRE <= '11'
  wait for 1 s;
  
    --TEST OCTAVE
  --Do noire octave 1  262Hz 
  NOTE <= '0001'; OCTAVE <= '00'; GENRE <= '00'
  wait for 1 s;
  --Do noire octave 2  524Hz 
  NOTE <= '0001'; OCTAVE <= '01'; GENRE <= '00'
  wait for 1 s;
    --Do noire octave 3  1048Hz 
  NOTE <= '0001'; OCTAVE <= '10'; GENRE <= '00'
  wait for 1 s;
    --Do noire octave 4  2096Hz 
  NOTE <= '0001'; OCTAVE <= '11'; GENRE <= '00'
  wait for 1 s;
  
    --TEST NOTE
    
  --Do : 262Hz noire octave 1
  NOTE <= '0001'; OCTAVE <= '00'; GENRE <= '00'
  wait for 1 s;
  --Do# : 277 Hz noire octave 1 
  NOTE <= '0011'; OCTAVE <= '01'; GENRE <= '00'
  wait for 1 s;
  --Re : 294 Hz noire octave 1  
  NOTE <= '0100'; OCTAVE <= '10'; GENRE <= '00'
  wait for 1 s;
  --Re# : 311 Hz noire octave 1   
  NOTE <= '0101'; OCTAVE <= '11'; GENRE <= '00'
  wait for 1 s;
    
end process;
               
end architecture testbench;