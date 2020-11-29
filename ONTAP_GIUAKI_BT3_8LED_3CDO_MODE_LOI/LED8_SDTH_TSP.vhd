-- SÁNG DẦN TẮT HẾT
-- Chương trình có 9 trạng thái: 8 trạng thái led sáng dần. 1 TT led tắt hết
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LED8_SDTH_TSP is
	Port ( CKHT, RST: in STD_LOGIC;
			ENA_DB: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR (7 downto 0));
end LED8_SDTH_TSP;

architecture Behavioral of LED8_SDTH_TSP is
SIGNAL Q_REG, Q_NEXT,Q_TAM: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DEM_REG, DEM_NEXT: INTEGER RANGE 0 TO 10:=0;
Begin
	PROCESS (CKHT, RST)
	BEGIN
		IF RST='1' THEN Q_REG <= (OTHERS => '0');
							 DEM_REG <=0;
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
												 DEM_REG <= DEM_NEXT;
		END IF;
	END PROCESS;
	
	DEM_NEXT <= 0 WHEN DEM_REG = 8 AND ENA_DB ='1' ELSE	
				DEM_REG + 1 WHEN ENA_DB ='1' ELSE
				DEM_REG;
	
	Q_TAM <= NOT Q_REG(0) & Q_REG(7 DOWNTO 1)WHEN ENA_DB = '1' ELSE
				 Q_REG;
				 
	
	PROCESS (DEM_REG)
	BEGIN
		IF DEM_REG <8 THEN Q_NEXT <= Q_TAM;
		ELSIF DEM_REG = 8 THEN Q_NEXT <= (OTHERS => '0');
		END IF;
		
	END PROCESS;
	
	
----------------------	

	Q <= Q_REG ;
end Behavioral;