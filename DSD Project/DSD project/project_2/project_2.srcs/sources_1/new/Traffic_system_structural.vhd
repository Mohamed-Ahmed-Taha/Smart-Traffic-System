----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2023 01:45:32 AM
-- Design Name: 
-- Module Name: Traffic_system_structural - Behavioral
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

entity Traffic_system_structural is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           AC : out STD_LOGIC_vector(2 downto 0);
           BD : out STD_LOGIC_vector(2 downto 0));
end Traffic_system_structural;

architecture Behavioral of Traffic_system_structural is
component TimeDelay is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clkNew : out STD_LOGIC);
end component;
component Traffic_signal is
    Port ( clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           AC : out STD_LOGIC_vector(2 downto 0);
           BD : out STD_LOGIC_vector(2 downto 0));
end component;
signal connect:std_logic;
begin
unit1:TimeDelay port map(clk,'0',connect);
unit2:Traffic_signal port map(connect,reset,AC,BD);
end Behavioral;
