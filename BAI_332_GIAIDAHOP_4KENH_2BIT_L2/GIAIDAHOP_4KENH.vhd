library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GIAIDAHOP_4KENH is
 Port ( SW: in STD_LOGIC_VECTOR (4 downto 0);
		LED: out STD_LOGIC_VECTOR (7 downto 0);
		LEDR:OUT STD_LOGIC_VECTOR(1 downto 0));
end GIAIDAHOP_4KENH;
architecture Behavioral of GIAIDAHOP_4KENH is
begin
GIAIDAHOP_4KENH_1BIT: ENTITY WORK.GIAIDAHOP_4KENH_1BIT
 PORT MAP( I => SW(4 downto 3),
 S => SW(2 DOWNTO 1),
 e => sw(0),
 E_LED => LEDR(0),
 OA => LED(1 DOWNTO 0),
 OB => LED(3 DOWNTO 2),
 OC => LED(5 DOWNTO 4),
 OD => LED(7 DOWNTO 6));
end Behavioral;
