-- CHUONG TRINH CON MA HOA - GAN DIEU KIEN CONDITIONAL
library ieee;
use ieee.std_logic_1164.all;

entity MAHOA_CONDITIONAL_INS is
	Port ( i: in std_logic_vector (3 downto 0);
			 o: out std_logic_vector (1 downto 0);
			 act: out std_logic
	);
end MAHOA_CONDITIONAL_INS;

architecture quang of MAHOA_CONDITIONAL_INS is
begin
--GAN DIEU KIEN
--	o <= "11" WHEN I(3) = '1' else
--			"10" when I(2) = '1' else 
--			"01" when I(1) = '1' else 
--			"00";
--	act <= I(3) or I(2) or I(1) or I(0);

-- GAN DUNG IF
	process(I)
	begin
	if (I(3)='1') then O <= "11";
	elsif (I(2)='1') then O <= "10";
	elsif (I(1)='1') then O <= "01";
	else 						 O <= "00";
	end if;
	act <= I(3) or I(2) or I(1) or I(0);
	end process;

end quang;