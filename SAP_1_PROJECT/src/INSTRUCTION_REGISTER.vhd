-------------------------------------------------------------------------------
--
-- Title       : INSTRUCTION_REGISTER
-- Design      : sap_1
-- Author      : solo
-- Company     : student
--
-------------------------------------------------------------------------------
--
-- File        : D:/ALDEC/files/sap_1/sap_1/src/INSTRUCTION_REGISTER.vhd
-- Generated   : Sat May  4 23:21:10 2024
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
--{entity {INSTRUCTION_REGISTER} architecture {INSTRUCTION_REGISTER}}

library IEEE;
use IEEE.std_logic_1164.all;

entity INSTRUCTION_REGISTER is
	port(
		LI_C : in STD_LOGIC;
		CLK : in STD_LOGIC;
		CLR : in STD_LOGIC;
		EI_C : in STD_LOGIC;
		DATA_INPUT : in STD_LOGIC_VECTOR(7 downto 0);
		DATA_OUTPUT_BUS : out STD_LOGIC_VECTOR(4 downto 0):= "ZZZZZ";
		DATA_OUTPUT_CONTROLLER : out STD_LOGIC_VECTOR(2 downto 0)
		);
end INSTRUCTION_REGISTER;

--}} End of automatically maintained section

architecture INSTRUCTION_REGISTER of INSTRUCTION_REGISTER is 
	signal content:  STD_LOGIC_VECTOR(7 downto 0);
	
begin
	
	-- Enter your statements here --
	process(clk)
	begin
		if(rising_edge(clk)) then 
			
			if(CLR = '1')then
				content <= "00000000";
			elsif(LI_C = '0') then	 
				content	<=DATA_INPUT;
			end if;
			
		end if;
		
	end	process;
	
	with EI_C select 
	DATA_OUTPUT_BUS <= content(4 downto 0) WHEN '0',
	"ZZZZZ" WHEN OTHERS;
	
	DATA_OUTPUT_CONTROLLER <= content(7 downto 5);
	
end INSTRUCTION_REGISTER;
