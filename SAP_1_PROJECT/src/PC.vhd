-------------------------------------------------------------------------------
--
-- Title       : program_Counter
-- Design      : Sap_1
-- Author      : Hema
-- Company     : student
--
-------------------------------------------------------------------------------
--
-- File        : C:/My_Designs/Project/Sap_1/src/PC.vhd
-- Generated   : Sat May  4 23:03:09 2024
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
--{entity {program_Counter} architecture {behavorial}}

library IEEE;
use IEEE.std_logic_1164.all;  
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity program_Counter is
	port(
		Cp : in STD_LOGIC;
		Ep : in STD_LOGIC;
		Clk_c : in STD_LOGIC;
		Clr_c : in STD_LOGIC;
		Adress_out : out STD_LOGIC_VECTOR(4 downto 0):= "ZZZZZ"
		);
end program_Counter;

--}} End of automatically maintained section

architecture behavorial of program_Counter is	
	signal COUNTING : std_logic_vector(4 downto 0) :="00000";
begin
	
	-- Enter your statements here -- 
	
	process (Clk_c)
	begin 
		
		if(Clr_c = '0') then
			COUNTING <= "00000";
			
		elsif(falling_edge(Clk_c)) then  
			
			if(Cp = '1') then 
				COUNTING <= COUNTING + '1';
			end if;
			
		end if;
		
		
	end process ;
	
	with Ep select 
	Adress_out <= COUNTING WHEN '1',
	"ZZZZZ" WHEN OTHERS;
	
	
end behavorial;
