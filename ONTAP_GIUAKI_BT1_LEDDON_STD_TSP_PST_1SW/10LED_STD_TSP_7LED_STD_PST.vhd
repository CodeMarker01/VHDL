--Bài tập 1
--Thiết kế mạch chạy trên led đơn có 2 chế độ như sau:
--CĐ 1: 10 led sáng dần và tắt dần từ trái sang phải và lặp lại hiển thị
--(LEDR1 đến LEDR10)
--CĐ 2: 7 led sáng dần và tắt dần từ phải sang trái và lặp lại hiển thị
--(LEDR9 đến LEDR3)
--Sử dụng 1 SW để chuyển giữa 2 chế độ.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 10LED_STD_TSP_7LED_STD_PST is
	Port ( CKHT, BTN_N, SW0: in STD_LOGIC;
			LED: out STD_LOGIC_VECTOR(7 downto 0));
end 10LED_STD_TSP_7LED_STD_PST;

architecture Behavioral of 10LED_STD_TSP_7LED_STD_PST is
SIGNAL ENA_DB, RST: STD_LOGIC;
signal Q_STD_PST: STD_LOGIC_VECTOR (7 downto 0);
Begin
	RST <= NOT BTN_N;
	LED <= Q_STD_PST;
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
		PORT MAP ( CKHT => CKHT,
						ENA5HZ => ENA_DB);
	LED_STD_PST: ENTITY WORK.LED_STD_PST
		PORT MAP ( CKHT => CKHT,
						ENA_DB => ENA_DB,
						RST => RST,
						OE => SW0,
						Q => Q_STD_PST);
end Behavioral;