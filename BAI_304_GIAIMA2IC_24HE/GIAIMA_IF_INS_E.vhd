library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GIAIMA_IF_INS_E is
    Port ( I : in  STD_LOGIC_VECTOR (1 downto 0);
           E : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (3 downto 0));
end GIAIMA_IF_INS_E;

architecture Behavioral of GIAIMA_IF_INS_E is

begin
	PROCESS (E,I)
	BEGIN 
		IF		E = '0'	THEN O <= "0000";
		ELSE 
			IF		I = "00" THEN O <= "0001";
			ELSIF I = "01" THEN O <= "0010";
			ELSIF I = "10" THEN O <= "0100";
			ELSE 					  O <= "1000";
			END IF;
		END IF;
	END PROCESS;

end Behavioral;