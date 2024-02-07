----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2023 15:22:03
-- Design Name: 
-- Module Name: tst_TOP - Behavioral
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

entity tst_TOP is
--  Port ( );
end tst_TOP;

architecture Behavioral of tst_TOP is

component Top is
  Port (clk,reset: in std_logic; 
   Echo_V : in  STD_LOGIC_Vector( 3 downto 0);
   Trigger : out  STD_LOGIC;
   Buzz: out STD_LOGIC;
   AC,BD: out std_logic_vector(2 downto 0);
   rs : out STD_LOGIC;
   e : out STD_LOGIC;
   lcd_data : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk,reset : STD_LOGIC := '0';
signal Echo_V : STD_LOGIC_Vector( 3 downto 0) := (others=>'0');
signal Trigger,Buzz,rs,e : STD_LOGIC; 
signal  AC,BD : std_logic_vector(2 downto 0);
signal lcd_data : out STD_LOGIC_VECTOR (7 downto 0));

begin

UUT: Top port map(clk=>clk,
    reset=>reset,
    Echo_V=>Echo_V,
    Trigger=>Trigger,
    Buzz=>Buzz,
    AC=>AC,
    BD=>BD,
    rs=>rs,
    e=>e,
    lcd_data=>lcd_data); 

clk_process: process
    begin
        clk <= '0'; wait for 5ns;
        clk <= '1'; wait for 5ns;
    end process;

sim_process: process
    begin
        reset  <= '0'; wait for 2 us;
        echo_v(0) <= '1'; wait for 1ns;
        echo_v(0) <= '0'; wait for 10us;
        echo_v(1) <= '1'; wait for 1ns;
        echo_v(1) <= '0'; wait for 10us;
        echo_v(2) <= '1'; wait for 1ns;
        echo_v(2) <= '0'; wait for 10us;
        echo_v(3) <= '1'; wait for 1ns;
        echo_v(3) <= '0'; wait for 10us;
        echo_v(4) <= '1'; wait for 1ns;
        echo_v(4) <= '0'; wait for 10us;
        
    end process;

end Behavioral;
