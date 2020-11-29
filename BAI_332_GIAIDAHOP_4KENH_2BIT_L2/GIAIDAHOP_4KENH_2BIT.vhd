-- CHUONG TRINH CON
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GIAIDAHOP_4KENH_1BIT is
 Port ( I: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 S: IN STD_LOGIC_VECTOR (1 downto 0);
 E: IN STD_LOGIC;
 E_LED: OUT STD_LOGIC;
 OA,OB,OC,OD: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
end GIAIDAHOP_4KENH_1BIT;
architecture Behavioral of GIAIDAHOP_4KENH_1BIT is
begin
PROCESS(I,S,E)
 BEGIN
	CASE E IS
		WHEN '0' => OA <= "00";  OB <= "00";  OC <="00"; OD <="00";E_LED <= '0';
		WHEN OTHERS => E_LED <= '1';
			CASE S IS
				WHEN "00" => OA <= I;  OB <= "00";  OC <="00"; OD <="00";
				WHEN "01" => OA <= "00";  OB <= I;  OC <="00"; OD <="00";
				WHEN "10" => OA <= "00";  OB <= "00";  OC <=I; OD <="00";
				WHEN "11" => OA <= "00";  OB <= "00";  OC <="00"; OD <=I;
				WHEN OTHERS => NULL;
			END CASE;
	END CASE;
 END PROCESS;
end Behavioral;