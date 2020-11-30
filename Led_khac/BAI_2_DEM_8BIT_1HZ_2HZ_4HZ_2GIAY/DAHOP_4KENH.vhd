----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:23 09/02/2017 
-- Design Name: 
-- Module Name:    DAHOP_4KENH - Behavioral 
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

entity DAHOP_4KENH is
    Port ( SW : in  STD_LOGIC_VECTOR (7 downto 0);
           BTN_N : in  STD_LOGIC_VECTOR (1 downto 0);
           BELL : out  STD_LOGIC;
           LED_N : out  STD_LOGIC_VECTOR (1 downto 0));
end DAHOP_4KENH;

architecture Behavioral of DAHOP_4KENH is
SIGNAL LED: STD_LOGIC_VECTOR (1 downto 0);
SIGNAL BTN: STD_LOGIC_VECTOR (1 downto 0);
begin
		BELL <= '1';
		LED_N <= NOT LED;    -- nam muoi tEn NHu vay vi led_n la ngo ra
		BTN <= NOT BTN_N;			-- nam muoi tEn NHu vay vi btn_n la ngo vao
	DAHOP_IF_INS: ENTITY WORK.DAHOP_4KENH_2BIT
		PORT MAP ( 	IA => SW( 1 DOWNTO 0),
						IB => SW( 3 DOWNTO 2),
						IC => SW( 5 DOWNTO 4),
						ID => SW( 7 DOWNTO 6),
						S => BTN,
						O => LED
					);
end Behavioral;

