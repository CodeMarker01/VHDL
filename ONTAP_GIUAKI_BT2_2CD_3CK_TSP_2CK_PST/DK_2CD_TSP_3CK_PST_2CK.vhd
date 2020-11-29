--Bài tập 2
--Thiết kế mạch chạy trên led đơn có 2 chế độ như sau:
--• CĐ 1: 10 led sáng dần và tắt hết từ trái sang phải và lặp lại hiển thị
--(LEDR0 đến LEDR9) tần số 5Hz
--• CĐ 2: 5 led sáng dần và tắt dần từ phải sang trái và lặp lại hiển thị
--(LEDR9 đến LEDR5) tần số 2Hz
--• Khi reset mạch chạy CĐ1 3 chu kỳ rồi chuyển sang CĐ2 chạy 2 chu kỳ
--rồi dừng lại.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DK_2CD_TSP_3CK_PST_2CK is
	Port ( CKHT, BTN_N0 : in STD_LOGIC;
				LEDR: out STD_LOGIC_VECTOR (9 downto 0));
end DK_2CD_TSP_3CK_PST_2CK;

architecture Behavioral of DK_2CD_TSP_3CK_PST_2CK is
SIGNAL ENA_DB, RST, ENA_DB_1, ENA_DB_2: STD_LOGIC;
SIGNAL Q_STD_TSP: STD_LOGIC_VECTOR (9 downto 0);
SIGNAL Q_STD_PST: STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL OE: STD_LOGIC_VECTOR(1 DOWNTO 0);
Begin
RST <= NOT BTN_N0;
CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
					ENA5HZ => ENA_DB_1,
					ENA2HZ => ENA_DB_2);
LED5_STD_PST: ENTITY WORK.LED_STD_PST
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB_2,
					OE => OE(1),
					Q => Q_STD_PST);
LED10_STD_TSP: ENTITY WORK.LED_STD_TSP
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB_1,
					OE => OE(0),
					Q => Q_STD_TSP);
DIEUKHIEN_CHOPHEP: ENTITY WORK.DIEUKHIEN_CHOPHEP
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB_1 => ENA_DB_1,
					ENA_DB_2 => ENA_DB_2,
					OE => OE);
LEDR <= ("00000"&Q_STD_PST) OR Q_STD_TSP;
end Behavioral;