library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GIAIMA_CASE_INS_E is
    Port ( I : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (3 downto 0);
           E2 : in  STD_LOGIC);
end GIAIMA_CASE_INS_E;

architecture Behavioral of GIAIMA_CASE_INS_E is

begin
	PROCESS (E2,I)
	BEGIN
		CASE E2 IS
			WHEN '0'	 	=> O <= "0000";
			WHEN OTHERS => 
				CASE I IS
					WHEN "00" 	=> O <= "0001";
					WHEN "01" 	=> O <= "0010";
					WHEN "10" 	=> O <= "0100";
					WHEN OTHERS => O <= "1000";
				END CASE;
		END CASE;
	END PROCESS;

end Behavioral;