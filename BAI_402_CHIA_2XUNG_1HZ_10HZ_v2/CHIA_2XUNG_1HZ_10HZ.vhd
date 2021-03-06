-- CHIA XUNG ckht TAO XUNG 1HZ VA 10Z
-- HE SO CONG TAC 50%
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CHIA_2XUNG_1HZ_10HZ is
	Port ( CLOCK_50: in STD_LOGIC;
			LEDR: out STD_LOGIC_VECTOR(1 DOWNTO 0));
end CHIA_2XUNG_1HZ_10HZ;

architecture Behavioral of CHIA_2XUNG_1HZ_10HZ is
begin
	CHIA_XUNG: ENTITY WORK.CHIA_2XUNG
	PORT MAP( CKHT => CLOCK_50,
				CK1HZ => LEDR(0),
				CK10HZ => LEDR(1));
end Behavioral;