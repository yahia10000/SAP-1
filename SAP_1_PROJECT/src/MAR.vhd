-------------------------------------------------------------------------------
--
-- Title       : MAR
-- Design      : sap_1
-- Author      : solo
-- Company     : student
--
-------------------------------------------------------------------------------
--
-- File        : D:/ALDEC/files/sap_1/sap_1/src/MAR.vhd
-- Generated   : Sat May  4 23:10:35 2024
-- From        : Interface description file
-- By          : ItfToHdl ver. 1.0
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--    and may be overwritten
--{entity {MAR} architecture {MAR}}

library IEEE;
use IEEE.std_logic_1164.all;

entity MAR is
	port(
		LM_C : in STD_LOGIC;
		CLK : in STD_LOGIC;
		DATA_INPUT : in STD_LOGIC_VECTOR(4 downto 0);
		DATA_OUTPUT_RAM : out STD_LOGIC_VECTOR(4 downto 0));
	
end MAR;

--}} End of automatically maintained section

architecture MAR of MAR is
begin							  
	
	process(CLK)
		
	begin
		
		if rising_edge(CLK) then   
			
			if (LM_C='0' ) then	   
				
				DATA_OUTPUT_RAM <=  DATA_INPUT ;
			end if;
		end if;	 
		
	end process;
	
	-- Enter your statements here --
	
end MAR;