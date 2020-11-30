----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:25 09/19/2017 
-- Design Name: 
-- Module Name:    DEM_8BIT - Behavioral 
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

entity DEM_8BIT is
		PORT(
					CKHT, RST, ENA_DB, ENA_SS, ENA_UD: IN STD_LOGIC;
					STATE: OUT STD_LOGIC;
					Q: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
end DEM_8BIT;

architecture Behavioral of DEM_8BIT is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
	PROCESS(CKHT, RST)
	BEGIN
		IF RST ='1' THEN Q_REG <= (OTHERS => '0');
		ELSIF FALLING_EDGE(CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;

	Q_NEXT <= 	Q_REG + 1 WHEN (ENA_DB = '1') AND (ENA_SS= '1') AND (ENA_UD = '0')ELSE
					Q_REG - 1 WHEN (ENA_DB = '1') AND (ENA_SS= '1') AND (ENA_UD = '1')ELSE
					Q_REG;
	Q <= Q_REG;
	STATE <= '1' WHEN Q_REG="1010" ELSE
			'0';

end Behavioral;

