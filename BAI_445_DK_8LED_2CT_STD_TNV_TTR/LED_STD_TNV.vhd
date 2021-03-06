library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LED_STD_TNV is
	Port ( CKHT, RST: in STD_LOGIC;
			OE, ENA_DB: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR (7 downto 0));
end LED_STD_TNV;

architecture Behavioral of LED_STD_TNV is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(7 DOWNTO 0);
Begin
	PROCESS (CKHT, RST)
	BEGIN
		IF RST='1' THEN Q_REG <= (OTHERS => '0');
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	Q_NEXT <= (OTHERS => '0') WHEN OE = '0' ELSE
	NOT Q_REG(4)& Q_REG(7 DOWNTO 5) & Q_REG(2 DOWNTO 0) & NOT Q_REG(3) WHEN ENA_DB = '1' ELSE
	Q_REG;
	Q <= Q_REG WHEN OE = '1' ELSE (OTHERS => '0');
end Behavioral;