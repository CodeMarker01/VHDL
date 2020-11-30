----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:56:46 11/28/2014 
-- Design Name: 
-- Module Name:    DEM_4SO_BCD_GIAIMA_7DOAN - Behavioral 
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

entity DEM_1BIT is
    Port ( 	CKHT, ENA_DB, RST: in STD_LOGIC;
           	Q: out STD_LOGIC);
end DEM_1BIT;

architecture Behavioral of DEM_1BIT is
SIGNAL 	Q_REG, Q_NEXT: STD_LOGIC;
Begin
--REGISTER
	PROCESS (CKHT, RST)
	BEGIN	
		IF 	RST='1' 	THEN 	Q_REG	<=	'0';											
		ELSIF	FALLING_EDGE (CKHT) 	THEN  Q_REG	<=	Q_NEXT;	
		END IF;
	END PROCESS;
--NEXT STATE LOGIC		
		Q_NEXT <= NOT Q_REG WHEN ENA_DB = '1' ELSE Q_REG;
--OUTPUT LOGIC
		Q	<=	Q_REG;				
end Behavioral;

