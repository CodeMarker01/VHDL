--- CHUONG TRINH CON GIAI MA LED 7 DOAN ANODE CHUNG CO ENABLE
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity
entity GIAIMA_7DOAN_ENA is
	Port ( SOGIAIMA: IN STD_LOGIC_VECTOR (3 downto 0);
			 SSEG: OUT STD_LOGIC_VECTOR (6 downto 0);
			 LED: OUT STD_LOGIC;
			 ENA: IN STD_LOGIC;
			 Dp: IN STD_LOGIC
			 );
end GIAIMA_7DOAN_ENA;


--- architecture
architecture Behavioral of GIAIMA_7DOAN_ENA is
signal Temp: std_LOGIC_VECTOR(6 downto 0);
signal Led_temp: std_logic;
begin
	PROCESS(SOGIAIMA,ENA, Dp)
		BEGIN
		CASE ENA IS
			WHEN '0' => ((SSEG <= Temp) & (LED <= led_temp));
			WHEN OTHERS => SSEG <= "1111111" && LED <= '0';
		END CASE;

		CASE SOGIAIMA IS
			WHEN X"0" => Temp <= "1000000"; --0
			 WHEN X"1" => Temp <= "1111001"; --1
			 WHEN X"2" => Temp <= "0100100"; --2
			 WHEN X"3" => Temp <= "0110000"; --3
			 WHEN X"4" => Temp <= "0011001"; --4
			 WHEN X"5" => Temp <= "0010010"; --5
			 WHEN X"6" => Temp <= "0000010"; --6
			 WHEN X"7" => Temp <= "1111000"; --7
			 WHEN X"8" => Temp <= "0000000"; --8
			 WHEN X"9" => Temp <= "0010000"; --9
			 WHEN X"A" => Temp <= "0001000"; --A
			 WHEN X"B" => Temp <= "0000011"; --B
			 WHEN X"C" => Temp <= "1000110"; --C
			 WHEN X"D" => Temp <= "0100001"; --D
			 WHEN X"E" => Temp <= "0000110"; --E
			 WHEN OTHERS => Temp <= "0001110"; --F 
		 END CASE;
		 
		CASE Dp IS
			WHEN '1' => Led_temp <= '1';
			WHEN OTHERS => led_temp <= '0';
		 END CASE;
		
		
		
	END PROCESS;
end behavioral;