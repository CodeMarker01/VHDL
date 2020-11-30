----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:24:14 11/14/2017 
-- Design Name: 
-- Module Name:    DEM_1BIT_BTN1 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DEM_1BIT_BTN1 is
    Port ( 	CKHT, BTN_SS3, BTN_SS2, BTN_SS4:		in  	STD_LOGIC;
					BTN:		in  	STD_LOGIC;         
					Q:	out  	STD_LOGIC);

end DEM_1BIT_BTN1;

architecture Behavioral of DEM_1BIT_BTN1 is

SIGNAL 	ENA_D, ENA_BTN: STD_LOGIC;
Begin
DEBOUNCE_BTN_UD:	ENTITY WORK.DEBOUNCE_BTN
			PORT MAP (	CKHT		=>	CKHT, 	
							BTN		=> BTN,		
							DB_TICK	=> ENA_D); 

LAM_HEP_XUNG_SS:	ENTITY WORK.LAM_HEP_XUNG
			PORT MAP (	CKHT 		=>	CKHT, 	
							D			=> ENA_D,		
							Q  		=> ENA_BTN);
							
TAO_TT_SS:	ENTITY WORK.DEM_1BIT1
			PORT MAP (	CKHT 		=>	CKHT, 	
							ENA_DB	=> ENA_BTN,
							BTN_SS2		=> BTN_SS2,	
							BTN_SS3		=> BTN_SS3,	
							BTN_SS4		=> BTN_SS4,	
							Q  		=> Q);

END Behavioral;

