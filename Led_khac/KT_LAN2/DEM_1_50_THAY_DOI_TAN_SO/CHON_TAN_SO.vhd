
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CHON_TAN_SO is
    Port ( CKHT, RST : in  STD_LOGIC;
           CHUC, DONVI : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Q : out  STD_LOGIC_VECTOR(1 DOWNTO 0));
end CHON_TAN_SO;

architecture Behavioral of CHON_TAN_SO is

SIGNAL Q_REG, Q_NEXT : STD_LOGIC_VECTOR(1 DOWNTO 0);
begin

	PROCESS(CKHT, RST)
	BEGIN
		IF RST ='1' THEN	Q_REG <= "00";
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
----------------------------------------------
Q_NEXT <= "00" WHEN CHUC = X"0" AND DONVI = X"1" ELSE 
			 "01" WHEN CHUC = X"1" AND DONVI = X"0" ELSE 
			 "10" WHEN CHUC = X"2" AND DONVI = X"0" ELSE 
			 "11" WHEN CHUC = X"3" AND DONVI = X"0" ELSE 
			 Q_REG;
Q <= Q_REG;
end Behavioral;

