----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:47 09/26/2017 
-- Design Name: 
-- Module Name:    DEM_2BIT - Behavioral 
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

entity DEM_2BIT is
    Port (CKHT, RST, ENA_DB: in  STD_LOGIC;
    		Q:    out    STD_LOGIC);
end DEM_2BIT;

architecture Behavioral of DEM_2BIT is
SIGNAL 	Q_REG, Q_NEXT, Q_REG_TAM: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	PROCESS (CKHT, RST)
	BEGIN	
		IF 	RST='1' 	THEN 				Q_REG	<=	(OTHERS => '0');	
		ELSIF	FALLING_EDGE (CKHT)  THEN  	Q_REG	<=	Q_NEXT;	
		END IF;
	END PROCESS;
	
	Q_REG_TAM <= "00" WHEN Q_REG= "10" ELSE Q_REG;
	Q_NEXT <= 	Q_REG_TAM + 1 WHEN ENA_DB = '1'	 ELSE
					Q_REG_TAM ; 
	Q	<= '1' WHEN Q_REG = "10" ELSE '0';
end Behavioral;

