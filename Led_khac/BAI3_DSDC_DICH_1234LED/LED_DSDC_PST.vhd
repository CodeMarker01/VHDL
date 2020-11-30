----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:55:01 07/03/2017 
-- Design Name: 
-- Module Name:    LED_DSDC_PST - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity LED_DSDC_PST is
    Port ( CKHT, RST, ENA_DB : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end LED_DSDC_PST;

architecture Behavioral of LED_DSDC_PST is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(15 DOWNTO 0);
begin
	PROCESS(CKHT, RST)
	BEGIN
		IF RST = '1' THEN 				Q_REG <= b"0000_0000_0000_1000";
		ELSIF FALLING_EDGE(CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	
	Q_NEXT <= b"0000_0000_0000_1100" WHEN Q_REG(15 DOWNTO 11) = "00010" ELSE
				 b"0000_0000_0000_1110" WHEN Q_REG(15 DOWNTO 11) = "00110" ELSE
				 b"0000_0000_0000_1111" WHEN Q_REG(15 DOWNTO 11) = "01110" ELSE
				 b"0000_0000_0000_1000" WHEN Q_REG(15 DOWNTO 11) = "11110" ELSE
				 Q_REG(14 DOWNTO 0) & Q_REG(15) WHEN ENA_DB = '1' ELSE
				 Q_REG;
	Q <= Q_REG(11 DOWNTO 4);

end Behavioral;

