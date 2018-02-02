library ieee; 
use ieee.std_logic_1164.all;

entity conversion is port(
  NOTE : in std_logic_vector(3 downto 0);
  OCTAVE : in std_logic_vector(1 downto 0);
  GENRE : in std_logic_vector(1 downto 0);
  FREQ : out std_logic_vector(11 downto 0);
  FETCH : out std_logic;
  CLK : in std_logic
);
end conversion;


architecture struct of conversion is 

signal freq_intern : std_logic_vector(11 downto 0);

begin 

process(OCTAVE,NOTE)
begin 
  
  case OCTAVE is
    
    --octave 1
    when "00" =>
      case NOTE is 
        when "0001" => freq_int <= "000100000110" -- Do : 262 Hz
        when "0010" => freq_int <= "000100010101" -- Do# : 277 Hz
        when "0011" => freq_int <= "000100100110" -- Re : 294 Hz
        when "0100" => freq_int <= "000100110111" -- Re# : 311 Hz
        when "0101" => freq_int <= "000101001010" -- Mi : 330 Hz
        when "0110" => freq_int <= "000101011101" -- Fa : 349 Hz
        when "0111" => freq_int <= "000101110010" -- Fa# : 370 Hz
        when "1000" => freq_int <= "000110001000" -- Sol : 392 Hz
        when "1001" => freq_int <= "000110011111" -- Sol# : 415 Hz
        when "1010" => freq_int <= "000110111000" -- La : 440 Hz
        when "1011" => freq_int <= "000111010010" -- La# : 466 Hz
        when "1100" => freq_int <= "000111101110" -- Si : 494 Hz
      end case;   
      
    --octave 2 x2
    when "01" =>
      case NOTE is 
        when "0001" => freq_int <= "00001000001100" -- Do : 524 Hz
        when "0010" => freq_int <= "00001000101010" -- Do# : 554 Hz
        when "0011" => freq_int <= "00001001001100" -- Re : 588 Hz
        when "0100" => freq_int <= "00001001101110" -- Re# : 622 Hz
        when "0101" => freq_int <= "00001010010100" -- Mi : 660 Hz
        when "0110" => freq_int <= "00001010111010" -- Fa : 698 Hz
        when "0111" => freq_int <= "00001011100100" -- Fa# : 740 Hz
        when "1000" => freq_int <= "00001100010000" -- Sol : 784 Hz
        when "1001" => freq_int <= "00001100111110" -- Sol# : 830 Hz
        when "1010" => freq_int <= "00001101110000" -- La : 880 Hz
        when "1011" => freq_int <= "00001110100100" -- La# : 932 Hz
        when "1100" => freq_int <= "00001111011100" -- Si : 988 Hz
    end case;
    
    --octave 3 x4
    when "10" =>
      case NOTE is 
        when "0001" => freq_int <= "10000011000" -- Do : 1048 Hz
        when "0010" => freq_int <= "10001010100" -- Do# : 1108 Hz
        when "0011" => freq_int <= "10010011000" -- Re : 1176 Hz
        when "0100" => freq_int <= "10011011100" -- Re# : 1244 Hz
        when "0101" => freq_int <= "10100101000" -- Mi : 1320 Hz
        when "0110" => freq_int <= "10101110100" -- Fa : 1396 Hz
        when "0111" => freq_int <= "10111001000" -- Fa# : 1480 Hz
        when "1000" => freq_int <= "11000100000" -- Sol : 1568 Hz
        when "1001" => freq_int <= "11001111100" -- Sol# : 1660 Hz
        when "1010" => freq_int <= "11011100000" -- La : 1760 Hz
        when "1011" => freq_int <= "11101001000" -- La# : 1864 Hz
        when "1100" => freq_int <= "11110111000" -- Si : 1976 Hz
    end case;
        
        
    --octave 4 x8
    when "11" =>
      case NOTE is 
        when "0001" => freq_int <= "100000110000" -- Do : 2096 Hz
        when "0010" => freq_int <= "100010101000" -- Do# : 2216 Hz
        when "0011" => freq_int <= "100100110000" -- Re : 2352 Hz
        when "0100" => freq_int <= "100110111000" -- Re# : 2488 Hz
        when "0101" => freq_int <= "101001010000" -- Mi : 2640 Hz
        when "0110" => freq_int <= "101011101000" -- Fa : 2792 Hz
        when "0111" => freq_int <= "101110010000" -- Fa# : 2960 Hz
        when "1000" => freq_int <= "110001000000" -- Sol : 3136 Hz
        when "1001" => freq_int <= "110011111000" -- Sol# : 1660 Hz
        when "1010" => freq_int <= "110111000000" -- La : 3520 Hz
        when "1011" => freq_int <= "111010010000" -- La# : 3728 Hz
        when "1100" => freq_int <= "111101110000" -- Si : 3952 Hz
      end case;  
       
  end case;   
end process;

process(GENRE)
  begin 
    case GENRE is 
    -- noire
    when "00" => 
      FREQ <= freq_int;
      wait for 0.5 s;
      FETCH <= "1"; 
    -- croche  
    when "01" => 
      FREQ <= freq_int;
      wait for 0.5 s;
      FETCH <= "1";
    -- double croche
    when "10" => 
      FREQ <= freq_int;
      wait for 0.125 s;
      FETCH <= "1";
    -- blanche  
    when "11" => 
      FREQ <= freq_int;
      wait for 0.5 s;
      FETCH <= "1";    
end process;




end struct;

