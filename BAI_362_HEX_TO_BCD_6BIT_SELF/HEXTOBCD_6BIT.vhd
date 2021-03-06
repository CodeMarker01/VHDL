-- CHUONG TRINH CON HEX 6 BIT -> BCD
-- CHUONG TRINH CON HEX 4 BIT -> BCD
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity HEXTOBCD_6BIT is
Port ( 	SOHEX6BIT: in STD_LOGIC_VECTOR (5 downto 0);
			DONVI, CHUC: out STD_LOGIC_VECTOR (3 downto 0));
end HEXTOBCD_4BIT;
architecture Behavioral of HEXTOBCD_6BITBIT is
BEGIN
	PROCESS (SOHEX6BIT)
	-- so hex 6 bit, bcd 2 so 8 bit
	-- => toi da la 14bit
	VARIABLE BCD_HEX: STD_LOGIC_VECTOR(13 DOWNTO 0);
	-- hex 4 bit => toi da loop x3
	VARIABLE DEM: INTEGER RANGE 0 TO 3 ;
	
	BEGIN
		BCD_HEX:= "00000000" & SOHEX6BIT;
		DEM:= 3;
		WHILE DEM > 0
		LOOP
			BCD_HEX:= BCD_HEX(10 DOWNTO 0) & BCD_HEX(11);
			DEM:= DEM - 1;
			-- DONVI
			-- NEU DONVI >= 5 -> +3
			IF BCD_HEX(7 DOWNTO 4)>= "0101" THEN
				BCD_HEX(7 DOWNTO 4):= BCD_HEX(7 DOWNTO 4)+"0011";
			END IF;
			-- CHUC
			-- NEU CHUC >= 5 -> +3
			IF BCD_HEX(11 DOWNTO 8)>= "0101" THEN
				BCD_HEX(11 DOWNTO 8):= BCD_HEX(11 DOWNTO 8)+"0011";
			END IF;
		END LOOP;
		BCD_HEX:= BCD_HEX(10 DOWNTO 0) & '0';
		DONVI <= BCD_HEX(7 DOWNTO 4);
		CHUC <= BCD_HEX(11 DOWNTO 8);
	END PROCESS;
end Behavioral;