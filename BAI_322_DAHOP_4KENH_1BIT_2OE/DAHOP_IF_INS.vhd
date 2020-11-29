--CHUONG TRINH CON MACH DA HOP DUNG LENH IF---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity DAHOP_IF_INS is
	Port ( I: IN STD_LOGIC_VECTOR (3 downto 0);
			 S: IN STD_LOGIC_VECTOR (1 downto 0);
			 E: IN STD_LOGIC;
			 O: OUT STD_LOGIC);
end DAHOP_IF_INS;

---architecture---
architecture Behavioral of DAHOP_IF_INS is
	begin
		PROCESS(I,E,S)
			begin
			   
				IF    E='0' AND S="00" THEN O<=I(0);
				ELSIF E='0' AND S="01" THEN O<=I(1);
				ELSIF E='0' AND S="10" THEN O<=I(2);
				ELSIF E='0' AND S="11" THEN O<=I(3);
				ELSE 								 O<= '0';
				END IF;
		END PROCESS;
end Behavioral;