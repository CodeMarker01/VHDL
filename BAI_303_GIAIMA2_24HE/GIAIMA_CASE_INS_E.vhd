
---1 MACH GIAI MA 2 SANG 4 DUNG LENH CASE, CHUONG TRINH CON ----

--- library ---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity---
entity GIAIMA_CASE_INS_E is
	Port ( I: in  STD_LOGIC_VECTOR (1 downto 0);
			 E: in  STD_LOGIC;
			 O: out STD_LOGIC_VECTOR (3 downto 0));
end GIAIMA_CASE_INS_E;

---architecture---
architecture Behavioral of GIAIMA_CASE_INS_E is
	SIGNAL T: STD_LOGIC_VECTOR(3 DOWNTO 0);
		begin
			PROCESS(I,E)
				BEGIN
					CASE I IS
						 WHEN "00"	 => T <= "0001";
						 WHEN "01"	 => T <= "0010";
						 WHEN "10"   => T <= "0100";
						 WHEN OTHERS => T <= "1000";
					END CASE;
					
					CASE E IS
						 WHEN '1'	 => O <= T;
						 WHEN OTHERS => O <= "0000";
					END CASE;
			END PROCESS;
end Behavioral;
