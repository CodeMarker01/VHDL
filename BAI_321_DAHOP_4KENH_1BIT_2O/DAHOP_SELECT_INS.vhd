---CHUONG TRINH CON DA HOP DUNG LENH GAN CO LUA CHON---

----library---

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---library---
entity DAHOP_SELECT_INS is
	Port ( I: IN STD_LOGIC_VECTOR (3 downto 0);
			 S: IN STD_LOGIC_VECTOR (1 downto 0);
			 O: OUT STD_LOGIC);
end DAHOP_SELECT_INS;

----architecture---
architecture Behavioral of DAHOP_SELECT_INS is
	begin
		WITH S SELECT
			O <= I(0) WHEN "00",
				  I(1) WHEN "01",
				  I(2) WHEN "10",
				  I(3) WHEN OTHERS;
end Behavioral;