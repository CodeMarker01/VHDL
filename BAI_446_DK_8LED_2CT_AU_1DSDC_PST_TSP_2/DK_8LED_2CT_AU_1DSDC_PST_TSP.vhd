-- CHUONG TRINH CHINH
--Thiết kế mạch điều khiển 8 led sáng với 2 chương trình: chương trình 1 có 1
--điểm sáng di chuyển từ phải sang trái, sau đó chương trình 2 di chuyển điểm sáng từ trái sang
--phải rồi lặp lại chương trình 1.
--Các tín hiệu vào gồm ckht, tín hiệu đồng bộ ena5hz, tín hiệu btn_n0 làm reset giống các bài
--trên.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DK_8LED_2CT_AU_1DSDC_PST_TSP is
	Port ( CKHT, BTN_N0: in STD_LOGIC;
				LED: out STD_LOGIC_VECTOR (7 downto 0));
	end DK_8LED_2CT_AU_1DSDC_PST_TSP;
architecture Behavioral of DK_8LED_2CT_AU_1DSDC_PST_TSP is
SIGNAL ENA_DB, RST: STD_LOGIC;
SIGNAL Q_DSDC_PST, Q_DSDC_TSP: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL OE: STD_LOGIC_VECTOR(1 DOWNTO 0);
Begin
	RST <= NOT BTN_N0;
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
					ENA5HZ => ENA_DB);
	LED_DSDC_PST: ENTITY WORK.LED_DSDC_PST
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					OE => OE(0),
					Q => Q_DSDC_PST);
	LED_DSDC_TSP: ENTITY WORK.LED_DSDC_TSP
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					OE => OE(1),
					Q => Q_DSDC_TSP);
	DIEUKHIEN_CHOPHEP: ENTITY WORK.DIEUKHIEN_CHOPHEP
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					OE => OE);
	LED <= Q_DSDC_PST OR Q_DSDC_TSP;
end Behavioral;