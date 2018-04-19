library ieee;
use ieee.std_logic_1164.all;

entity Moore_One_Hot is 
port(KEY : in std_logic_vector(0 downto 0); 
      SW : in std_logic_vector(1 downto 0);
      LEDG : out std_logic_vector(0 downto 0);
		LEDR : out std_logic_vector(8 downto 0));
end Moore_One_Hot;

architecture behav of Moore_One_Hot is

component D_flipflop
port(D, clk, Set, reset: in std_logic;
        Q: out std_logic);
end component;


signal y, S : std_logic_vector(8 downto 0);
signal Clock, w, resetn, z : std_logic;

begin 
Tot_0 : D_flipflop port map (y(0), Clock, Clock, resetn, S(0));
Tot : for i in 1 to 8 generate 
   DFF: D_flipflop port map (y(i), Clock, Clock, resetn , S(i));
end generate;

--process(Resetn, Clock, S, w)
--begin 
y(0) <= '0';
y(1) <= (not w) and (S(0) or S(5) or S(6) or S(7) or S(8));
y(2) <= S(1) and (not w);
y(3) <= S(2) and (not w);
y(4) <= (not w) and (S(3) or S(4));
y(5) <= w and (S(0) or S(1) or S(2) or S(3) or S(4));
y(6) <= S(5) and w;
y(7) <= S(6) and w;
y(8) <= w and (S(7) or S(8));
z <= (S(8) or S(4));
--end process;
resetn <= SW(0);
w <= SW(1);
Clock <= KEY(0);
LEDG(0) <= z;
LEDR <= S;
end behav;