----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:55:01 01/13/2015 
-- Design Name: 
-- Module Name:    GIAI_MA_HIENTHI_4LED_7DOAN - Behavioral 
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
entity GIAIMA_HIENTHI_8LED_7DOAN is
PORT  (		CKHT, ENA1KHZ:		IN  	STD_LOGIC;
				LED70, LED71, LED72, LED73: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
				LED74, LED75, LED76, LED77: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
				DAU_CHAM_8LED: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);				
				ENA_GIAIMA_8LED: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				ANODE:	OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
				SSEG:	OUT  STD_LOGIC_VECTOR(7 DOWNTO 0));
end GIAIMA_HIENTHI_8LED_7DOAN;

architecture Behavioral of GIAIMA_HIENTHI_8LED_7DOAN is
SIGNAL SEL_3B: STD_LOGIC_VECTOR(2 DOWNTO 0);

SIGNAL SO_GIAIMA: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DAU_CHAM_1LED,ENA_GIAIMA_1LED:STD_LOGIC;
begin

DEM_3BIT_CHON_8KENH:	ENTITY WORK.DEM_3BIT_CHON_8KENH
				PORT MAP (	ENA1KHZ	=>		ENA1KHZ,
								CKHT		=> 	CKHT,
								Q			=>		SEL_3B);
								
QUET_ANODE_8LED_7DOAN:	ENTITY WORK.QUET_ANODE_8LED_7DOAN
				PORT MAP (	SEL_3B	=>	SEL_3B,
								ANODE		=>	ANODE);
							
DAHOP_8KENH:	ENTITY WORK.DAHOP_8KENH
			PORT MAP (	SEL_3B	=>	SEL_3B,
							LED70		=>	LED70,
							LED71		=>	LED71,
							LED72		=>	LED72,
							LED73		=>	LED73,
							LED74		=>	LED74,
							LED75		=>	LED75,
							LED76		=>	LED76,
							LED77		=>	LED77,
							
							DAU_CHAM_8LED	=>	DAU_CHAM_8LED,							
							ENA_GIAIMA_8LED =>	ENA_GIAIMA_8LED,
							
							DAU_CHAM_1LED		=>	DAU_CHAM_1LED,
							ENA_GIAIMA_1LED	=>	ENA_GIAIMA_1LED,
							SO_GIAIMA			=>	SO_GIAIMA);

							
GIAIMA:	ENTITY WORK.GIAIMA_7DOAN_ENA
			PORT MAP (	SO_GIAIMA			=>	SO_GIAIMA,
							DAU_CHAM_1LED		=>	DAU_CHAM_1LED,
							ENA_GIAIMA_1LED	=>	ENA_GIAIMA_1LED,
							SSEG					=>	SSEG);
						
	
end Behavioral;

