--- GIAI MA LED 7 DOAN ANODE CHUNG CO ENABLE
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity
entity GIAIMA_LED_7DOAN_ANODE_ENA is
	Port ( SW: IN STD_LOGIC_VECTOR (4 downto 0);
			 SSEG: OUT STD_LOGIC_VECTOR (6 downto 0)
			 );
end GIAIMA_LED_7DOAN_ANODE_ENA;

--- architecture
architecture Behavioral of GIAIMA_LED_7DOAN_ANODE_ENA is
begin
		GIAIMA_7DOAN_ENA: ENTITY WORK.GIAIMA_7DOAN_ENA
			PORT MAP( SOGIAIMA => SW(3 downto 0),
						 SSEG => SSEG,
						 ENA => SW(4)
						 );
end Behavioral;