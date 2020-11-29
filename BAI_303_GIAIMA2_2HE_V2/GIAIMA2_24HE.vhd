library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GIAIMA2_24HE is
	Port ( 	sw: in STD_LOGIC_VECTOR (3 downto 0);
				Led: out STD_LOGIC_VECTOR (7 downto 0));
end GIAIMA2_24HE;
architecture Behavioral of GIAIMA2_24HE is
begin
	GIAIMA_SELECT_INS: ENTITY WORK.GIAIMA_IF_INS_E
		PORT MAP( 	I => SW(1 DOWNTO 0),
						O => LED(3 DOWNTO 0));
	GIAIMA_CONDITIONAL_INS: ENTITY WORK.GIAIMA_CASE_INS_E
		PORT MAP( 	I => SW(3 DOWNTO 2),
						O => LED(7 DOWNTO 4));
end Behavioral;
