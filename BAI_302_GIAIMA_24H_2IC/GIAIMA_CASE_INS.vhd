library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GIAIMA_CASE_INS is
    Port ( I : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (3 downto 0));
end GIAIMA_CASE_INS;

architecture Behavioral of GIAIMA_CASE_INS is

begin
	PROCESS (I)
	BEGIN 
		CASE I IS
		 WHEN		"00" => O <= "0001";
		 WHEN		"01" => O <= "0010";
		 WHEN		"10" => O <= "0100";
		 WHEN OTHERS  => O <= "1000";
		 END CASE;
	END PROCESS;

end Behavioral;