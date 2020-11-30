----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:38 09/17/2016 
-- Design Name: 
-- Module Name:    CHIA_10ENA - Behavioral 
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
entity CHIA_10ENA is
    Port ( CKHT : in  STD_LOGIC;
           ENA5HZ : out  STD_LOGIC);
end CHIA_10ENA;

architecture Behavioral of CHIA_10ENA is

CONSTANT N: INTEGER := 50000000;
SIGNAL D5HZ_REG, D5HZ_NEXT: INTEGER RANGE 0 TO N/5 :=1;
begin

--REGISTER					
		PROCESS(CKHT)
		BEGIN
				IF FALLING_EDGE (CKHT) THEN 
					D5HZ_REG <= D5HZ_NEXT;
					END IF;
		END PROCESS;
--NEXT STATE LOGIC
		D5HZ_NEXT <= 1 WHEN D5HZ_REG = N/5 ELSE
						 D5HZ_REG+1;						 
--OUTPUT LOGIC
		ENA5HZ <= '1' WHEN D5HZ_REG = N/(2*5) ELSE 
					'0';
end Behavioral;

