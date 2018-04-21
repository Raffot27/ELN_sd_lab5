library ieee;
use ieee.std_logic_1164.all;

entity Interf is
port (CLOCK_50 : in std_logic;
      Key : in std_logic_vector(0 downto 0);
		Hex0, Hex1, Hex2, Hex3, Hex4, Hex5, Hex6, Hex7 : OUT std_logic_vector(6 downto 0)
      );
end Interf;

architecture struct of Interf is
component Hello_FSM 
port( clk, rst : in std_logic;
		Hex0, Hex1, Hex2, Hex3, Hex4, Hex5, Hex6, Hex7 : OUT std_logic_vector(6 downto 0)
		);
end component;
begin 

FSM : Hello_FSM port map (CLOCK_50, Key(0), Hex0, Hex1, Hex2, Hex3, Hex4, Hex5, Hex6, Hex7);
end struct;
