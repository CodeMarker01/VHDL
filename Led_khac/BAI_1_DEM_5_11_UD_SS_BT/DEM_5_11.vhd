
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DEM_5_11 is
    Port ( CKHT, RST, ENA_DB, ENA_UD, ENA_SS : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_5_11;

architecture Behavioral of DEM_5_11 is
signal  Q_NEXT, Q_REG, Q_REG_TAM: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
	PROCESS(CKHT, RST)
	BEGIN
		IF RST ='1' THEN	Q_REG <= "0101";
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
------------------------------------------------
 Q_REG_TAM <= "0101" WHEN Q_REG = "1100" AND ENA_UD = '0' ELSE
				"1011" WHEN Q_REG = "0100" AND ENA_UD = '1' ELSE
				Q_REG;
------------------------------------------------
   Q_NEXT <= 	Q_REG_TAM + 1 WHEN (ENA_DB = '1' AND ENA_SS = '0' AND ENA_UD = '0')ELSE
					Q_REG_TAM - 1 WHEN (ENA_DB = '1' AND ENA_SS = '0' AND ENA_UD = '1')ELSE
					Q_REG_TAM;
-------------------------------
	Q <= Q_REG;
end Behavioral;

