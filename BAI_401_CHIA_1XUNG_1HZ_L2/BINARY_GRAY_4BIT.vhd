library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CHIA_1XUNG_1HZ is
Port ( CKHT: in STD_LOGIC;
led0: out STD_LOGIC);
end CHIA_1XUNG_1HZ;
architecture Behavioral of CHIA_1XUNG_1HZ is
begin
CHIA_XUNG: ENTITY WORK.CHIA_1XUNG
PORT MAP( CKHT => CKHT,
CK1HZ => led0);
end Behavioral;