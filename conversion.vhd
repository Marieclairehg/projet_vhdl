library ieee; 
use ieee.std_logic_1164.all;

entity conversion is port(
  NOTE : in std_logic_vector(3 downto 0);
  OCTAVE : in std_logic_vector(1 downto 0);
  GENRE : in std_logic_vector(1 downto 0);
  FREQ : out std_logic_vector(11 downto 0);
  FETCH : out std_logic := '0' ;
  CLK : in std_logic
  ETAT : out std_logic_vector(3 downto 0);
);
end conversion;
  

architecture struct of conversion is 

signal freq_int : std_logic_vector(11 downto 0);
signal rst_intern: std_logic := '0'; 
signal tick125ms_intern: std_logic;
signal tick250ms_intern: std_logic;
signal tick500ms_intern: std_logic;
signal tick1000ms_intern: std_logic;



-- ---------------------------------------
    component diviseur_freq_125ms is
-- ---------------------------------------
   Generic (  Fclock  : positive := 50E6); -- System Clock Freq in Hertz
      Port (  clk     : In    std_logic;
              reset     : In    std_logic;
              baud_rate : Out   std_logic  );
end component diviseur_freq_125ms;

-- ---------------------------------------
    component diviseur_freq_250ms is
-- ---------------------------------------
   Generic (  Fclock  : positive := 50E6); -- System Clock Freq in Hertz
      Port (  clk     : In    std_logic;
              reset     : In    std_logic;
              baud_rate : Out   std_logic  );
end component diviseur_freq_250ms;

-- ---------------------------------------
    component diviseur_freq_500ms is
-- ---------------------------------------
   Generic (  Fclock  : positive := 50E6); -- System Clock Freq in Hertz
      Port (  clk     : In    std_logic;
              reset     : In    std_logic;
              baud_rate : Out   std_logic  );
end component diviseur_freq_500ms;

-- ---------------------------------------
    component diviseur_freq_1000ms is
-- ---------------------------------------
   Generic (  Fclock  : positive := 50E6); -- System Clock Freq in Hertz
      Port (  clk     : In    std_logic;
              reset     : In    std_logic;
              baud_rate : Out   std_logic  );
end component diviseur_freq_1000ms;



begin 
  
c0: entity work.diviseur_freq_125ms(behavior) port map (CLK,rst_intern,tick125ms_intern);
c1: entity work.diviseur_freq_250ms(behavior) port map (CLK,rst_intern,tick250ms_intern);
c2: entity work.diviseur_freq_500ms(behavior) port map (CLK,rst_intern,tick500ms_intern);
c3: entity work.diviseur_freq_1000ms(behavior) port map (CLK,rst_intern,tick1000ms_intern);



