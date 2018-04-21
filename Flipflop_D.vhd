library ieee;
use ieee.std_logic_1164.all;

entity D_flipflop is
    port (D, clk, Set, reset: in std_logic;
        Q: out std_logic);
end D_flipflop;

architecture behavior of D_flipflop is
signal temp : std_logic;
begin

process(clk)
 
begin
     if (clk'event and clk = '1') then
		  if (reset = '0') then
		  Q <= '0';
		  elsif(set = '0') then 
		  Q <= not(D);
		  else
		  Q <= D;
		  
		  end if;
		  end if;
         
		  end process;
		  --temp <= D;

end behavior;