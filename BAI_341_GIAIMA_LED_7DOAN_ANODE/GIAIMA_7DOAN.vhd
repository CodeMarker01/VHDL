--- CHUONG TRINH CON GIAI MA 7 DOAN ANODE CHUNG
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity
entity GIAIMA_7DOAN is
	Port ( SOGIAIMA: IN STD_LOGIC_VECTOR (3 downto 0);
			 SSEG: OUT STD_LOGIC_VECTOR (6 downto 0));
end GIAIMA_7DOAN;

--- architecture
architecture Behavioral of GIAIMA_7DOAN is
begin
	PROCESS(SOGIAIMA)
		BEGIN
		CASE SOGIAIMA IS
			WHEN X"0" => SSEG <= "1000000"; --0
			 WHEN X"1" => SSEG <= "1111001"; --1
			 WHEN X"2" => SSEG <= "0100100"; --2
			 WHEN X"3" => SSEG <= "0110000"; --3
			 WHEN X"4" => SSEG <= "0011001"; --4
			 WHEN X"5" => SSEG <= "0010010"; --5
			 WHEN X"6" => SSEG <= "0000010"; --6
			 WHEN X"7" => SSEG <= "1111000"; --7
			 WHEN X"8" => SSEG <= "0000000"; --8
			 WHEN X"9" => SSEG <= "0010000"; --9
			 WHEN X"A" => SSEG <= "0001000"; --A
			 WHEN X"B" => SSEG <= "0000011"; --B
			 WHEN X"C" => SSEG <= "1000110"; --C
			 WHEN X"D" => SSEG <= "0100001"; --D
			 WHEN X"E" => SSEG <= "0000110"; --E
			 WHEN OTHERS => SSEG <= "0001110"; --F 
		 END CASE;
	END PROCESS;
end behavioral;