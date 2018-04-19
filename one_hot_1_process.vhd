library ieee;
use ieee.std_logic_1164.all;

entity  FSM_2_process is
PORT ( clock, w, resetn : in std_logic;
		 z	               : out std_logic; 
       y_led 				: out std_logic_vector(8 downto 0) );
end FSM_2_process;

architecture beh of FSM_2_process is
type state_type is (A, B, C, D, E, F, G, H, I);
SIGNAL s_present, s_next : state_type;
signal y :std_logic_vector(8 downto 0);

begin
y_led<=y;

process(w, s_present)
   begin
	case s_present is
	   when A => y<="000000001";
					 if w='0' then s_next<=B;	
					 else s_next<=F;
					 end if;
					 
		when B => y<="000000010";
		          if w='0' then s_next<=C;				 
					 else s_next<=F; 
					 end if; 
					 
	   when C =>  y<="000000100";
					 if w='0' then s_next<=D;					  
					 else s_next<=F; 
					 end if;
					 
		when D => y<="000001000";
					 if w='0' then s_next<=E; 
					 else s_next<=F; 
					 end if; 
		when E => y<="000010000";
					 if w='1' then s_next<=F; 
					 else s_next<=E;
					 end if; 
					 
	   when F => y<="000010000";
					 if w='1' then s_next<=G; 					 
					 else s_next<=B; 
					 end if; 
					 
		when G => y<="001000000";
					 if w='1' then s_next<=H; 					 
					 else s_next<=B; 
					 end if;
				
		when H => y<="010000000";
					 if w='1' then s_next<=I;					 
					 else s_next<=B; 
					 end if;
					 
	   when I => y<="100000000";
					 if w='0' then s_next<=B;
					 else s_next<=I; 
					 end if; 
		end case;
		end process;
		
process (clock)
begin

if (clock'event and clock='1') then
    if resetn='0' then s_present<=A;
	 else
    
	 s_present<=s_next;
	 end if;
	 end if;
end process;
	 z<='1' when s_present=E or s_present=I else '0';
		end beh;

		 