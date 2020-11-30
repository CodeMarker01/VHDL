library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEM_MODE is
		PORT(
					CKHT: IN STD_LOGIC;
					BTN_N: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
					BELL: OUT STD_LOGIC;
					LED_N: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
end DEM_MODE;

architecture Behavioral of DEM_MODE is

SIGNAL ENA_DB, RST, ENA_SS, BTN_SS, BTN_MODE, ENA_MODE: STD_LOGIC;
SIGNAL Q_DKHIEN: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LED, Q_15, Q_10, Q_5: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

		BELL <= '1';
		LED_N <= NOT LED;
		RST <= NOT BTN_N(0);
		BTN_SS <= NOT BTN_N(1);
		BTN_MODE <= NOT BTN_N(2);
		
		CHIA_10ENA_1HZ_1MHZ: ENTITY WORK.CHIA_10ENA_1HZ_1MHZ
			PORT MAP(
							CKHT 		=> CKHT,
							ENA2HZ 	=> ENA_DB
			);		
		DEM_4BIT_MODE10: ENTITY WORK.DEM_4BIT_MODE10
			PORT MAP(
							CKHT 		=> CKHT,
							RST 		=> RST,
							ENA_DB 	=> ENA_DB,
							ENA_SS	=> ENA_SS,
							Q_DKHIEN => Q_DKHIEN,
							Q 			=> Q_10
			);

		DEM_4BIT_MODE15: ENTITY WORK.DEM_4BIT_MODE15
			PORT MAP(
							CKHT 		=> CKHT,
							RST 		=> RST,
							ENA_DB 	=> ENA_DB,
							ENA_SS	=> ENA_SS,
							Q_DKHIEN => Q_DKHIEN,
							Q 			=> Q_15
			);
			
		DEM_4BIT_MODE5: ENTITY WORK.DEM_4BIT_MODE5
			PORT MAP(
							CKHT 		=> CKHT,
							RST 		=> RST,
							ENA_DB 	=> ENA_DB,
							ENA_SS	=> ENA_SS,
							Q_DKHIEN => Q_DKHIEN,
							Q => Q_5
			);
			
		STATE_DKHIEN: ENTITY WORK.STATE_DKHIEN
			PORT MAP(
							CKHT 		=> CKHT,
							RST 		=> RST,
							MODE 		=> ENA_MODE,
							Q_DKHIEN => Q_DKHIEN					
						);	
						
		DEM_1BIT_BTN_SS : ENTITY WORK.DEM_1BIT_BTN
			PORT MAP (  CKHT  	=> 	CKHT,   
							RST   	=>  	RST,
							BTN		=>		BTN_SS,
							Q   		=>  	ENA_SS);
							
		CD_LAM_HEP_BTN_MODE:   ENTITY WORK.CD_LAM_HEP_BTN
            PORT MAP (  CKHT    => CKHT,   
                        BTN     => BTN_MODE,        
                        BTN_CDLH => ENA_MODE);  
								
		LED <= Q_10 OR Q_15 OR Q_5;
		
end Behavioral;

