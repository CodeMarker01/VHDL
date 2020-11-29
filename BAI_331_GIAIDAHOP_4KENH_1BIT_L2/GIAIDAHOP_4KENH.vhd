-- GIAI DA HOP 4 KENH 1 BIT
-- MACH DA HOP 4 KENH 1 BIT
library ieee;
use ieee.std_logic_1164.all;

entity GIAIDAHOP_4KENH is
    Port ( sw: in std_logic_vector(2 downto 0);
             led: out std_logic_vector(3 downto 0)
    );
end GIAIDAHOP_4KENH;
    
architecture quang of GIAIDAHOP_4KENH is
begin
GIAIDAHOP_4KENH_1BIT: entity work.GIAIDAHOP_4KENH_1BIT
    port map( i => sw(2),
                 S => sw (1 downto 0),
                 o => led
    );
end quang;