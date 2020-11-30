----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:29:23 10/15/2017 
-- Design Name: 
-- Module Name:    NGUYENTHITHUMAI - Behavioral 
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

entity NGUYENTHITHUMAI is
    Port ( CKHT, BTN_N0 : in  STD_LOGIC;
				BELL : OUT  STD_LOGIC;
           LED_N : out  STD_LOGIC_VECTOR (3 downto 0));
end NGUYENTHITHUMAI;

architecture Behavioral of NGUYENTHITHUMAI is
SIGNAL LED : STD_LOGIC_VECTOR (3 downto 0); 
SIGNAL BTN1, ENA1HZ, ENA,  ENA2HZ, ENA4HZ, ENA8HZ, Y:STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR (1 downto 0);
begin
		BELL <= '1';
		BTN1 <= BTN_N0;
		LED_N <= NOT LED;
		
CD_LAM_HEP_BTN : ENTITY WORK.CD_LAM_HEP_BTN 
	PORT MAP ( CKHT => CKHT,
					BTN => BTN1,
					BTN_CDLH => ENA);
					
CHIA_10ENA : ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
					ENA1HZ => ENA1HZ,
					ENA2HZ => ENA2HZ,
					ENA4HZ => ENA4HZ,
					ENA8HZ => ENA8HZ);
					
DEM_2BIT : ENTITY WORK.DEM_2BIT
	PORT MAP ( CKHT => CKHT,
					ENA => ENA,
					Q => Q);
					
DAHOP_4BIT : ENTITY WORK.DAHOP_4BIT
	PORT MAP ( I(0) => ENA1HZ,
					I(1) => ENA2HZ,
					I(2) => ENA4HZ,
					I(3) => ENA8HZ,
					Y => Y,
					S => Q);
					
DEM_4BIT : ENTITY WORK.DEM_4BIT
		PORT MAP ( CKHT => CKHT,
						ENB => Y,
						O => LED);
					
end Behavioral;

