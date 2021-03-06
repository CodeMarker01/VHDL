LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DEM_4BIT_MODE5 IS
PORT(
		CKHT, RST, ENA_DB, ENA_SS: IN STD_LOGIC;
		Q_DKHIEN: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END DEM_4BIT_MODE5;

ARCHITECTURE BEHAVIORAL OF DEM_4BIT_MODE5 IS
SIGNAL Q_REG, Q_NEXT, Q_REG_TAM: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	PROCESS(CKHT)
	BEGIN
		IF RST ='1' THEN Q_REG <= (OTHERS => '0');
		ELSIF FALLING_EDGE(CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	
	Q_REG_TAM <= Q_REG;
	Q_NEXT <= 	"0000" WHEN Q_REG_TAM = "0110" ELSE
					Q_REG + 1 WHEN ENA_DB = '1'  AND ENA_SS= '0' ELSE
					Q_REG;
	
	Q 			<= Q_REG WHEN Q_DKHIEN = "10" ELSE
					"0000";
END BEHAVIORAL;

