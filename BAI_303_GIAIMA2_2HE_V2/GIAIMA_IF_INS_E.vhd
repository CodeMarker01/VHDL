--- MACH GIAI MA 2 SANG 4 DUNG IF
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GIAIMA_IF_INS is
 Port ( 	I: in STD_LOGIC_VECTOR (1 downto 0);
			O: out STD_LOGIC_VECTOR (3 downto 0));
end GIAIMA_IF_INS;
architecture Behavioral of GIAIMA_IF_INS is
begin
 PROCESS(I)
 BEGIN
 IF I = "00" THEN O <= "0001";
 ELSIF I = "01" THEN O <= "0010";
 ELSIF I = "10" THEN O <= "0100";
 ELSE O <= "1000";
 END IF;
 END PROCESS;
end Behavioral;
