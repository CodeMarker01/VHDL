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
					MODE: IN STD_LOGIC;
					Q_DKHIEN: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
END STATE_DKHIEN;

ARCHITECTURE BEHAVIORAL OF STATE_DKHIEN IS
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	PROCESS(CKHT,RST)
	BEGIN
		IF RST ='1' THEN Q_REG <= "00";
		ELSIF FALLING_EDGE(CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;

	Q_NEXT <= 	"00" WHEN Q_REG= "11" ELSE
					Q_REG + 1 WHEN MODE = '1' ELSE
					Q_REG;
	
Q_DKHIEN <= Q_REG;
END BEHAVIORAL;