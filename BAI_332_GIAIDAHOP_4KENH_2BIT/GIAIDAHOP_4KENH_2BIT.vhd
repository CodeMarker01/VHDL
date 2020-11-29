---CHUONG TRINH CON MACH GIAI DA HOP 4 KENH 1 BIT----
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----entity----
entity GIAIDAHOP_4KENH_2BIT is
	Port ( I: IN STD_LOGIC_VECTOR (1 downto 0);
			 S: IN STD_LOGIC_VECTOR (1 downto 0);
			 OA,OB,OC,OD: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
end GIAIDAHOP_4KENH_2BIT;

---architecture---
architecture Behavioral of GIAIDAHOP_4KENH_2BIT is
	begin
		PROCESS(I,S)
			BEGIN
			CASE S IS
			WHEN "00" => OA <= I;  OB <= "00";  OC <="00"; OD <="00";
			WHEN "01" => OA <= "00";OB <=   I;  OC <="00"; OD <="00";
			WHEN "10" => OA <= "00";OB <= "00"; OC <= I;   OD <="00";
			WHEN "11" => OA <= "00";OB <= "00"; OC <="00"; OD <=I;
			WHEN OTHERS => NULL;
			END CASE;
	END PROCESS;
end Behavioral;