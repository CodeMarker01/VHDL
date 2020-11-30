----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:37:10 10/31/2017 
-- Design Name: 
-- Module Name:    DEM_10BIT - Behavioral 
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

ENTITY DEM_10BIT IS
PORT(
			CKHT, RST, ENA_DB, ENA_SS: IN STD_LOGIC;
			DEM: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
);
END DEM_10BIT;

ARCHITECTURE BEHAVIORAL OF DEM_10BIT IS
SIGNAL DEM_REG, DEM_NEXT: STD_LOGIC_VECTOR(9 DOWNTO 0);
BEGIN
PROCESS(CKHT, RST)
BEGIN
	IF RST ='1' THEN DEM_REG <= (OTHERS => '0');
	ELSIF FALLING_EDGE(CKHT) THEN DEM_REG <= DEM_NEXT;
	END IF;
END PROCESS;
DEM_NEXT <= DEM_REG + 1 WHEN ENA_DB = '1' AND ENA_SS = '1' ELSE
				"0000000000" WHEN DEM_REG = "1111101000" ELSE         -- SO NAY LA 999+1
				DEM_REG;
DEM <= DEM_REG;
END BEHAVIORAL;
