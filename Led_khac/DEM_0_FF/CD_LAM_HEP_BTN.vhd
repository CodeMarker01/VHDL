----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:49:40 10/08/2016 
-- Design Name: 
-- Module Name:    CD_LAM_HEP_BTN - Behavioral 
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


entity CD_LAM_HEP_BTN is
    Port ( CKHT, BTN : in  STD_LOGIC;
           BTN_CDLH : OUT STD_LOGIC);
end CD_LAM_HEP_BTN;

architecture Behavioral of CD_LAM_HEP_BTN is
SIGNAL ENA_D: STD_LOGIC;
begin
DEBOUNCE_BTN: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP (	CKHT => CKHT,
					BTN => BTN,
					DB_TICK => ENA_D);
					
LAM_HEP_XUNG: ENTITY WORK.LAM_HEP_XUNG
	PORT MAP (	CKHT => CKHT,
					D => ENA_D,
					Q => BTN_CDLH);

end Behavioral;

