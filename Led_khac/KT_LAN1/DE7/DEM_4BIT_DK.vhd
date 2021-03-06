
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEM_4BIT_DK is
    Port (CKHT, BTN_UP,BTN_DW: in  STD_LOGIC;
    		Q:    out    STD_LOGIC_VECTOR (3 downto 0));
end DEM_4BIT_DK;

architecture Behavioral of DEM_4BIT_DK is
SIGNAL 	Q_REG, Q_NEXT: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	PROCESS (CKHT )
	BEGIN	
		
		IF	FALLING_EDGE (CKHT)  THEN  	Q_REG	<=	Q_NEXT;	
		END IF;
	END PROCESS;
	
	Q_NEXT <= 	"0011" WHEN BTN_UP = '1'	AND Q_REG="1111" ELSE
					Q_REG+1 WHEN BTN_UP = '1' ELSE
					"1111" WHEN BTN_DW = '1'	AND Q_REG="0011" ELSE
					Q_REG -1 WHEN BTN_DW = '1'	 ELSE
					Q_REG ; 					
	Q	<= Q_REG;
end Behavioral;

