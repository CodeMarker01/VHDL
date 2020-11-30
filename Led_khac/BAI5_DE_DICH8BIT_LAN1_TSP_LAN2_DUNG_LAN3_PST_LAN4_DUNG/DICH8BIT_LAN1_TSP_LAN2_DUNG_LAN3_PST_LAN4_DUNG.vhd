
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DICH8BIT_LAN1_TSP_LAN2_DUNG_LAN3_PST_LAN4_DUNG is
    Port ( 	CKHT 		: in  STD_LOGIC;
				BTN_N		: in	STD_LOGIC_VECTOR (1 downto 0);
				BELL		: out STD_LOGIC;
				LED_N 	: out STD_LOGIC_VECTOR (7 downto 0));
end DICH8BIT_LAN1_TSP_LAN2_DUNG_LAN3_PST_LAN4_DUNG;

architecture Behavioral of DICH8BIT_LAN1_TSP_LAN2_DUNG_LAN3_PST_LAN4_DUNG is

SIGNAL ENA_DB, RST, BTN_MODE: STD_LOGIC;
signal LED: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL Q_PST,Q_TSP: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL S: STD_LOGIC_VECTOR (1 downto 0);
begin

	BELL     <= '1';
	RST 		<= NOT BTN_N(0);
	LED_N    <=  not LED;
	BTN_MODE <= NOT BTN_N(1);
	
CHIA_10ENA_1HZ_1MHZ:   ENTITY WORK.CHIA_10ENA_1HZ_1MHZ
            PORT MAP (  CKHT   =>  CKHT,   
                    	   ENA5HZ =>  ENA_DB);

LED_STD_PST: ENTITY WORK.LED_STD_PST          
            PORT MAP (  CKHT  	=> CKHT,   
								ENA_DB	=>  ENA_DB,
								RST   	=>  RST,
								OE  		=>  S,
								Q     	=>  Q_PST);

LED_STD_TSP: ENTITY WORK.LED_STD_TSP          
            PORT MAP (  CKHT  	=> CKHT,   
								ENA_DB	=>  ENA_DB,
								RST   	=>  RST,
								OE  		=>  S,
								Q     	=>  Q_TSP);
								
DEM_2BIT_BTN : ENTITY WORK.DEM_2BIT_BTN
            PORT MAP (  CKHT  => 	CKHT,   
								RST   =>  	RST,
								BTN	=>		BTN_MODE,
								Q   	=>  	S);
								
LED <= Q_PST OR Q_TSP;		

end Behavioral;

