
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DK_8LED_STD_PST is
    Port ( CKHT, BTN_N0,BTN_N1 : in  STD_LOGIC;	
			  SW: IN STD_LOGIC_VECTOR(2 downto 0);
           LEDR : out  STD_LOGIC_VECTOR (7 downto 0));
end DK_8LED_STD_PST;

architecture Behavioral of DK_8LED_STD_PST is
SIGNAL ENA_DB, RST,DK,CD: STD_LOGIC;
SIGNAL OE: STD_LOGIC := '1';
SIGNAL SO_LED: STD_LOGIC_VECTOR(3 DOWnto 0);
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
			PORT MAP( CKHT   =>  CKHT,
							RST =>  RST,
							SW=>SW,
						 ENA_DB	=>  CD,
						 SO_LED=>SO_LED
			);
LED_STD_PST: ENTITY WORK.LED_STD_PST          
            PORT MAP (  CKHT  	=> CKHT,   
								ENA_DB	=>  ENA_DB,
								RST   	=>  RST,
								SO_LED   =>SO_LED,
								OE  		=>  OE,
								Q     	=>  LEDR);
end Behavioral;

