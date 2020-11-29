-- CHUONG TRINH CON DUNG LENH GAN DIEU KIEN
library ieee;
use ieee.std_logic_1164.all;

entity DAHOP_CONDITIONAL_INS is
	Port( i: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			o: out std_logic
	);
end dahOP_CONDITIONAL_INS;

architecture quang of DAHOP_CONDITIONAL_INS is
begin
	o <= I(0) when s="00" else
		  I(1) when s="01" else
		  I(2) when s="10" else
		  I(3);
end quang;