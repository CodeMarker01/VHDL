-- CHIA 10 XUNG
--Xung có tần số 1MHz (CK1MHZ) – chu kỳ 1μs.
--Xung có tần số 1KHz (CK1KHZ) – chu kỳ 1ms.
--Xung có tần số 100Hz (CK100HZ) – chu kỳ 10ms.
--Xung có tần số 50Hz (CK50HZ) – chu kỳ 20ms.
--Xung có tần số 25Hz (CK25HZ) – chu kỳ 40ms.
--Xung có tần số 20Hz (CK20HZ) – chu kỳ 50ms.
--Xung có tần số 10Hz (CK10HZ) – chu kỳ 100ms.
--Xung có tần số 5Hz (CK5HZ) – chu kỳ 200ms.
--Xung có tần số 2Hz (CK2HZ) – chu kỳ 500ms.
--Xung có tần số 1Hz (CK1HZ) – chu kỳ 1s.
-- HE SO CONG TAC 50%
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CHIA_10XUNG_1HZ_1MHZ is
	Port ( CLOCK_50: in STD_LOGIC;
			LEDR: out STD_LOGIC_VECTOR(9 DOWNTO 0));
end CHIA_10XUNG_1HZ_1MHZ;

architecture Behavioral of CHIA_10XUNG_1HZ_1MHZ is
begin
	CHIA_XUNG: ENTITY WORK.CHIA_10XUNG
	PORT MAP( CKHT => CLOCK_50,
				CK1HZ => LEDR(0),
				CK2HZ => LEDR(1),
				CK5HZ => LEDR(2),
				CK10HZ => LEDR(3),
				CK20HZ => LEDR(4),
				CK25HZ => LEDR(5),
				CK50HZ => LEDR(6),
				CK100HZ => LEDR(7),
				CK1KHZ => LEDR(8),
				CK1MHZ => LEDR(9));
end Behavioral;