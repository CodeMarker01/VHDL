library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GIAIDAHOP_4KENH is
 Port ( SW: in STD_LOGIC_VECTOR (2 downto 0);
 LED: out STD_LOGIC_VECTOR (3 downto 0));
end GIAIDAHOP_4KENH;
architecture Behavioral of GIAIDAHOP_4KENH is
begin
GIAIDAHOP_4KENH_1BIT: ENTITY WORK.GIAIDAHOP_4KENH_1BIT
 PORT MAP( I => SW(2),
 S => SW(1 DOWNTO 0),
 O => LED);
end Behavioral;
