--- CHUONG TRINH CON MACH MA HOA UU TIEN DUNG LENH IF---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity MAHOA_IF_INS is
	Port ( I: IN  STD_LOGIC_VECTOR (3 downto 0);
	       E: IN  STD_LOGIC;
			 O: OUT STD_LOGIC_VECTOR (1 downto 0);
		  ACT: OUT STD_LOGIC);
end MAHOA_IF_INS;

---architecture---
architecture Behavioral of MAHOA_IF_INS is
	begin
		PROCESS(I,E)
			BEGin
				IF    E='1' AND I(3)='1' THEN O<="11";
				ELSIF E='1' AND I(2)='1' THEN O<="10";
				ELSIF E='1' AND I(1)='1' THEN O<="01";
				ELSE                          O<="00";
				END IF;
		END PROCESS;
	
	ACT <= I(3) OR I(2) OR I(1) OR I(0);
end Behavioral;