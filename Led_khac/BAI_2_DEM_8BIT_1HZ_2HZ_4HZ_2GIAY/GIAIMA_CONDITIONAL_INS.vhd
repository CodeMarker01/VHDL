----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:13 08/29/2017 
-- Design Name: 
-- Module Name:    GIAIMA_CONDITIONAL_INS - Behavioral 
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


entity GIAIMA_CONDITIONAL_INS is
    Port ( ENA1HZ,ENA2HZ,ENA5HZ : in  STD_LOGIC;
           O : out  STD_LOGIC;
			  S : IN STD_LOGIC_VECTOR (1 downto 0)
			  );
end GIAIMA_CONDITIONAL_INS;

architecture Behavioral of GIAIMA_CONDITIONAL_INS is

begin		
		O <= 	ENA1HZ WHEN S="00" ELSE
				ENA2HZ WHEN S="01" ELSE
				ENA5HZ;
				
end Behavioral;

