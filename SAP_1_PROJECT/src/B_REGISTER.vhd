-------------------------------------------------------------------------------
--
-- Title       : B_REGISTER
-- Design      : sap_1
-- Author      : solo
-- Company     : student
--
-------------------------------------------------------------------------------
--
-- File        : d:/ALDEC/files/sap_1/sap_1/src/B_REGISTER.vhd
-- Generated   : Sat May  4 22:59:54 2024
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
--{entity {B_REGISTER} architecture {B_REGISTER}}

library IEEE;
use IEEE.std_logic_1164.all;

entity B_REGISTER is
	port(
		LB_C : in STD_LOGIC;
		CLK : in STD_LOGIC;
		DATA_INPUT : in STD_LOGIC_VECTOR(7 downto 0);
		DATA_OUTPUT_ALU : out STD_LOGIC_VECTOR(7 downto 0)
		);
end B_REGISTER;

--}} End of automatically maintained section

architecture B_REGISTER of B_REGISTER is
begin
	
	-- Enter your statements here --
	process (CLK)  
	begin
		if(rising_edge(CLK)) then
			if(LB_C = '0')then
				DATA_OUTPUT_ALU <= DATA_INPUT;
			end if;	
		end if;
	end process;
	
	
end B_REGISTER;
