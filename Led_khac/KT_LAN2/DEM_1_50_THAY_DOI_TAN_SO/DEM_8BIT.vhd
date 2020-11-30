
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEM_6BIT is
    Port ( CKHT, RST, ENA_DB : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (5 downto 0));
end DEM_6BIT;

architecture Behavioral of DEM_6BIT is
signal Q_REG, Q_NEXT: STD_LOGIC_VECTOR(5 DOWNTO 0);
begin
PROCESS(CKHT, RST)
	BEGIN
		IF RST ='1' THEN	Q_REG <= "000001";
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	
	Q_NEXT <= 	"000001" WHEN Q_REG ="110010" ELSE
					Q_REG + 1 WHEN ENA_DB = '1' ELSE
					Q_REG;
	Q <= Q_REG;
end Behavioral;

