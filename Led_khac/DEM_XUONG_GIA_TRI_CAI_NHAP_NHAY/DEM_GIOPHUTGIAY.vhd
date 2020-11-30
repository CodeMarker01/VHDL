
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEM_GIOPHUTGIAY is
    Port ( CKHT, ENA_DB, RST, ENA_UP, ENA_DW, ENA_SS, ENA2HZ : in  STD_LOGIC;
			  GIATRI_MOD: in STD_LOGIC_VECTOR (1 DOWNTO 0);
			  ENA_NN : out STD_LOGIC;
           GIAY, PHUT : out  STD_LOGIC_VECTOR (5 downto 0));
           
end DEM_GIOPHUTGIAY;




architecture Behavioral of DEM_GIOPHUTGIAY is
SIGNAL GIAY_REG, GIAY_NEXT, GIAY_REG_T, GIAY_NEXT_T: STD_LOGIC_VECTOR (5 DOWNTO 0);
SIGNAL PHUT_REG, PHUT_NEXT,PHUT_REG_T, PHUT_NEXT_T: STD_LOGIC_VECTOR (5 DOWNTO 0);
SIGNAL DUNG: STD_LOGIC;
begin
	PROCESS(CKHT,RST)
	BEGIN
		IF RST ='1' THEN	GIAY_REG <= (OTHERS => '0');
								PHUT_REG <= "111011";
								
								GIAY_REG_T <= (OTHERS => '0');
								PHUT_REG_T <= (OTHERS => '0');
								
		ELSIF FALLING_EDGE (CKHT) THEN 	GIAY_REG <= GIAY_NEXT;
													PHUT_REG <= PHUT_NEXT;
													
													
													GIAY_REG_T <= GIAY_NEXT_T;
													PHUT_REG_T <= PHUT_NEXT_T;
													
		END IF;
	END PROCESS;
-----------------------------------------------------------------------------------	
	
	DUNG <= '0' WHEN (GIAY_REG = GIAY_REG_T AND PHUT_REG = PHUT_REG_T) ELSE
			 '1'; 
			 
	ENA_NN <= DUNG;


	PROCESS(GIAY_REG,GIAY_REG_T,ENA_DB, GIATRI_MOD, ENA_UP, ENA_DW, ENA_SS)
	BEGIN
		GIAY_NEXT <= GIAY_REG;
		GIAY_NEXT_T <= GIAY_REG_T;
		
		IF ENA_DB ='1' AND ENA_SS = '1' AND DUNG ='1' THEN
			IF GIAY_REG = "000000" THEN GIAY_NEXT <= "111011";							
			ELSE									GIAY_NEXT <= GIAY_REG - 1;
			END IF;
		ELSIF GIATRI_MOD ="01" AND ENA_UP = '1' AND ENA2HZ ='1'  THEN
		
			IF GIAY_REG_T = "111011" THEN GIAY_NEXT_T <= (OTHERS => '0');							
			ELSE									GIAY_NEXT_T <= GIAY_REG_T + 1;
			END IF;
		ELSIF GIATRI_MOD ="01" AND ENA_DW = '1' AND ENA2HZ ='1' THEN
		
			IF GIAY_REG_T = "000000" THEN GIAY_NEXT_T <= "111011";							
			ELSE									GIAY_NEXT_T <= GIAY_REG_T - 1;
			END IF;
		END IF;
	END PROCESS;
	---------------------------------------------------------------------
	PROCESS(GIAY_REG,PHUT_REG, PHUT_REG_T, ENA_DB,GIATRI_MOD, ENA_UP, ENA_DW, ENA_SS)
	BEGIN
		PHUT_NEXT <= PHUT_REG;
		PHUT_NEXT_T <= PHUT_REG_T;
		IF ENA_DB ='1' AND GIAY_REG = "111011" AND ENA_SS ='1' AND DUNG ='1' THEN
			IF PHUT_REG = "000000" THEN PHUT_NEXT <= "111011";							
			ELSE									PHUT_NEXT <= PHUT_REG - 1;
			END IF;
		ELSIF GIATRI_MOD ="10" AND ENA_UP = '1' AND ENA2HZ ='1' THEN
		
			IF PHUT_REG_T = "111011" THEN PHUT_NEXT_T <= (OTHERS => '0');							
			ELSE									PHUT_NEXT_T <= PHUT_REG_T + 1;
			END IF;
		ELSIF GIATRI_MOD ="10" AND ENA_DW = '1' AND ENA2HZ ='1' THEN
	
			IF PHUT_REG_T = "000000" THEN PHUT_NEXT_T <= "111011";							
			ELSE									PHUT_NEXT_T <= PHUT_REG_T - 1;
			END IF;
		END IF;
	END PROCESS;
	-------------------------------------------------------------------------
	
	
	GIAY <= GIAY_REG WHEN GIATRI_MOD ="00" ELSE GIAY_REG_T;
	PHUT <= PHUT_REG WHEN GIATRI_MOD ="00" ELSE PHUT_REG_T;
	
	
end Behavioral;

