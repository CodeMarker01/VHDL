----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:03 09/26/2017 
-- Design Name: 
-- Module Name:    DEM_1BIT - Behavioral 
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
		Port (CKHT, RST, ENA_DB: in  STD_LOGIC;
				Q:out STD_LOGIC);	

end DEM_1BIT;

architecture Behavioral of DEM_1BIT is
SIGNAL 	Q_REG, Q_NEXT: STD_LOGIC;

begin
	PROCESS (CKHT, RST)
	BEGIN	
		IF 	RST='1' 	THEN 				Q_REG	<=	'0';	
		ELSIF	FALLING_EDGE (CKHT)  THEN  	Q_REG	<=	Q_NEXT;	
		END IF;
	END PROCESS;
	
	Q_NEXT <= 	NOT(Q_REG) WHEN ENA_DB = '1'	 ELSE
					Q_REG ; 
	Q	<= Q_REG;
end Behavioral;

