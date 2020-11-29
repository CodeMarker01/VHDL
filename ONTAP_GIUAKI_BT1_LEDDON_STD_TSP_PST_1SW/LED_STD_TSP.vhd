--CĐ 1: 10 led sáng dần và tắt dần từ trái sang phải và lặp lại hiển thị
--(LEDR1 đến LEDR10)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LED_STD_TSP is
	Port ( CKHT, RST: in STD_LOGIC;
			OE, ENA_DB: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR (9 downto 0));
end LED_STD_TSP;

architecture Behavioral of LED_STD_TSP is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(9 DOWNTO 0);
Begin
	PROCESS (CKHT, RST)
	BEGIN
		IF RST='1' THEN Q_REG <= (OTHERS => '0');
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	Q_NEXT <= (OTHERS => '0') WHEN OE = '0' ELSE
	NOT Q_REG(0)& Q_REG(9 DOWNTO 1) WHEN ENA_DB = '1' ELSE
	Q_REG;
	Q <= Q_REG WHEN OE = '1' ELSE (OTHERS => '0');
end Behavioral;