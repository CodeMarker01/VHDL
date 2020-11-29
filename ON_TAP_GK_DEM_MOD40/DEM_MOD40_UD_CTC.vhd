-- CHUONG TRINH CON
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DEM_8BIT_SS_UD is
Port ( CKHT, RST, ENA_DB, ENA_SS, ENA_UD: in STD_LOGIC;
		 Q: out STD_LOGIC_VECTOR (7 downto 0));
end DEM_8BIT_SS_UD;
architecture Behavioral of DEM_8BIT_SS_UD is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL TEMP_Q_REG : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
	PROCESS (CKHT, RST)
		BEGIN
		-- NEU RESET = 1 THI GAN NGO RA = 0
			IF RST='1' THEN Q_REG <= (OTHERS => '0');
			ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
			ELSE 
		END IF;
	END PROCESS;
	TEMP_Q_REG <= Q_REG + 1 WHEN ENA_UD = '1' ELSE
					  Q_REG - 1;

	Q_NEXT <= TEMP_Q_REG WHEN ENA_DB = '1' AND ENA_SS='1' ELSE
				 Q_REG;
	Q <= Q_REG;
end Behavioral;-- CHUONG TRINH CON
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DEM_MOD40_UD_CTC is
Port ( CKHT, RST, ENA_DB, ENA_SS, ENA_UD: in STD_LOGIC;
		 Q: out STD_LOGIC_VECTOR (5 downto 0));
end DEM_MOD40_UD_CTC;
architecture Behavioral of DEM_MOD40_UD_CTC is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL TEMP_Q_REG : STD_LOGIC_VECTOR (5 DOWNTO 0);
BEGIN
	PROCESS (CKHT, RST)
		BEGIN
		-- NEU RESET = 1 THI GAN NGO RA = 0
			IF RST='1' THEN Q_REG <= (OTHERS => '0');
			ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
			ELSE 
		END IF;
	END PROCESS;
	TEMP_Q_REG <= (OTHERS => '0') WHEN  Q_REG = "100111" AND ENA_UD = '1' ELSE
					  "101000" WHEN Q_REG = "000000" AND ENA_UD = '0' ELSE
					  Q_REG + 1 WHEN ENA_UD = '1' ELSE
					  Q_REG - 1;

	Q_NEXT <= TEMP_Q_REG WHEN ENA_DB = '1' AND ENA_SS='1' ELSE
				 Q_REG;
	Q <= Q_REG;
end Behavioral;