----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:26 11/08/2017 
-- Design Name: 
-- Module Name:    CAI_4GIOIHAN - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CAI_4GIOIHAN IS
		PORT(		ENA_SS1, ENA_SS2, ENA_SS3, ENA_SS4: IN STD_LOGIC;
					Q_DKHIEN: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
END CAI_4GIOIHAN;

ARCHITECTURE BEHAVIORAL OF CAI_4GIOIHAN IS

--SIGNAL TAM1, TAM2, TAM3, TAM4: STD_LOGIC:= '0';

BEGIN

--		TAM1 <= '1' WHEN ENA_SS1 = '1' ELSE
--					'0' WHEN ( ENA_SS2 = '1' OR ENA_SS3 = '1' OR ENA_SS4 = '1') ELSE
--					'0';
--		TAM2 <= '1' WHEN ENA_SS2 = '1' ELSE
--					'0' WHEN ( ENA_SS1 = '1' OR ENA_SS3 = '1' OR ENA_SS4 = '1') ELSE
--					'0';
--		TAM3 <= '1' WHEN ENA_SS3 = '1' ELSE
--					'0' WHEN ( ENA_SS2 = '1' OR ENA_SS1 = '1' OR ENA_SS4 = '1') ELSE
--					'0';	
--		TAM4 <= '1' WHEN ENA_SS4 = '1' ELSE
--					'0' WHEN ( ENA_SS2 = '1' OR ENA_SS3 = '1' OR ENA_SS1 = '1') ELSE
--					'0';
--					
--		Q_DKHIEN <= "0000000011" WHEN TAM1 = '1' ELSE
--						"0000001000" WHEN TAM2 = '1' ELSE
--						"0000001101" WHEN TAM3 = '1' ELSE
--						"0000010010" WHEN TAM4 = '1' ELSE
--						"0000000011";	
						
				Q_DKHIEN <= "0000000011" WHEN ENA_SS1 = '1' ELSE
								"0000001000" WHEN ENA_SS2 = '1' ELSE
								"0000001101" WHEN ENA_SS3 = '1' ELSE
								"0000010010" WHEN ENA_SS4 = '1' ELSE
								"0000000011";	
END BEHAVIORAL;
