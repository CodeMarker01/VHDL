----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:35 11/14/2017 
-- Design Name: 
-- Module Name:    DEM_1BIT1 - Behavioral 
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

entity DEM_1BIT1 is
    Port ( 	CKHT, ENA_DB, BTN_SS2, BTN_SS3, BTN_SS4: in STD_LOGIC;
           	Q: out STD_LOGIC);
end DEM_1BIT1;

architecture Behavioral of DEM_1BIT1 is
SIGNAL 	Q_REG, Q_NEXT: STD_LOGIC;
Begin
--REGISTER
	PROCESS (CKHT)
	BEGIN	
		IF 	( BTN_SS2='1' OR BTN_SS3='1' OR BTN_SS4='1')	THEN 	Q_REG	<=	'0';											
		ELSIF	FALLING_EDGE (CKHT) 	THEN  Q_REG	<=	Q_NEXT;	
		END IF;
	END PROCESS;
--NEXT STATE LOGIC		
		Q_NEXT <= NOT Q_REG WHEN ENA_DB = '1' ELSE Q_REG;
--OUTPUT LOGIC
		Q	<=	Q_REG;				
end Behavioral;

