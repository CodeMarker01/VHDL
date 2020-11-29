--- CHUONG TRINH CON MACH MA HOA UU TIEN 4 SANG 2 DUNG LENH GAN CO DIEU KIEN---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity MAHOA_CONDITIONAL_INS is
	Port ( I: in STD_LOGIC_VECTOR (3 downto 0);
			O: out STD_LOGIC_VECTOR (1 downto 0);
	    ACT: OUT STD_LOGIC);
end MAHOA_CONDITIONAL_INS;

---architecture---
architecture Behavioral of MAHOA_CONDITIONAL_INS is
	begin
		O <= "11" WHEN I(3) = '1' ELSE
			  "10" WHEN I(2) = '1' ELSE
		     "01" WHEN I(1) = '1' ELSE
		     "00";
	 ACT <= I(3) OR I(2) OR I(1) OR I(0);
end Behavioral;