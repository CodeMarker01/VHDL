library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GIAIMA2_24HE is
    Port ( SW : in  STD_LOGIC_VECTOR (4 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end GIAIMA2_24HE;

architecture Behavioral of GIAIMA2_24HE is

begin
	IC1: ENTITY WORK.GIAIMA_IF_INS_E
		  PORT MAP ( I	=> SW  (1 DOWNTO 0),
						 E => SW  (2), --- 2 chan E giong nhau
						 O => LED (3 DOWNTO 0));
	IC2: ENTITY WORK.GIAIMA_CASE_INS_E
		  PORT MAP ( I	=> SW  (4 DOWNTO 3),
						 E => SW  (2), --- chan E - enable giong nhau
						 O => LED (7 DOWNTO 4));
end Behavioral;