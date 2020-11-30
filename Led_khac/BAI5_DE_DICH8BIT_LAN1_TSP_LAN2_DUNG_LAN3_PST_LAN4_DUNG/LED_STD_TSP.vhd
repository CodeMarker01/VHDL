----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:37 10/03/2017 
-- Design Name: 
-- Module Name:    LED_STD_TSP - Behavioral 
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

entity LED_STD_TSP is
    Port (	CKHT, RST, ENA_DB:   in      STD_LOGIC;
				OE 					: IN STD_LOGIC_VECTOR (1 downto 0);
				Q:      out     STD_LOGIC_VECTOR (7 downto 0));
end LED_STD_TSP;

architecture Behavioral of LED_STD_TSP is
SIGNAL 	Q_REG, Q_NEXT: STD_LOGIC_VECTOR(7 DOWNTO 0);
Begin
   PROCESS (CKHT, RST)
   BEGIN   
		IF  RST='1'             THEN    	Q_REG	<=	(OTHERS => '0'); 
      ELSIF   FALLING_EDGE (CKHT)   THEN    Q_REG	<=	Q_NEXT;	
		END IF;
	END PROCESS;
	
	Q_NEXT  <=  (OTHERS => '0')							WHEN OE = "10" ELSE
					NOT Q_REG(0) & Q_REG(7 DOWNTO 1)   	WHEN ENA_DB = '1' AND OE = "11" ELSE	
					Q_REG;
					
	Q <= Q_REG WHEN OE = "11" ELSE (OTHERS => '0'); 
      
end Behavioral;
