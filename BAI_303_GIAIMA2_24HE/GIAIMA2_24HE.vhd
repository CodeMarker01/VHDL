---2 MACH GIAI MA 2 SANG 4 NGO RA TÍCH CUC MUC CAO, 1 TIN HIEU CHO PHEP E
--- MOI MACH DUNG LENH IF VA LENH CASE----

--- library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity---
entity GIAIMA2_24HE is
	Port ( SW: in  STD_LOGIC_VECTOR (5 downto 0);
			LED: out STD_LOGIC_VECTOR (7 downto 0)
			);
end GIAIMA2_24HE;

--- architecture---
architecture Behavioral of GIAIMA2_24HE is
	begin
		GIAIMA_IF_INS_E: ENTITY WORK.GIAIMA_IF_INS_E
			PORT MAP( I => SW(1 DOWNTO 0),
			          E => SW(2),
						 O => LED(3 DOWNTO 0));
		GIAIMA_CASE_INS_E: ENTITY WORK.GIAIMA_CASE_INS_E
			PORT MAP( I => SW(4 DOWNTO 3),
						 E => SW(5),
						 O => LED(7 DOWNTO 4));
end Behavioral;
