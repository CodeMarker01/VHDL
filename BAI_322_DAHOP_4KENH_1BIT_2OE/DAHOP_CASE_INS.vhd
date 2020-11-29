--- CHUONG TRINH MACH DA HOP DUNG LENH CASE---

---LIBrary---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---ENTITY---
entity DAHOP_CASE_INS is
	Port ( I: IN STD_LOGIC_VECTOR (3 downto 0);
			 S: IN STD_LOGIC_VECTOR (1 downto 0);
			 E: IN STD_LOGIC;
			 O: OUT STD_LOGIC);
end DAHOP_CASE_INS;

---ARChitecture---
architecture Behavioral of DAHOP_CASE_INS is
	SIGNAL T: STD_LOGIC;
		begin
			PROCESS(I,E,S)
				begin
					CASE S IS
					WHEN "00" => T <=I(0);
					WHEN "01" => T <=I(1);
					WHEN "10" => T <=I(2);
					WHEN "11" => T <=I(3);
					WHEN OTHERS => NULL;
					END CASE;

					CASE E IS
					WHEN '0' 	=> O <= T;
					WHEN OTHERS => O <='0';
					END CASE;
					
			END PROCESS;
end Behavioral;