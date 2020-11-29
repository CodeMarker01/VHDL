-- HEC 6 BIT -> BCD
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity HEX_TO_BCD_6BIT is
Port ( 	sw: in STD_LOGIC_VECTOR (5 downto 0); -- 6 bit
			led: out STD_LOGIC_VECTOR (7 downto 0)); -- max 6 bit = 63
end HEX_TO_BCD_6BIT;
architecture Behavioral of HEX_TO_BCD_6BIT is
begin
HEXTOBCD: ENTITY WORK.HEXTOBCD_6BIT
PORT MAP( 	SOHEX4BIT => SW,
				DONVI => LED(3 DOWNTO 0),
				CHUC => LED(7 DOWNTO 4));
end Behavioral;
