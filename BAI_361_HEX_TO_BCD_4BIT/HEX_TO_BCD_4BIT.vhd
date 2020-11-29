library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity HEX_TO_BCD_4BIT is
Port ( 	sw: in STD_LOGIC_VECTOR (3 downto 0);
			led: out STD_LOGIC_VECTOR (7 downto 0));
end HEX_TO_BCD_4BIT;
architecture Behavioral of HEX_TO_BCD_4BIT is
begin
HEXTOBCD: ENTITY WORK.HEXTOBCD_4BIT
PORT MAP( 	SOHEX4BIT => SW,
				DONVI => LED(3 DOWNTO 0),
				CHUC => LED(7 DOWNTO 4));
end Behavioral;