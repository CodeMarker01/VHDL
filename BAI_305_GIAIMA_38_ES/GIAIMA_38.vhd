
--- CHUONG TRINH CON MACH GIAI MA 3 SANG 8

--- library ---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity---
entity GIAIMA_38 is
	Port ( I: in  STD_LOGIC_VECTOR (2 downto 0);
		  E,S: in  STD_LOGIC;
			 O: out STD_LOGIC_VECTOR (7 downto 0));
end GIAIMA_38;


---architecture---
architecture Behavioral of GIAIMA_38 is
	SIGNAL A, B: STD_LOGIC_VECTOR(7 DOWNTO 0);

		begin
			PROCESS(I,E,S)
				BEGIN
					CASE I IS
						 WHEN "000"	 => A <= "00000001";
						 WHEN "001"	 => A <= "00000010";
						 WHEN "010"  => A <= "00000100";
						 WHEN "011"  => A <= "00001000";
						 WHEN "100"  => A <= "00010000";
						 WHEN "101"  => A <= "00100000";
						 WHEN "110"  => A <= "01000000";
						 WHEN "111"  => A <= "10000000";
						 WHEN OTHERS => NULL;
					END CASE;
					
					CASE E IS
						 WHEN '1'	 => B <= A;
						 WHEN OTHERS => B <= "00000000";
					END CASE;
					
					CASE S IS
					    WHEN '0'    => O <= B;
						 WHEN OTHERS => O <= NOT B;
				   END CASE;
						 
			END PROCESS;
end Behavioral;
