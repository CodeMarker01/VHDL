---2 MACH GIAI MA 2 SANG 4 DUONG NGO RA TICH CUC MUC CAO---
---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity GIAIMA_24H_2IC is
	Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
			 Led: out STD_LOGIC_VECTOR (7 downto 0));
   end GIAIMA_24H_2IC ;

---architecture---
architecture Behavioral of GIAIMA_24H_2IC  is
	begin
		GIAIMA_IF_INS: ENTITY WORK.GIAIMA_IF_INS
			PORT MAP( I => SW(1 DOWNTO 0),
						 O => LED(3 DOWNTO 0));
		GIAIMA_CASE_INS: ENTITY WORK.GIAIMA_CASE_INS
			PORT MAP( I => SW(3 DOWNTO 2),
			          O => LED(7 DOWNTO 4));
  end Behavioral;