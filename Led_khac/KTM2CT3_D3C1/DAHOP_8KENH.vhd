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
entity DAHOP_8KENH is
PORT  (		SEL_3B:		IN  	STD_LOGIC_VECTOR(2 DOWNTO 0);
				LED70, LED71, LED72, LED73: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
				LED74, LED75, LED76, LED77: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
				DAU_CHAM_8LED: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);				
				ENA_GIAIMA_8LED: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
								
				DAU_CHAM_1LED,ENA_GIAIMA_1LED: OUT STD_LOGIC;
				SO_GIAIMA: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end DAHOP_8KENH;

architecture Behavioral of DAHOP_8KENH is

BEGIN
	PROCESS(SEL_3B,LED70,LED71,LED72,LED73,LED74,LED75,LED76,LED77,
	DAU_CHAM_8LED,ENA_GIAIMA_8LED)
	BEGIN
		CASE SEL_3B  IS 
			WHEN 	"000"		=>	SO_GIAIMA 			<= LED70;										
			WHEN 	"001"		=>	SO_GIAIMA 			<= LED71;									
			WHEN 	"010"		=>	SO_GIAIMA 			<= LED72;									
			WHEN 	"011"		=>	SO_GIAIMA 			<= LED73;	
			WHEN 	"100"		=>	SO_GIAIMA 			<= LED74;								
			WHEN 	"101"		=>	SO_GIAIMA 			<= LED75;	
			WHEN 	"110"		=>	SO_GIAIMA 			<= LED76;									
			WHEN 	OTHERS	=>	SO_GIAIMA 			<= LED77;	
		END CASE;
	END PROCESS;

	PROCESS(SEL_3B,DAU_CHAM_8LED)
	BEGIN
		CASE SEL_3B  IS 
			WHEN 	"000"		=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(0);							
			WHEN 	"001"		=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(1);									
			WHEN 	"010"		=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(2);	
			WHEN 	"011"		=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(3);									
			WHEN 	"100"		=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(4);	
			WHEN 	"101"		=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(5);	
			WHEN 	"110"		=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(6);								
			WHEN 	OTHERS	=>	DAU_CHAM_1LED 		<=	DAU_CHAM_8LED(7);									
		END CASE;
	END PROCESS;

	PROCESS(SEL_3B,ENA_GIAIMA_8LED)
	BEGIN
		CASE SEL_3B  IS 
			WHEN 	"000"		=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(0);							
			WHEN 	"001"		=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(1);									
			WHEN 	"010"		=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(2);
			WHEN 	"011"		=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(3);									
			WHEN 	"100"		=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(4);
			WHEN 	"101"		=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(5);
			WHEN 	"110"		=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(6);									
			WHEN 	OTHERS	=>	ENA_GIAIMA_1LED	<=	ENA_GIAIMA_8LED(7);									
		END CASE;
	END PROCESS;
end Behavioral;

