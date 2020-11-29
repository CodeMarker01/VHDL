-- CO THEM DP
--- CHUONG TRINH GIAI MA LED 7 DOAN ANODE CHUNG
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity
entity GIAIMA_LED_7DOAN_ANODE_ENA is
	Port ( SW: IN STD_LOGIC_VECTOR (5 downto 0);
			 SSEG: OUT STD_LOGIC_VECTOR (6 downto 0);
			 LED: OUT STD_LOGIC_VECTOR(1 downto 0));
end GIAIMA_LED_7DOAN_ANODE_ENA;

--- architecture
architecture Behavioral of GIAIMA_LED_7DOAN_ANODE_ENA is
begin
		GIAIMA_7DOAN_ENA: ENTITY WORK.GIAIMA_7DOAN_ENA
			PORT MAP( SOGIAIMA => SW(4 DOWnto 1),
						 SSEG => SSEG,
						 E => SW(0),
						 E_LED => LED(0),
						 DP => SW(5),
						 DP_LED => LED(1)
						 );
end Behavioral;
