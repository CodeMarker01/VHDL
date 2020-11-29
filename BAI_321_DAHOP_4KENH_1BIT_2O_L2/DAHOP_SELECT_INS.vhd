-- CHUONG TRINH CON SELECT
library ieee;
use ieee.std_logic_1164.all;

entity DAHOP_SELECT_INS is
	Port( i: in std_logic_vector(3 downto 0);
			s: in std_logic_vector(1 downto 0);
			o: out std_logic
	);
end DAHOP_SELECT_INS;

architecture quang of DAHOP_SELECT_INS is
begin
	with s select
	o <= i(0) when "00",
		  i(1) when "01",
		  i(2) when "10",
		  i(3) when others;

end quang;