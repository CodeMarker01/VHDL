----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:52 10/06/2017 
-- Design Name: 
-- Module Name:    DEM_2BIT_TAM - Behavioral 
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

entity DEM_2BIT_TAM is
    Port (CKHT, RST, ENA_DB: in  STD_LOGIC;
    		Q:    out    STD_LOGIC_VECTOR(1 DOWNTO 0));
end DEM_2BIT_TAM;

architecture Behavioral of DEM_2BIT_TAM is
SIGNAL 	Q_REG, Q_NEXT : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL SOSANH: STD_LOGIC;
BEGIN
	PROCESS (CKHT, RST)
	BEGIN	
		IF 	RST='1' 	THEN 				Q_REG	<=	(OTHERS => '0');	
												--SOSANH <= '0';
		ELSIF	FALLING_EDGE (CKHT)  THEN  	Q_REG	<=	Q_NEXT;	
		END IF;
	END PROCESS;
	SOSANH <= '1' WHEN Q_REG = "00" OR Q_REG = "01" ELSE '0';
	Q_NEXT <= 	Q_REG + 1 WHEN ENA_DB = '1' AND SOSANH = '1'  ELSE
					Q_REG ;  
	Q	<=			Q_REG;
end Behavioral;


