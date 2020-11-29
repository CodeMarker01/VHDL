---2 MACH GIAI MA 3 SANG 8 NGO RA TÍCH CUC MUC CAO, 1 TIN HIEU CHO PHEP E, 1 TIN HIEU S CHON MUC TICH CUC NGO RA

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity GIAIMA_38_ES is
Port (SW: in STD_LOGIC_VECTOR (4 downto 0);
	  LED: out STD_LOGIC_VECTOR (7 downto 0));
end GIAIMA_38_ES;

---architecture---
architecture Behavioral of GIAIMA_38_ES is
	begin
		GIAIMA_38: ENTITY WORK.GIAIMA_38
			PORT MAP( I => SW(2 DOWNTO 0),
						 E => SW(3),
						 S => SW(4),
						 O => LED(7 DOWNTO 0));

end Behavioral;