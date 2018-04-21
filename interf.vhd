library ieee;
use ieee.std_logic_1164.all;

entity interf is
port ( SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 LEDG : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		 LEDR : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
		);
END interf;

architecture stru of interf is

component FSM_2_process is
PORT ( clock, w, resetn : in std_logic;
		 z	               : out std_logic; 
       y_led 				: out std_logic_vector(8 downto 0) );
end component;

begin 
saldatura: FSM_2_process port map ( KEY(0), SW(1), SW(0), LEDG(0), LEDR);
END stru;


		 