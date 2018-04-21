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
port(   D, clk, Set, reset: in std_logic;
        Q: out std_logic;
		   f: out std_logic);
end component;



signal nxt_st, cnt_st: std_logic_vector(8 downto 0);
signal Clock, w, resetn, z, a, b: std_logic;
begin 


A_st : D_flipflop port map (a, Clock, '0', resetn, cnt_st(0));
B_st : D_flipflop port map (nxt_st(1), Clock, '1' , resetn, cnt_st(1), a);
State : for i in 2 to 8 generate 
   DFF: D_flipflop port map (nxt_st(i), Clock, '1' , resetn , cnt_st(i));
end generate;


nxt_st(0) <= '1';
nxt_st(1) <= (not w) and ( cnt_st(0) or cnt_st(5) or cnt_st(6) or cnt_st(7) or cnt_st(8));
nxt_st(2) <= cnt_st(1) and (not w);
nxt_st(3) <= cnt_st(2) and (not w);
nxt_st(4) <= (not w) and (cnt_st(3) or cnt_st(4));
nxt_st(5) <= w and ( cnt_st(0) or cnt_st(1) or cnt_st(2) or cnt_st(3) or cnt_st(4));
nxt_st(6) <= cnt_st(5) and w;
nxt_st(7) <= cnt_st(6) and w;
nxt_st(8) <= w and (cnt_st(7) or cnt_st(8));
z <= (cnt_st(8) or cnt_st(4));

resetn <= SW(0);
w <= SW(1);
Clock <= KEY(0);
LEDG(0) <= z;

LEDR <= cnt_st;
end behav;
