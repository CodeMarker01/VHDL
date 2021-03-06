library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LED_SANGDON_PST is
	Port ( CKHT, RST: in STD_LOGIC;
			OE, ENA_DB: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR (11 downto 0));
end LED_SANGDON_PST;

architecture Behavioral of LED_SANGDON_PST is
SIGNAL X_REG, X_NEXT: STD_LOGIC_VECTOR (11 DOWNTO 0):= "000000000000"; --x
SIGNAL Y_REG, Y_NEXT: STD_LOGIC_VECTOR (11 DOWNTO 0):= "000000000000"; --y
SIGNAL DL_REG, DL_NEXT: INTEGER RANGE 0 TO 11:=11; -- dem luu
SIGNAL DC_REG, DC_NEXT: INTEGER RANGE 0 TO 11:=11; -- dem chay
Begin
	PROCESS (CKHT, RST)
	BEGIN
		IF RST='1' THEN X_REG <= (OTHERS=>'0');
							Y_REG <= (OTHERS=>'0');
							DL_REG <= 11;
							DC_REG <= 11;
		ELSIF FALLING_EDGE(CKHT) THEN X_REG <= X_NEXT;
												Y_REG <= Y_NEXT;
												DL_REG <= DL_NEXT;
												DC_REG <= DC_NEXT;
		END IF;
	END PROCESS;
	PROCESS(DC_REG, DL_REG, Y_REG, ENA_DB, X_REG, OE)
	BEGIN
		X_NEXT <= X_REG;
		Y_NEXT <= Y_REG;
		DL_NEXT <= DL_REG;
		DC_NEXT <= DC_REG;
		IF OE = '0' THEN X_NEXT <= (OTHERS=>'0');
								Y_NEXT <= (OTHERS=>'0');
								DL_NEXT <= 11;
								DL_NEXT <= 11;
		ELSIF ENA_DB = '1' THEN
			IF Y_REG = "000000000000" THEN Y_NEXT <= "000000000001";
			ELSIF DC_REG = 0 THEN X_NEXT <= X_REG OR Y_REG;
											Y_NEXT <= "000000000001";
											DL_NEXT <= DL_REG - 1;
											DC_NEXT <= DL_REG - 1;
			ELSIF DL_REG = 0 THEN X_NEXT <= (OTHERS => '0');
											Y_NEXT <= (OTHERS => '0');
											DL_NEXT <= 11;
											DC_NEXT <= 11;
				END IF;
			
		ELSE Y_NEXT <= Y_REG(10 DOWNTO 0) & '0';
					DC_NEXT <= DC_REG - 1;
			
		END IF;
	END PROCESS;
	Q <= X_REG OR Y_REG WHEN OE = '1' ELSE
	(OTHERS => '0');
end Behavioral;