--- CHUONG TRINH GIAI MA LED 7 DOAN ANODE CHUNG
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity
entity GIAIMA_LED_7DOAN_ANODE is
	Port ( SW: IN STD_LOGIC_VECTOR (3 downto 0);
			 SSEG: OUT STD_LOGIC_VECTOR (6 downto 0));
end GIAIMA_LED_7DOAN_ANODE;

--- architecture
architecture Behavioral of GIAIMA_LED_7DOAN_ANODE is
begin
		GIAIMA_7DOAN: ENTITY WORK.GIAIMA_7DOAN
			PORT MAP( SOGIAIMA => SW,
						 SSEG => SSEG
						 );
end Behavioral;
