-------------------------------------------------------------------------------
--
-- Title       : RAM
-- Design      : Sap_1
-- Author      : Hema
-- Company     : student
--
-------------------------------------------------------------------------------
--
-- File        : C:/My_Designs/Project/Sap_1/src/RAM.vhd
-- Generated   : Sat May  4 23:24:51 2024
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
--{entity {RAM} architecture {BEHAVORAL}}

library IEEE;
use IEEE.std_logic_1164.all;

entity RAM is
	port(
		CE_c : in STD_LOGIC;
		ADDRESS_IN : in STD_LOGIC_VECTOR(4 downto 0);
		RAM_OUT : out STD_LOGIC_VECTOR(7 downto 0) := "ZZZZZZZZ"
		);
end RAM;

--}} End of automatically maintained section

architecture BEHAVORAL of RAM is
begin
	
	-- Enter your statements here --
	process(CE_c,ADDRESS_IN)
	begin
		
		if CE_c = '1' then
			RAM_OUT <= "ZZZZZZZZ";
		else
			case ADDRESS_IN is	   
				
				--LDA 			000 ADDRESS
				--ADD 			001 ADDRESS
				--SUB 			010 ADDRESS
				--SHIFT LEFT 	011 XXXX
				--SHIFT RIGHT 	100 XXXX
				--OUT			101 XXXX
				--HLT			111 XXXX
				
				when "00000" => RAM_OUT <= "00011111"; -- LDA
				when "00001" => RAM_OUT <= "01011110"; -- SUB
				when "00010" => RAM_OUT <= "10100000"; -- OUT
				when "00011" => RAM_OUT <= "01100000"; -- shift left
				when "00100" => RAM_OUT <= "10100000"; -- out	
				when "00101" => RAM_OUT <= "11100000"; -- hlt	  
				when "00110" => RAM_OUT <= "11100000";	 
				when "00111" => RAM_OUT <= "11110000";
				when "01000" => RAM_OUT <= "00100000"; 
				when "01001" => RAM_OUT <= "00001000";	  
				when "01010" => RAM_OUT <= "00100000"; 
				when "01011" => RAM_OUT <= "00001000";	
				when "01100" => RAM_OUT <= "01000000";	 
				when "01101" => RAM_OUT <= "00000001"; 		  
				when "01110" => RAM_OUT <= "00000010"; 	 
				when "01111" => RAM_OUT <= "00000111"; 	
				
				when "10000" => RAM_OUT <= "00001111";  
				when "10001" => RAM_OUT <= "11100000"; 
				when "10010" => RAM_OUT <= "11011111"; 
				when "10011" => RAM_OUT <= "11100000"; 
				when "10100" => RAM_OUT <= "10010000";	
				when "10101" => RAM_OUT <= "10010000";		  
				when "10110" => RAM_OUT <= "11100000";
				when "10111" => RAM_OUT <= "11110000";
				when "11000" => RAM_OUT <= "00100000"; 
				when "11001" => RAM_OUT <= "00001000";	  
				when "11010" => RAM_OUT <= "00100000"; 
				when "11011" => RAM_OUT <= "00001000";	
				when "11100" => RAM_OUT <= "01000000";	 
				when "11101" => RAM_OUT <= "00000000"; 	
				when "11110" => RAM_OUT <= "00000101"; 	--5
				when "11111" => RAM_OUT <= "00000001"; 	--1
				
				when others => RAM_OUT <= "ZZZZZZZZ";
			end case;		
			
		end if;
		
		
	end	process;
	
	
	
end BEHAVORAL;
