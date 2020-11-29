
---1 MACH GIAI MA 2 SANG 4 DUNG LENH IF, CHUONG TRINH CON ----

--- library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity---
entity GIAIMA_IF_INS_E is
	Port ( I: in  STD_LOGIC_VECTOR (1 downto 0);
			 E: in  STD_LOGIC;
			 O: out STD_LOGIC_VECTOR (3 downto 0));
end GIAIMA_IF_INS_E;

--- architecture---
architecture Behavioral of GIAIMA_IF_INS_E is
SIGNAL EI: STD_LOGIC_VECTOR (2 downto 0);
	begin
	EI<=E&I;
		PROCESS(EI)
			BEGIN
				
				IF    EI="100"  THEN O <= "0001";
				ELSIF EI="101"  THEN O <= "0010";
				ELSIF EI="110"  THEN O <= "0100";
				ELSIF EI="111"  THEN O <= "1000";
				ELSE                 O <= "0000";
			
			END IF;
		END PROCESS;
end Behavioral;

