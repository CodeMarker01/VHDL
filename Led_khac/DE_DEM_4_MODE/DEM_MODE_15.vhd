----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:01 10/09/2017 
-- Design Name: 
-- Module Name:    DEM_MODE_15 - Behavioral 
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
ENTITY DEM_MODE_15 IS
	PORT(
				CKHT, BTN_N0: IN STD_LOGIC;
				LED_N: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END DEM_MODE_15;

ARCHITECTURE BEHAVIORAL OF DEM_MODE_15 IS
SIGNAL ENA_DB, RST: STD_LOGIC;
SIGNAL Q, LED: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
		BELL <= '1';
		LED_N <= NOT LED;
		RST <= NOT BTN_N0;
		CHIA_10ENA_1HZ_1MHZ: ENTITY WORK.CHIA_10ENA_1HZ_1MHZ
			PORT MAP(
							CKHT => CKHT,
							ENA1HZ => ENA_DB
			);
		DEM_4BIT: ENTITY WORK.DEM_4BIT_MODE10
			PORT MAP(
							CKHT => CKHT,
							RST => RST,
							ENA_DB => ENA_DB,
							Q => LED
			);
END BEHAVIORAL;

