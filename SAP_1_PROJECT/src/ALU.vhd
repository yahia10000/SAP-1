-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : SAP_1_PROJECT
-- Author      : asus
-- Company     : asus
--
-------------------------------------------------------------------------------
--
-- File        : d:/Projects/ALDEC_workspace/SAP_1_PROJECT/SAP_1_PROJECT/src/ALU.vhd
-- Generated   : Sat May  4 11:44:16 2024
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
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ALU is
	port(
		SU : in STD_LOGIC_VECTOR(1 downto 0);
		EU : in STD_LOGIC;
		DATA_A : in STD_LOGIC_VECTOR(7 downto 0);
		DATA_B : in STD_LOGIC_VECTOR(7 downto 0);
		DATA_OUT_BUS : out STD_LOGIC_VECTOR(7 downto 0) := "ZZZZZZZZ"
		);
end ALU;

--}} End of automatically maintained section

architecture ARCH of ALU is		

	SIGNAl RESULT: STD_LOGIC_VECTOR(7 downto 0);
	
begin
	
	----Enter your statements here -- 
	
	with SU select 
	RESULT <= 
	DATA_A+DATA_B WHEN "00",
	'0' & DATA_A(7 downto 1) WHEN "01",
	DATA_A(6 downto 0)&'0'   WHEN "10",
	DATA_A-DATA_B WHEN "11",
	"ZZZZZZZZ" WHEN OTHERS;
	
	with EU select 
	DATA_OUT_BUS <= 
	RESULT WHEN '1',
	"ZZZZZZZZ" WHEN OTHERS;
	
end ARCH;
