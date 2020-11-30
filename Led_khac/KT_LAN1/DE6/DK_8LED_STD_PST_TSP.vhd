
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DK_8LED_STD_PST_TSP is
    Port ( CKHT, BTN_N0,BTN_N1,BTN_N2,BTN_N3 : in  STD_LOGIC;	
           LEDR : out  STD_LOGIC_VECTOR (7 downto 0);
			  LEDG :OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
end DK_8LED_STD_PST_TSP;

architecture Behavioral of DK_8LED_STD_PST_TSP is
SIGNAL  RST,BTN1,BTN2,BTN3,CD_BTN1,CD_BTN2,CD_BTN3 :STD_LOGIC;
SIGNAL  ENA1HZ,ENA5HZ,ENA_DB: STD_LOGIC;
SIGNAL Q1,Q2: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HUONG,SS: STD_LOGIC;
Begin
	RST <= NOT BTN_N0;
	BTN1 <=  NOT BTN_N1;
	BTN2 <=  NOT BTN_N2;
	BTN3 <=  NOT BTN_N3;

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

CHIA_10ENA:   ENTITY WORK.CHIA_10ENA
            PORT MAP (  CKHT   =>  CKHT,   
                    	   ENA1HZ =>  ENA1HZ,
								ENA5HZ=>ENA5HZ);
DEM_8BIT: ENTITY WORK.DEM_8BIT
			PORT MAP( CKHT    =>  CKHT,
						 RST 	   =>  RST,
						 BTN1		=>  CD_BTN1,
						 BTN2		=>  CD_BTN2,
						 BTN3 	=>  CD_BTN3,
						 ENA1HZ =>ENA1HZ,
						 ENA5HZ => ENA5HZ,
						 ENA_DB=> ENA_DB,
						 SS=>SS,
						 HUONG=>HUONG,
						 LED_HUONG=> LEDG(0),
						 LED_XUNG=> LEDG(1)
						 
			);
LED_STD_PST: ENTITY WORK.LED_STD_PST          
            PORT MAP (  CKHT  	=> CKHT,   
								ENA_DB	=>  ENA_DB,
								RST   	=>  RST,
								NGUNG =>SS,
								OE  		=>  '1',
								Q     	=>  Q1);
LED_STD_TSP: ENTITY WORK.LED_STD_TSP          
            PORT MAP (  CKHT  	=> CKHT,   
								ENA_DB	=>  ENA_DB,
								RST   	=>  RST,
								NGUNG =>SS,
								OE  		=>  '1',
								Q     	=>  Q2);
LEDR<= Q1 WHEN HUONG ='0' ELSE
		 Q2 WHEN HUONG ='1' ELSE
		(OTHERS => '0');	
		 	 
end Behavioral;

