library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_8BIT_SS is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
			  ENA_SS : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_8BIT_SS;

architecture Behavioral of DEM_8BIT_SS is
	SIGNAL Q_R: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL Q_N: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL TEMP: STD_LOGIC_VECTOR(1 DOWnto 0);
begin
	TEMP <= ENA_DB & ENA_SS;
	PROCESS (CKHT, RST)
	BEGIN
		IF RST = '1' THEN					 Q_R <= (OTHERS => '0');
		ELSIF FALLING_EDGE (CKHT) THEN Q_R <= Q_N;
		END IF;
	END PROCESS;

	Q_N <= Q_R + 1 WHEN (TEMP = "11") ELSE
			 Q_R;
	Q <= Q_R;

end Behavioral;