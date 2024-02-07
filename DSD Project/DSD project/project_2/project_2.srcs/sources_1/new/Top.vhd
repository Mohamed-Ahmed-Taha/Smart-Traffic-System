----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2023 03:37:58 PM
-- Design Name: 
-- Module Name: Top - Structural
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
  Port (clk,reset: in std_logic; 
   Echo_V : in  STD_LOGIC_Vector( 3 downto 0);
   Trigger : out  STD_LOGIC;
   Buzz: out STD_LOGIC;
   AC,BD: out std_logic_vector(2 downto 0);
   rs : out STD_LOGIC;
   e : out STD_LOGIC;
   lcd_data : out STD_LOGIC_VECTOR (7 downto 0));
end Top;

architecture Structural of Top is
    component Traffic_system_structural is 
    Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               AC : out STD_LOGIC_vector(2 downto 0);
               BD : out STD_LOGIC_vector(2 downto 0));
    end component;
    
    component Lcd_controller is
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               rs : out STD_LOGIC;
             --  rw : out STD_LOGIC;
               e : out STD_LOGIC;
               lcd_data : out STD_LOGIC_VECTOR (7 downto 0));
            --   lcd_power : out STD_LOGIC;
             --  lcd_backlight : out STD_LOGIC);
            
    end component;
    
    component Top_UltrasonicSensors is --Ultrasonic Sensor
        Port ( clk : in STD_LOGIC;
               Echo_V : in STD_LOGIC_VECTOR (3 downto 0);
               AC_LED : in STD_LOGIC_VECTOR (2 downto 0); -- Bit2: Green Light, Bit1: Yellow Light, Bit0: Red Light
               BD_LED : in STD_LOGIC_VECTOR (2 downto 0); -- Bit2: Green Light, Bit1: Yellow Light, Bit0: Red Light
               Buzz_Out : out STD_LOGIC;
               Trigger : out STD_LOGIC);
    end component;
    
--    component TimeDelay is 
--        Port ( clk : in STD_LOGIC;
--               reset : in STD_LOGIC;
--               clkNew : out STD_LOGIC);
--    end component;
    
signal ACtmp,BDtmp: std_logic_vector( 2 downto 0);
signal resetSignal: STD_LOGIC;
--signal rstmp,rwtmp,etmp,lcd_powertmp,lcd_backlighttmp :STD_LOGIC;
--signal lcd_datatmp :  STD_LOGIC_VECTOR (7 downto 0);
              
begin

--Inst_TimeDelay: TimeDelay port map (
--        clk => clk,
--        reset => '0',
--        clkNew => resetSignal
--        );

TSS: Traffic_system_structural port map(clk => clk,reset=>reset,AC=>ACtmp,BD=>BDtmp);
  --  AC<=ACtmp;
  --  AC<=ACtmp;
  --  BD<=BDtmp;
    
LCD: Lcd_controller port map(clk=>clk,
         reset => resetSignal,
          rs=>rs,
          e=>e,
          lcd_data=>lcd_data);
USS: Top_UltrasonicSensors port map(
        clk=>clk,
        Echo_V=>Echo_V,
        AC_LED=>ACtmp,
        BD_LED=>BDtmp,
        Buzz_Out=>Buzz,
        Trigger=>Trigger);

end Structural;
