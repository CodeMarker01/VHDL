-- CHUONG TRINH CON
-- ENA_DB : 
-- ENA_SS : CHO PHEP DEM HAY NGUNG DEM
-- ENA_UD : CHO PHEP DEM LEN HAY DEM XUONG
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DEM_8BIT_SS_UD_AUTO is
-- BO ENA_UD
Port ( CKHT, RST, ENA_DB, ENA_SS: in STD_LOGIC;
		 Q: out STD_LOGIC_VECTOR (7 downto 0));
end DEM_8BIT_SS_UD_AUTO;
architecture Behavioral of DEM_8BIT_SS_UD_AUTO is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL TEMP_Q_REG : STD_LOGIC_VECTOR (7 DOWNTO 0);
--SIGNAL TEMP_COUNT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ENA_UD : STD_LOGIC;
BEGIN
	PROCESS (CKHT, RST)
		BEGIN
		-- NEU RESET = 1 THI GAN NGO RA = 0
			IF RST='1' THEN Q_REG <= (OTHERS => '0');
			ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
			ELSE 
		END IF;
	END PROCESS;
	ENA_UD <= '0' WHEN Q_REG = "11111111" ELSE
				  '1' WHEN Q_REG = "00000000";
--	PROCESS (Q_REG)
--	BEGIN
--		IF Q_REG="11111111" THEN TMP <='0';
--		ELSIF Q_REG="00000000" THEN TMP <='1';
--		END IF;
--	END PROCESS;
	
	TEMP_Q_REG <= Q_REG + 1 WHEN ENA_UD = '1' ELSE
					  Q_REG - 1;

	Q_NEXT <= TEMP_Q_REG WHEN ENA_DB = '1' AND ENA_SS='1' ELSE
				 Q_REG;
	Q <= Q_REG;
end Behavioral;