--- CHUONG TRINH CON MACH MA HOA UU TIEN 4 SANG 2 DUNG LENH GAN CO LUA CHON---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity MAHOA_SELECT_INS is
	Port ( I: in STD_LOGIC_VECTOR (3 downto 0);
			 O: out STD_LOGIC_VECTOR (1 downto 0);
	     ACT: OUT STD_LOGIC);
	end MAHOA_SELECT_INS;

---architecture---
architecture Behavioral of MAHOA_SELECT_INS is
	begin
		WITH I SELECT
		O <= "11" WHEN "1111"|"1110"|"1101"|"1100"|"1011"|"1010"|"1001"|"1000",
			  "10" WHEN "0111"|"0110"|"0101"|"0100",
		     "01" WHEN "0011"|"0010",
		     "00" WHEN OTHERS;
	 ACT <= I(3) OR I(2) OR I(1) OR I(0);
end Behavioral;