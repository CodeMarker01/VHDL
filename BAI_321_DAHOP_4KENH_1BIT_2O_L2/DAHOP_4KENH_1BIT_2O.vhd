-- MACH DA HOP 4 KENH 1 BIT
library ieee;
use ieee.std_logic_1164.all;

entity DAHOP_4KENH_1BIT_2O is
	Port ( sw: in std_logic_vector(5 downto 0);
			 led: out std_logic_vector(1 downto 0)
	);
end dahOP_4KENH_1BIT_2O;
	
architecture quang of dahOP_4KENH_1BIT_2O is
begin
DAHOP_CONDITIONAL_INS: entity work.DAHOP_CONDITIONAL_INS
	port map( i => sw(3 downto 0),
				 S => sw (5 downto 4),
				 o => led(0)
	);
DAHOP_SELECT_INS: entity work.DAHOP_SELECT_INS
	port map( i => sw(3 downto 0),
				 S => sw (5 downto 4),
				 o => led(1)
	);
end quang;