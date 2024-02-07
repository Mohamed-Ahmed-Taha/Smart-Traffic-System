----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2023 01:20:27 AM
-- Design Name: 
-- Module Name: Traffic_system - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Traffic_signal is
    Port ( clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           AC : out STD_LOGIC_vector(2 downto 0);
           BD : out STD_LOGIC_vector(2 downto 0));
end Traffic_signal;

architecture Behavioral of Traffic_signal is
type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14);
signal y: state_type; 
begin
state_process:process(clock,reset)
begin
if(reset='1')then
y<=s0;
elsif(falling_edge(clock))then
case y is
when s0=> 
y<=s1;
when s1=> 
y<=s2;
when s2=> 
y<=s3;
when s3=> 
y<=s4;
when s4=> 
y<=s5;
when s5=> 
y<=s6;
when s6=> 
y<=s7;
when s7=> 
y<=s8;
when s8=> 
y<=s9;
when s9=> 
y<=s10;
when s10=> 
y<=s11;
when s11=> 
y<=s12;
when s12=> 
y<=s13;
when s13=> 
y<=s14;
when others=> 
y<=s1;
end case;
end if;
end process;
output_process:process(y)
begin
case y is
when s0=> 
AC<="000";
BD<="000";
when s1=> 
AC<="100";
BD<="001";
when s2=> 
AC<="100";
BD<="001";
when s3=> 
AC<="100";
BD<="001";
when s4=> 
AC<="100";
BD<="001";
when s5=> 
AC<="100";
BD<="010";
when s6=> 
AC<="100";
BD<="010";
when s7=> 
AC<="100";
BD<="100";
when s8=> 
AC<="001";
BD<="100";
when s9=> 
AC<="001";
BD<="100";
when s10=> 
AC<="001";
BD<="100";
when s11=> 
AC<="001";
BD<="100";
when s12=> 
AC<="010";
BD<="100";
when s13=> 
AC<="010";
BD<="100";
when others=> 
AC<="100";
BD<="100";
end case;
end process;
end Behavioral;
