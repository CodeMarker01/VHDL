
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DK_8LED_STD_PST_TSP is
    Port ( CKHT, BTN_N0,BTN_N1 : in  STD_LOGIC;	
           LEDR : out  STD_LOGIC_VECTOR (7 downto 0));
end DK_8LED_STD_PST_TSP;

architecture Behavioral of DK_8LED_STD_PST_TSP is
SIGNAL ENA_DB, RST,DK,CD,SS: STD_LOGIC;
SIGNAL Q1,Q2: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL PST_TSP: STD_LOGIC_VECTOR(1 DOWNTO 0);
Begin
	RST <= NOT BTN_N0;
	DK <=  NOT BTN_N1;
CD_LAM_HEP_BTN: ENTITY WORK.CD_LAM_HEP_BTN
		PORT MAP (CKHT=> CKHT,
					 BTN=> DK,
					 BTN_CDLH=>CD
					);
CHIA_10ENA:   ENTITY WORK.CHIA_10ENA
            PORT MAP (  CKHT   =>  CKHT,   
                    	   ENA1HZ =>  ENA_DB);
DEM_8BIT: ENTITY WORK.DEM_8BIT
			PORT MAP( CKHT    =>  CKHT,
						 RST 	   =>  RST,
						 ENA_DB	=>  CD,
						 SS		=>SS,
						 PST_TSP=>PST_TSP
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
LEDR<= Q1 WHEN PST_TSP ="01" ELSE
		 Q2 WHEN PST_TSP ="10" ELSE
		(OTHERS => '0');	
		 	 
end Behavioral;

