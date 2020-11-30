----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:57 11/08/2017 
-- Design Name: 
-- Module Name:    DEM_4GIOIHAN - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DEM_4GIOIHAN IS
PORT(
			CKHT, ENA_DB, ENA_SS1, ENA_SS3,ENA_SS2,ENA_SS4: IN STD_LOGIC;
			DEM: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			GIOIHAN: IN STD_LOGIC_VECTOR(9 DOWNTO 0));
END DEM_4GIOIHAN;

ARCHITECTURE BEHAVIORAL OF DEM_4GIOIHAN IS
SIGNAL DEM_NEXT: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL DEM_REG: STD_LOGIC_VECTOR(9 DOWNTO 0):= "0000000011";

BEGIN
		PROCESS(CKHT)
		BEGIN
			IF FALLING_EDGE(CKHT) THEN DEM_REG <= DEM_NEXT;
			END IF;
		END PROCESS;
		
	PROCESS(DEM_REG, ENA_DB, ENA_SS1, ENA_SS2, ENA_SS3, ENA_SS4)
	BEGIN
		DEM_NEXT 	<= DEM_REG;			
		IF ENA_DB = '1' THEN 
			IF ( ENA_SS1 = '1' OR ENA_SS2 = '1' OR ENA_SS3 = '1' OR ENA_SS4 = '1')  THEN 
				IF DEM_REG = "0000110101" THEN 	DEM_NEXT <= GIOIHAN	;	
				ELSE									DEM_NEXT <= DEM_REG + 1;		
				END IF;
			END IF;
		END IF;
	END PROCESS;
DEM <= DEM_REG;
END BEHAVIORAL;
