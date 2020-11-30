----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:48 11/14/2017 
-- Design Name: 
-- Module Name:    NGUYENNHATMINH - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NGUYENNHATMINH is
    Port (  	CKHT, SW0 : in  STD_LOGIC;
					BTN_N: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
               SSEG: OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
					BELL: 	out  	STD_LOGIC;
               ANODE: OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)             
             );
end NGUYENNHATMINH;

architecture Behavioral of NGUYENNHATMINH is
SIGNAL	ENA_DB, ENA1KHZ, ENA_SS1, ENA_SS2,ENA_SS3,ENA_SS4, BTN_SS1,BTN_SS2,BTN_SS3,BTN_SS4: 	STD_LOGIC;
SIGNAL 	DONVI, CHUC, TRAM, DONVI_GH, CHUC_GH, TRAM_GH: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL 	DEM, GIOIHAN: STD_LOGIC_VECTOR (9 downto 0);
SIGNAL 	DAU_CHAM_8LED: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL 	ENA_GIAIMA_8LED: STD_LOGIC_VECTOR(7 DOWNTO 0);
Begin
		BELL   <= '1';
		BTN_SS1	<= NOT BTN_N(0);
		BTN_SS2	<= NOT BTN_N(1);
		BTN_SS3	<= NOT BTN_N(2);
		BTN_SS4	<= NOT BTN_N(3);
		
		DAU_CHAM_8LED	<=	X"FF";	
		ENA_GIAIMA_8LED <= X"33";

CHIA_10ENA:   ENTITY WORK.CHIA_10ENA
         PORT MAP (  CKHT   	=>  CKHT,   
							ENA5HZ 	=>  ENA_DB,
							ENA1KHZ 	=>  ENA1KHZ);

NUT_ENA_SS1: ENTITY WORK.DEM_1BIT_BTN1
			PORT MAP(	CKHT => CKHT,
							BTN_SS2 => BTN_SS2,
							BTN_SS3 => BTN_SS3,
							BTN_SS4 => BTN_SS4,
							BTN => BTN_SS1,
							Q => ENA_SS1);	
							
NUT_ENA_SS2: ENTITY WORK.DEM_1BIT_BTN1
			PORT MAP(	CKHT => CKHT,
							BTN_SS2 => BTN_SS1,
							BTN_SS3 => BTN_SS3,
							BTN_SS4 => BTN_SS4,
							BTN => BTN_SS2,
							Q => ENA_SS2);	

NUT_ENA_SS3: ENTITY WORK.DEM_1BIT_BTN1
			PORT MAP(	CKHT => CKHT,
							BTN_SS2 => BTN_SS1,
							BTN_SS3 => BTN_SS2,
							BTN_SS4 => BTN_SS4,
							BTN => BTN_SS3,
							Q => ENA_SS3);	

NUT_ENA_SS4: ENTITY WORK.DEM_1BIT_BTN1
			PORT MAP(	CKHT => CKHT,
							BTN_SS2 => BTN_SS1,
							BTN_SS3 => BTN_SS2,
							BTN_SS4 => BTN_SS3,
							BTN => BTN_SS4,
							Q => ENA_SS4);	
							
DEM_GH_53:        ENTITY WORK.DEM_4GIOIHAN
			PORT MAP (	CKHT		=>	CKHT,
							ENA_DB 	=> ENA_DB,
							GIOIHAN	=> GIOIHAN,
							ENA_SS1	=>	ENA_SS1,
							ENA_SS2	=>	ENA_SS2,
							ENA_SS3	=>	ENA_SS3,
							ENA_SS4	=>	ENA_SS4,
							DEM => DEM);		

CAI_GH:        ENTITY WORK.CAI_4GIOIHAN
			PORT MAP (	Q_DKHIEN	=> GIOIHAN,
							ENA_SS1	=>	ENA_SS1,
							ENA_SS2	=>	ENA_SS2,
							ENA_SS3	=>	ENA_SS3,
							ENA_SS4	=>	ENA_SS4);
							
HEXTOBCD:	ENTITY WORK.HEXTOBCD_10BIT
			PORT MAP (	SOHEX10BIT	=>	DEM,
						DONVI		=>	DONVI,
						CHUC		=>	CHUC,
						TRAM		=> TRAM);	

--HEXTOBCD_GH:	ENTITY WORK.HEXTOBCD_10BIT
--			PORT MAP (	SOHEX10BIT	=>	GIOIHAN,
--						DONVI		=>	DONVI_GH,
--						CHUC		=>	CHUC_GH,
--						TRAM		=> TRAM_GH);
							
HIENTHI_LED:	ENTITY WORK.GIAIMA_HIENTHI_8LED_7DOAN
			PORT MAP (	CKHT				=>	CKHT,
							ENA1KHZ 			=> ENA1KHZ,
							LED70				=>	DONVI,
							LED71				=>	CHUC,
							LED72				=>	X"F",
							LED73				=>	X"F",
							LED74				=>	X"3",
							LED75				=>	X"5",
							LED76				=>	X"F",
							LED77				=>	X"F",							
							DAU_CHAM_8LED	=>	DAU_CHAM_8LED,							
							ENA_GIAIMA_8LED =>	ENA_GIAIMA_8LED,
							ANODE	=>	ANODE,
							SSEG	=>	SSEG);
End Behavioral;

