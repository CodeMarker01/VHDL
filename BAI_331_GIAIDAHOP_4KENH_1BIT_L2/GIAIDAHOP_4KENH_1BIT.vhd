-- CHUONG TRINH CON GIAI DA HOP 4 KENH 1 BIT
-- CHUONG TRINH CON SELECT
library ieee;
use ieee.std_logic_1164.all;

entity GIAIDAHOP_4KENH_1BIT is
    Port( i: in std_logic;
            s: in std_logic_vector(1 downto 0);
            o: out std_logic_vector(3 downto 0)
    );
end GIAIDAHOP_4KENH_1BIT;

architecture quang of GIAIDAHOP_4KENH_1BIT is
begin
    process(s)
    begin
    if    (s="00") then o <= "000" & i;
    elsif (s="01") then o <= "00" & i & '0';
    elsif (s="10") then o <= '0' & i & "00";
    elsif (s="11") then o <= i & "000";
    end if;
    end process;

end quang;