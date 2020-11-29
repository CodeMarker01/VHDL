Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DIEUKHIEN_CHOPHEP is
	Port ( CKHT,RST: in STD_LOGIC;
--			 ENA_DB_1, ENA_DB_2: IN STD_LOGIC;
				ENA_DB: IN STD_LOGIC;
				MODE: IN STD_LOGIC_VECTOR( 1 DOWNTO 0);
				OE: out STD_LOGIC_VECTOR (1 downto 0)
--				OE: out STD_LOGIC;
--				Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
				);
end DIEUKHIEN_CHOPHEP;
architecture Behavioral of DIEUKHIEN_CHOPHEP is
SIGNAL DEM_REG, DEM_NEXT: INTEGER RANGE 0 TO 10:=0;
--SIGNAL ENA_DB: STD_LOGIC;
begin
	PROCESS(CKHT,RST)
	BEGIN
	-- REGISTER FF-D
		IF (RST ='1') THEN DEM_REG <= 0; --Q <= (OTHERS => '0');
		ELSIF FALLING_EDGE(CKHT) THEN DEM_REG <= DEM_NEXT;
		END IF;
	END PROCESS;
	-- DEM DEN LAN 31 THI RESET NEU KO THI DEM TIEP
	DEM_NEXT <= 0 WHEN (DEM_REG = 10 AND ENA_DB = '1') OR MODE /= "10" ELSE
					DEM_REG + 1 WHEN ENA_DB = '1' ELSE
					DEM_REG;
	PROCESS(DEM_REG, RST)
	BEGIN
		OE <= "00";
		IF RST = '1' THEN OE <= "00";
		ELSIF DEM_REG < 6 THEN OE <= "01";
		ELSIF DEM_REG < 10 THEN OE <= "10";
		ELSE OE <= "00";
		END IF;
	END PROCESS;
end Behavioral;