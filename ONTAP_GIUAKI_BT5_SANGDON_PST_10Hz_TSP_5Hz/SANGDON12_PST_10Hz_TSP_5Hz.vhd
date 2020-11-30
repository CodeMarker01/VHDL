--Viết chương trình điều khiển 12 led chạy sáng dồn từ phải sang trái
--với tần số 10Hz, rồi sau đó chạy sáng dồn từ trái sang phải với tần số
--5Hz, và lặp lại.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SANGDON12_PST_10Hz_TSP_5Hz is
Port ( CKHT, BTN_N0: in STD_LOGIC;
		 LEDR: out STD_LOGIC_VECTOR (11 downto 0));
end SANGDON12_PST_10Hz_TSP_5Hz;

architecture Behavioral of SANGDON12_PST_10Hz_TSP_5Hz is
SIGNAL ENA_DB, RST, ENA_DB_PST, ENA_DB_TSP: STD_LOGIC;
signal Q_SD_PST, Q_SD_TSP: STD_LOGIC_VECTOR (11 downto 0);
SIGNAL OE: STD_LOGIC_VECTOR(1 DOWNTO 0);
begin
	RST <= NOT BTN_N0;
	
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
					ENA5HZ => ENA_DB_PST,
					ENA10HZ => ENA_DB_TSP);
	LED_SANGDON_PST: ENTITY WORK.LED_SANGDON_PST
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB_PST,
					OE => OE(0),
					Q => Q_SD_PST);
	LED_SANGDON_TSP: ENTITY WORK.LED_SANGDON_TSP
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB_TSP,
					OE => OE(1),
					Q => Q_SD_TSP);
	DIEUKHIEN_CHOPHEP: ENTITY WORK.DIEUKHIEN_CHOPHEP
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					OE => OE);
					
	LEDR <= Q_SD_PST OR Q_SD_TSP;
end Behavioral;