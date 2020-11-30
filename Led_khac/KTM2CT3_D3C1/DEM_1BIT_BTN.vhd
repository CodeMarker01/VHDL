----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:59 01/11/2015 
-- Design Name: 
-- Module Name:    DEBOUNCE_SW - Behavioral 
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
entity DEM_1BIT_BTN is
    Port ( 	CKHT, RST:		in  	STD_LOGIC;
		BTN:		in  	STD_LOGIC;         
		Q:	out  	STD_LOGIC);

end DEM_1BIT_BTN;

architecture Behavioral of DEM_1BIT_BTN is

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
							
TAO_TT_SS:	ENTITY WORK.DEM_1BIT
			PORT MAP (	CKHT 		=>	CKHT, 	
							ENA_DB	=> ENA_BTN,
							RST		=> RST,							
							Q  		=> Q);

END Behavioral;


