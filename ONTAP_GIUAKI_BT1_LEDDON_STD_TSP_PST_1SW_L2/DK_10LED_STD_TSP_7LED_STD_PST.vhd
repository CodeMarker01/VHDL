--Bài tập 1
--Thiết kế mạch chạy trên led đơn có 2 chế độ như sau:
--CĐ 1: 10 led sáng dần và tắt dần từ trái sang phải và lặp lại hiển thị
--(LEDR1 đến LEDR10)
--CĐ 2: 7 led sáng dần và tắt dần từ phải sang trái và lặp lại hiển thị
--(LEDR9 đến LEDR3)
--Sử dụng 1 SW để chuyển giữa 2 chế độ.

-- 8 LED SANG TAT DAN TRAI SANG PHAI -> JOHNSON
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DK_10LED_STD_TSP_7LED_STD_PST is
	Port ( CKHT, BTN_N0, SW0: in STD_LOGIC;
			LEDR: out STD_LOGIC_VECTOR(9 downto 0));
end DK_10LED_STD_TSP_7LED_STD_PST;

architecture Behavioral of DK_10LED_STD_TSP_7LED_STD_PST is
SIGNAL ENA_DB, RST: STD_LOGIC;
signal Q_STD_TSP: STD_LOGIC_VECTOR (9 downto 0);
SIGNAL Q_STD_PST: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL OE: STD_LOGIC_VECTOR(1 DOWNTO 0);
Begin
	RST <= NOT BTN_N0;
	LEDR <= Q_STD_TSP OR "000"&Q_STD_PST;
	OE <= "01" WHEN SW0='0' ELSE
		   "10";
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
		PORT MAP ( CKHT => CKHT,
						ENA5HZ => ENA_DB);
	LED10_STD_TSP: ENTITY WORK.LED_STD_TSP
		PORT MAP ( CKHT => CKHT,
						ENA_DB => ENA_DB,
						RST => RST,
						OE => OE(0),
						Q => Q_STD_TSP);
	LED7_STD_PST: ENTITY WORK.LED_STD_PST
		PORT MAP ( CKHT => CKHT,
						ENA_DB => ENA_DB,
						RST => RST,
						OE => OE(1),
						Q => Q_STD_PST);
	
end Behavioral;