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
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DEM_4BIT is
    Port ( CKHT, ENB: in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_4BIT;

architecture Behavioral of DEM_4BIT is
SIGNAL O_REG, O_NEXT: STD_LOGIC_VECTOR (3 downto 0);
--SIGNAL ENB :  STD_LOGIC;

begin
PROCESS(CKHT)
BEGIN
--IF RST = '1' THEN O_REG <= (OTHERS =>'0');
IF 	FALLING_EDGE (CKHT) THEN 	O_REG <= O_NEXT;
END IF;
END PROCESS;
O_NEXT <= O_REG +1 WHEN ENB ='1' ELSE
			O_REG;
O <= O_REG;

end Behavioral;

