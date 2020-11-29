---MACH MA HOA UU TIEN 4 NGO VAO CO TINHIEU CHO PHEP E----

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity MAHOAUUTIEN_42HE is
	Port ( SW: in STD_LOGIC_VECTOR (7 downto 0);
			LED: out STD_LOGIC_VECTOR (5 downto 0));
end MAHOAUUTIEN_42HE;

---architecture---
architecture Behavioral of MAHOAUUTIEN_42HE is
	begin
		MAHOA_IF_INS: ENTITY WORK.MAHOA_IF_INS
			PORT MAP( I => SW(3 DOWNTO 0),
						 E => SW(4),
						 O => LED(1 DOWNTO 0),
					  ACT => LED(2));
end Behavioral;