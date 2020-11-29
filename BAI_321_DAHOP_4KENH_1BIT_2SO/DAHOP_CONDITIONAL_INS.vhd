--- CHUONG TRINH CON DA HOP DUNG LENH GAN CO DIEU KIEN---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity DAHOP_CONDITIONAL_INS is
	Port ( I: IN STD_LOGIC_VECTOR (3 downto 0);
			 S: IN STD_LOGIC_VECTOR (1 downto 0);
			 O: OUT STD_LOGIC);
end DAHOP_CONDITIONAL_INS;

---architecture---
architecture Behavioral of DAHOP_CONDITIONAL_INS is
	begin
	O <= I(0) WHEN S = "00" ELSE
		  I(1) WHEN S = "01" ELSE
		  I(2) WHEN S = "10" ELSE
		  I(3);
end Behavioral;