-- CHUONG TRINH CON
--- CHUONG TRINH CON GIAI MA 7 DOAN ANODE CHUNG
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity
entity GIAIMA_7DOAN_ENA is
	Port ( SOGIAIMA: IN STD_LOGIC_VECTOR (3 downto 0);
			 SSEG: OUT STD_LOGIC_VECTOR (6 downto 0);
			 E: IN STD_LOGIC;
			 E_LED: OUT STD_LOGIC;
			 DP: IN STD_LOGIC;
			 DP_LED: OUT STD_LOGIC);
end GIAIMA_7DOAN_ENA;

--- architecture
architecture Behavioral of GIAIMA_7DOAN_ENA is
begin
	PROCESS(SOGIAIMA)
		BEGIN
		CASE E IS
			WHEN '0' => SSEG <= "1111111"; E_LED <= '0';DP_LED <= '0';
			WHEN OTHERS => E_LED <= '1'; DP_LED <= DP;
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
			END CASE;
	END PROCESS;
end behavioral;