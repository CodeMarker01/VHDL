library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--SANG TAT DAN TU TRONG RA
entity LED_STD_TTR is
	Port ( CKHT, RST: in STD_LOGIC;
			OE, ENA_DB: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR (7 downto 0));
end LED_STD_TTR;

architecture Behavioral of LED_STD_TTR is
SIGNAL Q_REG, Q_NEXT,Q_SD,Q_TD: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DEM_REG, DEM_NEXT: INTEGER RANGE 0 TO 7:=0;
Begin

	PROCESS(CKHT,RST)
	BEGIN
		IF (RST ='1') THEN DEM_REG <= 0;
		ELSIF FALLING_EDGE(CKHT) THEN DEM_REG <= DEM_NEXT;
		END IF;
	END PROCESS;
	DEM_NEXT <= 0 WHEN DEM_REG = 7 AND ENA_DB = '1' ELSE
	DEM_REG + 1 WHEN ENA_DB = '1' ELSE
	DEM_REG;
	
	PROCESS (CKHT, RST)
	BEGIN
		IF RST='1' THEN Q_REG <= (OTHERS => '0');
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	
	-- Q SANG DAN TRONG RA
	Q_SD <= Q_REG(6 DOWNTO 4)&'1'&'1'&Q_REG(3 DOWNTO 1) WHEN ENA_DB = '1' ELSE
	Q_REG;
	-- Q TAT DAN TRONG RA
	Q_TD <= Q_REG(6 DOWNTO 4)&'0'&'0'&Q_REG(3 DOWNTO 1) WHEN ENA_DB = '1' ELSE
	Q_REG;
	
	Q_NEXT <= (OTHERS => '0') WHEN OE = '0' ELSE
				Q_SD 				  WHEN DEM_REG<5 ELSE
				Q_TD;				  
	
	Q <= Q_REG WHEN OE = '1' ELSE (OTHERS => '0');
end Behavioral;