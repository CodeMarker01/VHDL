
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEM_4BIT_BTN_CACH_3 is
    Port ( 	CKHT,SW: 	in  	STD_LOGIC;
				BTN_N: 	in  	STD_LOGIC_VECTOR(3 downto 0);
				LEDR: 	out  	STD_LOGIC_VECTOR (7 downto 0)
			);
end DEM_4BIT_BTN_CACH_3;

architecture Behavioral of DEM_4BIT_BTN_CACH_3 is
SIGNAL ENA_DB,ENA1HZ,ENA2HZ,ENA5HZ,ENA10HZ,ENA20HZ,RST, BTN1,BTN2,BTN3,CD_BTN1,CD_BTN2,CD_BTN3,CD_SW: STD_LOGIC;
SIGNAL GT_CAI: 	STD_LOGIC_VECTOR(3 downto 0);
Begin

	RST 		<= NOT BTN_N(0);
	BTN1 		<= NOT BTN_N(1);
	BTN2 		<= NOT BTN_N(2);
	BTN3 		<= NOT BTN_N(3);

CD_LAM_HEP_BTN: ENTITY WORK.CD_LAM_HEP_BTN
		PORT MAP (CKHT=> CKHT,
					 BTN=> BTN1,
					 BTN_CDLH=>CD_BTN1
					);
CD_LAM_HEP_BTN1: ENTITY WORK.CD_LAM_HEP_BTN
		PORT MAP (CKHT=> CKHT,
					 BTN=> BTN2,
					 BTN_CDLH=>CD_BTN2
					);
CD_LAM_HEP_BTN2: ENTITY WORK.CD_LAM_HEP_BTN
		PORT MAP (CKHT=> CKHT,
					 BTN=> BTN3,
					 BTN_CDLH=>CD_BTN3
					);	
CD_LAM_HEP_BTN3: ENTITY WORK.CD_LAM_HEP_BTN
		PORT MAP (CKHT=> CKHT,
					 BTN=> NOT SW,
					 BTN_CDLH=>CD_SW
					);	
CHIA_10ENA:   ENTITY WORK.CHIA_10ENA
            PORT MAP (  CKHT   	=>  CKHT,   
                    	   ENA1HZ 	=>  ENA1HZ,
								ENA2HZ	=>ENA2HZ,
								ENA5HZ	=>ENA5HZ,
								ENA10HZ	=>ENA10HZ,
								ENA20HZ	=>ENA20HZ
								);

DEM_4BIT2 : ENTITY WORK.DEM_4BIT_DK
            PORT MAP (  CKHT  => 	CKHT, 
								RST=>RST,
								BTN_UP=>CD_BTN1,
								BTN_DW	=>	CD_BTN2,
								BTN_XUNG=> CD_SW,
								ENA1HZ=>ENA1HZ,
								ENA2HZ=>ENA2HZ,
								ENA5HZ=>ENA5HZ,
								ENA10HZ=>ENA10HZ,
								ENA20HZ=>ENA20HZ,
								ENA_DB => ENA_DB,
								Q   	=>  	GT_CAI);						
DEM_4BIT1 : ENTITY WORK.DEM_4BIT
            PORT MAP (  CKHT  => 	CKHT,   
								RST   =>  	RST,
								ENA_DB=> ENA_DB,
								
								GT_CAI=>GT_CAI,
								BTN_SS	=>		CD_BTN3,
								Q   	=>  	LEDR(3 DOWNTO 0));
	LEDR(7 DOWNTO 4)	<= GT_CAI;					
End Behavioral;


