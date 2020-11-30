----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:17 09/19/2017 
-- Design Name: 
-- Module Name:    STATE_DKHIEN - Behavioral 
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

ENTITY STATE_DKHIEN IS
		PORT(
					CKHT,RST: IN STD_LOGIC;
					DK_STATE: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
					STATE: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
					Q_DKHIEN: OUT STD_LOGIC
		);
END STATE_DKHIEN;

ARCHITECTURE BEHAVIORAL OF STATE_DKHIEN IS
SIGNAL Q_REG, Q_NEXT: STD_LOGIC;
SIGNAL TAM: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	PROCESS(CKHT,RST)
	BEGIN
		IF RST ='1' THEN Q_REG <= '0';
		ELSIF FALLING_EDGE(CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
TAM <= "1010" WHEN DK_STATE="10" ELSE
			"1111";
Q_NEXT <= '1' WHEN STATE=TAM ELSE
			 '0' WHEN STATE="0000" ELSE
			 Q_REG;
Q_DKHIEN <= Q_REG;
END BEHAVIORAL;