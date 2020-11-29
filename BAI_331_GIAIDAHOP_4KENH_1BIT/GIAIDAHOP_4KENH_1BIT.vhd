--- CHUONG TRINH CON MACH GIAI DA HOP 4 KENH 1 BIT DUNG LENH CASE---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity GIAIDAHOP_4KENH_1BIT is
	Port ( I: IN STD_LOGIC;
			 S: IN STD_LOGIC_VECTOR (1 downto 0);
			 O: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
end GIAIDAHOP_4KENH_1BIT;

---architecture---
architecture Behavioral of GIAIDAHOP_4KENH_1BIT is
	begin
		PROCESS(I,S)
			BEGIN
			CASE S IS
			WHEN "00" => O <= "000"& I;
			WHEN "01" => O <= "00"& I &'0';
			WHEN "10" => O <= '0'&I&"00";
			WHEN "11" => O <= I&"000";
			WHEN OTHERS => NULL;
		END CASE;
	END PROCESS;
end Behavioral;