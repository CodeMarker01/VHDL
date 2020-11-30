----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:04 09/18/2016 
-- Design Name: 
-- Module Name:    DEM_4BIT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DEM_2BIT is
    Port ( CKHT,  ENA : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (1 downto 0));
end DEM_2BIT;

architecture Behavioral of DEM_2BIT is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR (1 downto 0);

begin
PROCESS(CKHT)
BEGIN
--IF RST = '1' THEN Q_REG <= (others=>'0');
IF 	FALLING_EDGE (CKHT) THEN 	Q_REG <= Q_NEXT;
END IF;
END PROCESS;
Q_NEXT <= Q_REG + 1  WHEN ENA ='1' ELSE
			Q_REG;
Q <= Q_REG;

end Behavioral;