process(OCTAVE,NOTE)
begin 
  
  case OCTAVE is
    
    --octave 1
    when "00" =>
      case NOTE is 
        when "0001" => freq_int <= "000100000110"; -- Do : 262 Hz
        when "0010" => freq_int <= "000100010101"; -- Do# : 277 Hz
        when "0011" => freq_int <= "000100100110"; -- Re : 294 Hz
        when "0100" => freq_int <= "000100110111"; -- Re# : 311 Hz
        when "0101" => freq_int <= "000101001010"; -- Mi : 330 Hz
        when "0110" => freq_int <= "000101011101"; -- Fa : 349 Hz
        when "0111" => freq_int <= "000101110010"; -- Fa# : 370 Hz
        when "1000" => freq_int <= "000110001000"; -- Sol : 392 Hz
        when "1001" => freq_int <= "000110011111"; -- Sol# : 415 Hz
        when "1010" => freq_int <= "000110111000"; -- La : 440 Hz
        when "1011" => freq_int <= "000111010010"; -- La# : 466 Hz
        when "1100" => freq_int <= "000111101110"; -- Si : 494 Hz
          	--OTHERS
			   when OTHERS =>
      end case;   
      std_logic_vector
    --octave 2 x2
    when "01" =>
      case NOTE is 
        when "0001" => freq_int <= "001000001100"; -- Do : 524 Hz
        when "0010" => freq_int <= "001000101010"; -- Do# : 554 Hz
        when "0011" => freq_int <= "001001001100"; -- Re : 588 Hz
        when "0100" => freq_int <= "001001101110"; -- Re# : 622 Hz
        when "0101" => freq_int <= "001010010100"; -- Mi : 660 Hz
        when "0110" => freq_int <= "001010111010"; -- Fa : 698 Hz
        when "0111" => freq_int <= "001011100100"; -- Fa# : 740 Hz
        when "1000" => freq_int <= "001100010000"; -- Sol : 784 Hz
        when "1001" => freq_int <= "001100111110"; -- Sol# : 830 Hz
        when "1010" => freq_int <= "001101110000"; -- La : 880 Hz
        when "1011" => freq_int <= "001110100100"; -- La# : 932 Hz
        when "1100" => freq_int <= "001111011100"; -- Si : 988 Hz
          	--OTHERS
			  when OTHERS =>
      end case;
    
    --octave 3 x4
    when "10" =>
      case NOTE is 
        when "0001" => freq_int <= "010000011000"; -- Do : 1048 Hz
        when "0010" => freq_int <= "010001010100"; -- Do# : 1108 Hz
        when "0011" => freq_int <= "010010011000"; -- Re : 1176 Hz
        when "0100" => freq_int <= "010011011100"; -- Re# : 1244 Hz
        when "0101" => freq_int <= "010100101000"; -- Mi : 1320 Hz
        when "0110" => freq_int <= "010101110100"; -- Fa : 1396 Hz
        when "0111" => freq_int <= "010111001000"; -- Fa# : 1480 Hz
        when "1000" => freq_int <= "011000100000"; -- Sol : 1568 Hz
        when "1001" => freq_int <= "011001111100"; -- Sol# : 1660 Hz
        when "1010" => freq_int <= "011011100000"; -- La : 1760 Hz
        when "1011" => freq_int <= "011101001000"; -- La# : 1864 Hz
        when "1100" => freq_int <=std_logic_vector "011110111000"; -- Si : 1976 Hz
          	--OTHERS
			  when OTHERS =>
      end case;
        
    --octave 4 x8
    when "11" =>
      case NOTE is 
        when "0001" => freq_int <= "100000110000"; -- Do : 2096 Hz
        when "0010" => freq_int <= "100010101000"; -- Do# : 2216 Hz
        when "0011" => freq_int <= "100100110000"; -- Re : 2352 Hz
        when "0100" => freq_int <= "100110111000"; -- Re# : 2488 Hz
        when "0101" => freq_int <= "101001010000"; -- Mi : 2640 Hz
        when "0110" => freq_int <= "101011101000"; -- Fa : 2792 Hz
        when "0111" => freq_int <= "101110010000"; -- Fa# : 2960 Hz
        when "1000" => freq_int <= "110001000000"; -- Sol : 3136 Hz
        when "1001" => freq_int <= "110011111000"; -- Sol# : 1660 Hz
        when "1010" => freq_int <= "110111000000"; -- La : 3520 Hz
        when "1011" => freq_int <= "111010010000"; -- La# : 3728 Hz
        when "1100" => freq_int <= "111101110000"; -- Si : 3952 Hz
          	--OTHERS
			 when OTHERS =>
      end case;  
      
      
    	--OTHERS
			when OTHERS =>
       
  end case; 
    
end process;





process(GENRE,CLK)
  
  begin 
    
		if (rising_edge(CLK) ) then
    case GENRE is 
      
		-- noire
  		when "00" => 
			FREQ <= freq_int;
			if (tick500ms_intern = '1') then
    			  ETAT <= "0001";
			   FETCH <= '1'; 
			else
  			   FETCH <= '0'; 
			end if;
			
		 -- croche  
		 when "01" => 
			FREQ <= freq_int;
			if (tick250ms_intern = '1') then
    			  ETAT <= "0011";
			   FETCH <= '1';
			else
  			   FETCH <= '0'; 
			end if;
			
		 -- double croche
		 when "10" => 
			FREQ <= freq_int;
			if (tick125ms_intern = '1') then
    			  ETAT <= "0111";
			   FETCH <= '1';
			else
  			   FETCH <= '0'; 
			end if;
			
		 -- blanche  
		 when "11" => 
		   
			FREQ <= freq_int;
			if (tick1000ms_intern = '1') then
    			  ETAT <= "1111";
			   FETCH <= '1';   
			else
  			   FETCH <= '0'; 
			end if; 
			
			--OTHERS
			when OTHERS =>
			
			end case;
		end if; 
			
end process;


end struct;


