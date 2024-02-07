----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2023 05:56:28 PM
-- Design Name: 
-- Module Name: TimeDelay - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TimeDelay is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clkNew : out STD_LOGIC);
end TimeDelay;

architecture Behavioral of TimeDelay is
signal div: std_logic_vector(31 downto 0):=x"1DCD6500";
signal halfDiv: std_logic_vector(27 downto 0):=x"EE6B280";
--signal div: std_logic_vector(2 downto 0):="100";
--signal halfDiv: std_logic_vector(2 downto 0):="010";
signal counter:std_logic_vector(31 downto 0);
signal tmp: std_logic;
begin
process(clk)
begin
if(rising_edge(clk))then
if(reset='1' or counter=div-1)then
counter<=(others=>'0');
end if;
if(counter < halfDiv )then
tmp<='0';
counter<=counter+1;
elsif(counter<div-1)then
tmp<='1';
counter<=counter+1;
else
counter<=(others=>'0');
end if;
end if;
end process;
clkNew<=tmp;
end Behavioral;
