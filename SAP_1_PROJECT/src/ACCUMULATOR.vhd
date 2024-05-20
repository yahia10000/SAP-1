-------------------------------------------------------------------------------
--
-- Title       : ACCUMULATOR
-- Design      : SAP_1_PROJECT
-- Author      : asus
-- Company     : asus
--
-------------------------------------------------------------------------------
--
-- File        : d:/Projects/ALDEC_workspace/SAP_1_PROJECT/SAP_1_PROJECT/src/ACCUMULATOR.vhd
-- Generated   : Sat May  4 12:17:39 2024
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
--{entity {ACCUMULATOR} architecture {ACCUMULATOR}}

library IEEE;
use IEEE.std_logic_1164.all;

entity ACCUMULATOR is
	port(
		LA_C : in STD_LOGIC;
		EA : in STD_LOGIC;
		CLK : in STD_LOGIC;
		DATA_INPUT : in STD_LOGIC_VECTOR(7 downto 0);
		DATA_OUTPUT_BUS : out STD_LOGIC_VECTOR(7 downto 0):= "ZZZZZZZZ";	
		DATA_OUTPUT_ALU : out STD_LOGIC_VECTOR(7 downto 0)
		);
end ACCUMULATOR;

--}} End of automatically maintained section

architecture ACCUMULATOR of ACCUMULATOR is	 	 
	signal CONTENT : std_logic_vector(7 downto 0) ;  --to store data in accumulator
	
	
begin
	
	-- Enter your statements here --
	process (clk)
		
	begin	
		if(rising_edge(clk))		then
			if(LA_C = '0')		then
				CONTENT <= DATA_INPUT;
			end if;
		end if;
	end process;  
	
	
	DATA_OUTPUT_ALU  <= CONTENT; 
	
	with EA select 
	DATA_OUTPUT_BUS <= CONTENT WHEN '1',
	"ZZZZZZZZ" WHEN OTHERS;
	
end ACCUMULATOR;
