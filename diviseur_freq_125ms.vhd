Library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;
  
  
  
-- ---------------------------------------
    Entity diviseur_freq_125ms is
-- ---------------------------------------
   Generic (  Fclock  : positive := 50E6); -- System Clock Freq in Hertz
      Port (  clk     : In    std_logic;
              reset     : In    std_logic;
              baud_rate : Out   std_logic  );
end entity diviseur_freq_125ms;



-- ---------------------------------------
    Architecture behavior of diviseur_freq_125ms is
-- ---------------------------------------

constant Divisor : positive := Fclock / 8000 ; -- we want 8 bauds
signal Count     : integer range 0 to Divisor-1;

-----
Begin
-----

process (Clk,reset)
begin
  if reset='1' then
    Count <= 0;
    baud_rate <= '0';
  elsif Clk 'event and clk = '1' then
    baud_rate <= '0';
    if Count = 0  then
      baud_rate <= '1';
      Count <= Divisor-1;
    else
      Count <= Count - 1;
    end if;
  end if;
end process;

end architecture behavior;
