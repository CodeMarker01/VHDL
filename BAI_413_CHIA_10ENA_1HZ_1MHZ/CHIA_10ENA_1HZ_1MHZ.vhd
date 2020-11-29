-- CHIA 10 XUNG CO ENA
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

entity CHIA_10ENA_1HZ_1MHZ is
Port ( CKHT: in STD_LOGIC;
		LED: out STD_LOGIC_VECTOR(9 DOWNTO 0));
end CHIA_10ENA_1HZ_1MHZ;

architecture Behavioral of CHIA_10ENA_1HZ_1MHZ is
begin
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
	ena1hz => led(0),
	ena2hz => led(1),
	ena5hz => led(2),
	ena10hz => led(3),
	ena20hz => led(4),
	ena25hz => led(5),
	ena50hz => led(6),
	ena100hz => led(7),
	ena1khz => led(8),
	ena1mhz => led(9));
end Behavioral;