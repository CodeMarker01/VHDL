---MACH DA HOP 4 KENH 1 BIT, TIN HIEU CHO PHEP E TICH CUC MUC 0---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity DAHOP_4KENH_1BIT_2OE is
	Port ( SW: in STD_LOGIC_VECTOR (6 downto 0);
			LED: out STD_LOGIC_VECTOR (1 downto 0));
end DAHOP_4KENH_1BIT_2OE;

----architecture---
architecture Behavioral of DAHOP_4KENH_1BIT_2OE is
	begin
		DAHOP_IF_INS: ENTITY WORK.DAHOP_IF_INS
			PORT MAP( I => SW(3 DOWNTO 0),
						 S => SW(5 DOWNTO 4),
						 E => SW(6),
						 O => LED(0));
		DAHOP_CASE_INS: ENTITY WORK.DAHOP_CASE_INS
			PORT MAP( I => SW(3 DOWNTO 0),
				       S => SW(5 DOWNTO 4),
						 E => SW(6),
						 O => LED(1));
end Behavioral;